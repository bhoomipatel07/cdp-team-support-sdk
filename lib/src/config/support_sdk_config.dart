import 'package:flutter/material.dart';

/// Configuration class for the CDP Team Support SDK.
class SupportSdkConfig {
  final bool isTablet;
  final GlobalKey<NavigatorState>? navigatorKey;

  /// Current user info for conversations
  final String currentUserName;
  final String currentUserInitials;

  const SupportSdkConfig({
    this.isTablet = false,
    this.navigatorKey,
    this.currentUserName = 'User',
    this.currentUserInitials = 'U',
  });

  /// Static instance for easy access within SDK
  static SupportSdkConfig _instance = const SupportSdkConfig();
  static SupportSdkConfig get instance => _instance;
  static void init(SupportSdkConfig config) => _instance = config;
}
