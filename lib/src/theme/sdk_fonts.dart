import 'package:flutter/material.dart';

const String _kFont = 'packages/cdp_team_support_sdk/Rubik';

TextStyle sdkRubikW400({bool isTablet = false}) => TextStyle(
      fontFamily: _kFont,
      fontWeight: FontWeight.w400,
      fontSize: isTablet ? 20 : 16.0,
      color: Colors.black,
    );

TextStyle sdkRubikW500({bool isTablet = false}) => TextStyle(
      fontFamily: _kFont,
      fontWeight: FontWeight.w500,
      fontSize: isTablet ? 20 : 16.0,
      color: Colors.black,
    );

TextStyle sdkRubikW600({bool isTablet = false}) => TextStyle(
      fontFamily: _kFont,
      fontWeight: FontWeight.w600,
      fontSize: isTablet ? 20 : 16.0,
      color: Colors.black,
    );

TextStyle sdkRubikW700({bool isTablet = false}) => TextStyle(
      fontFamily: _kFont,
      fontWeight: FontWeight.w700,
      fontSize: isTablet ? 20 : 16.0,
      color: Colors.black,
    );

TextStyle sdkRobotoBold({bool isTablet = false}) => TextStyle(
      fontFamily: _kFont,
      fontWeight: FontWeight.w700,
      fontSize: isTablet ? 20 : 16.0,
      color: Colors.black,
    );
