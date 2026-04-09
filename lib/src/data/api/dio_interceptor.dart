import 'dart:async';

import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Request/response interceptor for the SDK.
///
/// Responsibilities:
/// 1. Inject auth + common headers from [SupportSdkConfig] on every request.
/// 2. On 401: call [SupportSdkConfig.onUnauthorized] (single-flight) and
///    retry the original request with the refreshed token. If refresh
///    fails, call [SupportSdkConfig.onAuthFailed] so the host app can
///    log the user out.
class SupportDioInterceptor extends InterceptorsWrapper {
  SupportDioInterceptor({super.onRequest, super.onResponse, super.onError});

  /// Single in-flight refresh coordination. When multiple parallel API
  /// calls hit 401 at once, only ONE refresh request is sent — every
  /// other 401 awaits the same Completer. Without this, concurrent
  /// refreshes fight over the refresh token and all but one fail.
  static Completer<String?>? _refreshCompleter;

  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) {
    final SupportSdkConfig cfg = SupportSdkConfig.instance;

    options.headers.addAll(cfg.apiHeaders);

    if (cfg.enableLogs) {
      debugPrint('[SupportSDK] → ${options.method} ${options.uri}');
      if (options.data != null) {
        debugPrint('[SupportSDK]   body: ${options.data}');
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    final Response<dynamic> response,
    final ResponseInterceptorHandler handler,
  ) {
    if (SupportSdkConfig.instance.enableLogs) {
      debugPrint(
        '[SupportSDK] ← ${response.statusCode} ${response.requestOptions.uri}',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) async {
    final SupportSdkConfig cfg = SupportSdkConfig.instance;

    if (cfg.enableLogs) {
      debugPrint(
        '[SupportSDK] ✗ ${err.response?.statusCode} '
        '${err.requestOptions.uri} — ${err.message}',
      );
    }

    if (err.response?.statusCode == 401) {
      // No refresh hook → nothing to do but notify host app.
      if (cfg.onUnauthorized == null) {
        cfg.onAuthFailed?.call();
        return super.onError(err, handler);
      }

      try {
        final String? newAccessToken =
            await _coordinatedRefresh(cfg.onUnauthorized!);

        if (newAccessToken != null && newAccessToken.isNotEmpty) {
          // Cache the fresh token in the SDK singleton so subsequent
          // requests in this session use it. Persistence to host-app
          // storage is the responsibility of the onUnauthorized
          // callback itself.
          SupportSdkConfig.updateAuthToken(newAccessToken);

          // Retry original request with bare Dio (bypasses this
          // interceptor to prevent recursion).
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';
          final Dio retryDio = Dio();
          final Response<dynamic> response =
              await retryDio.fetch(err.requestOptions);
          return handler.resolve(response);
        }

        // Refresh failed
        cfg.onAuthFailed?.call();
      } catch (e) {
        debugPrint('[SupportSDK] 401 retry error: $e');
        cfg.onAuthFailed?.call();
      }
    }

    super.onError(err, handler);
  }

  /// Single-flight refresh coordinator. If a refresh is already in
  /// progress, awaits its result. Otherwise starts a new refresh.
  Future<String?> _coordinatedRefresh(
    final SupportRefreshTokenCallback refresh,
  ) async {
    if (_refreshCompleter != null) {
      debugPrint('[SupportSDK] awaiting in-flight refresh');
      return _refreshCompleter!.future;
    }

    final Completer<String?> completer = Completer<String?>();
    _refreshCompleter = completer;

    try {
      final String? newToken = await refresh();
      completer.complete(newToken);
      return newToken;
    } catch (e) {
      debugPrint('[SupportSDK] refresh error: $e');
      completer.complete(null);
      return null;
    } finally {
      _refreshCompleter = null;
    }
  }
}
