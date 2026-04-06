import 'package:flutter/material.dart';

class SdkColors {
  // Primary brand
  static const Color primaryColor = Color(0xFF1A4775);
  static const Color secondaryColor = Color(0xFF2566A8);
  static const Color splashDeep = Color(0xFF0D2951);
  static const Color splashGlow = Color(0xFF1A4775);
  static const Color splashGlowBright = Color(0xFF3185DB);
  static const Color splashGold = Color(0xFFD4982A);

  // Backgrounds
  static const Color bgColor = Color(0xFFF3F9FF);
  static const Color cardColor = Colors.white;

  // Borders & Shadows
  static const Color homeBorder = Color(0xFFE3EDF7);
  static const Color homeShadow = Color(0x141A4775);
  static const Color homeSubtext = Color(0xFF6B8CAB);

  // Error
  static const Color colorError500 = Color(0xFFD60000);
}

LinearGradient sdkLinearGradient = const LinearGradient(
  colors: <Color>[
    Color(0xff1A4775),
    Color(0xff2566A8),
    Color(0xff2B75C1),
    Color(0xff2E7DCE),
    Color(0xff2F81D5),
    Color(0xff3185DB),
  ],
);
