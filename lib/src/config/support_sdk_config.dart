import 'package:cdp_team_support_sdk/src/config/support_project.dart';
import 'package:flutter/material.dart';

export 'package:cdp_team_support_sdk/src/config/support_project.dart';

/// Called by the SDK interceptor when a request returns 401.
///
/// The host app should attempt to refresh its auth session, persist the
/// refreshed token in its own storage, and return the new bearer token.
/// Return `null` (or throw) to let the SDK treat it as a hard auth
/// failure.
typedef SupportRefreshTokenCallback = Future<String?> Function();

/// Configuration class for the CDP Team Support SDK.
///
/// Set once via [SupportSdkConfig.init] — all SDK screens and API calls
/// read values from [SupportSdkConfig.instance].
class SupportSdkConfig {
  // ── UI / Layout ──────────────────────────────────────────────────────
  final bool isTablet;

  // ── API Config (supplied by the host app) ───────────────────────────

  /// Base URL of the support API (e.g. `https://testphoneapi.cdptv.net/api/`).
  /// Must end with a trailing slash.
  final String baseUrl;

  /// Auth / bearer token of the currently logged-in user, taken from
  /// the host app's own login session.
  final String authToken;

  /// Any extra HTTP headers the host app wants sent with every SDK
  /// request (e.g. `device-type`, `version-number`, `smImages`, etc.).
  /// Mirrors the headers the host app already attaches to its own API
  /// calls — the SDK just forwards them.
  final Map<String, String> extraHeaders;

  /// Fixed project all tickets from this host app will be filed against.
  /// The SDK hides any project picker on the create form and injects
  /// this value as the `helpdeskProjectId` / `projectName` on every
  /// create / update request.
  final SupportProject project;

  // ── Auth callbacks (host-app driven) ─────────────────────────────────

  /// Invoked by the SDK interceptor on a 401. Should refresh the
  /// session, persist the new token in host-app storage, and return
  /// the new bearer token for the SDK to retry the original request.
  /// Returning `null` triggers [onAuthFailed].
  final SupportRefreshTokenCallback? onUnauthorized;

  /// Invoked when refresh fails (or [onUnauthorized] was not supplied).
  /// Host app should clear its session and navigate to login.
  final VoidCallback? onAuthFailed;

  // ── Logging ──────────────────────────────────────────────────────────

  /// When true, the SDK logs every request / response via debugPrint.
  final bool enableLogs;

  // ── Navigator (optional) ─────────────────────────────────────────────

  /// A global navigator key so the SDK can show snack bars.
  /// If null, snack bars use ScaffoldMessenger instead.
  final GlobalKey<NavigatorState>? navigatorKey;

  const SupportSdkConfig({
    this.isTablet = false,
    required this.baseUrl,
    required this.authToken,
    required this.extraHeaders,
    required this.project,
    this.onUnauthorized,
    this.onAuthFailed,
    this.enableLogs = false,
    this.navigatorKey,
  });

  // ── Static singleton ─────────────────────────────────────────────────

  /// Seed instance used before the host app calls [init]. Holds empty /
  /// placeholder values so touching the singleton doesn't throw — the
  /// real values are supplied by the host app via [SupportSdkConfig.init].
  static SupportSdkConfig _instance = const SupportSdkConfig(
    baseUrl: '',
    authToken: '',
    extraHeaders: <String, String>{},
    project: SupportProject.cdpShopWeb,
  );

  static SupportSdkConfig get instance => _instance;

  static void init(final SupportSdkConfig config) => _instance = config;

  /// Swaps the in-memory auth token without requiring the host app to
  /// re-call [init]. Used by the interceptor after a successful refresh.
  static void updateAuthToken(final String token) {
    _instance = _instance.copyWith(authToken: token);
  }

  SupportSdkConfig copyWith({
    final bool? isTablet,
    final String? baseUrl,
    final String? authToken,
    final Map<String, String>? extraHeaders,
    final SupportProject? project,
    final SupportRefreshTokenCallback? onUnauthorized,
    final VoidCallback? onAuthFailed,
    final bool? enableLogs,
    final GlobalKey<NavigatorState>? navigatorKey,
  }) {
    return SupportSdkConfig(
      isTablet: isTablet ?? this.isTablet,
      baseUrl: baseUrl ?? this.baseUrl,
      authToken: authToken ?? this.authToken,
      extraHeaders: extraHeaders ?? this.extraHeaders,
      project: project ?? this.project,
      onUnauthorized: onUnauthorized ?? this.onUnauthorized,
      onAuthFailed: onAuthFailed ?? this.onAuthFailed,
      enableLogs: enableLogs ?? this.enableLogs,
      navigatorKey: navigatorKey ?? this.navigatorKey,
    );
  }

  /// Convenience: standard headers that every SDK API call should include.
  /// Only auth + host-supplied [extraHeaders] — the SDK doesn't inject
  /// any custom identification headers of its own.
  Map<String, String> get apiHeaders =>
      <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (authToken.isNotEmpty) 'Authorization': 'Bearer $authToken',
        ...extraHeaders,
      };
}
