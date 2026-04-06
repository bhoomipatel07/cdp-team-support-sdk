import 'package:flutter/material.dart';

/// Configuration class for the CDP Team Support SDK.
///
/// Set once via [SupportSdkConfig.init] — all SDK screens and API calls
/// read values from [SupportSdkConfig.instance].
class SupportSdkConfig {
  // ── UI / Layout ──────────────────────────────────────────────────────
  final bool isTablet;

  // ── User Info (for conversations) ────────────────────────────────────
  final String currentUserName;
  final String currentUserInitials;

  // ── API Config (differs per host app) ────────────────────────────────

  /// Base URL of the support API (e.g. `https://api.cdpphoto.com`).
  final String baseUrl;

  /// API key issued per app / client.
  final String apiKey;

  /// Unique identifier for the host application
  /// (e.g. `cdp-photo-flutter`, `cdp-streaming-flutter`).
  final String appId;

  /// Auth / bearer token of the currently logged-in user.
  /// Passed by the host app from its own login session.
  final String authToken;

  /// Any extra HTTP headers the host app wants sent with every SDK request
  /// (e.g. `{'X-Tenant': 'photo-app'}`).
  final Map<String, String> extraHeaders;

  // ── Navigator (optional) ─────────────────────────────────────────────

  /// A global navigator key so the SDK can show snack bars.
  /// If null, snack bars use ScaffoldMessenger instead.
  final GlobalKey<NavigatorState>? navigatorKey;

  const SupportSdkConfig({
    this.isTablet = false,
    this.currentUserName = 'User',
    this.currentUserInitials = 'U',
    this.baseUrl = '',
    this.apiKey = '',
    this.appId = '',
    this.authToken = '',
    this.extraHeaders = const <String, String>{},
    this.navigatorKey,
  });

  // ── Static singleton ─────────────────────────────────────────────────

  static SupportSdkConfig _instance = const SupportSdkConfig();
  static SupportSdkConfig get instance => _instance;
  static void init(SupportSdkConfig config) => _instance = config;

  /// Convenience: standard headers that every SDK API call should include.
  Map<String, String> get apiHeaders => <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (authToken.isNotEmpty) 'Authorization': 'Bearer $authToken',
        if (apiKey.isNotEmpty) 'X-Api-Key': apiKey,
        if (appId.isNotEmpty) 'X-App-Id': appId,
        ...extraHeaders,
      };
}
