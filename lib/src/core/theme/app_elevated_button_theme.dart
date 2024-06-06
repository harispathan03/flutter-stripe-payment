import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../utils/size_helper/size_extension.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static ElevatedButtonThemeData getAppElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: primaryColor,
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 12.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
    ));
  }
}
