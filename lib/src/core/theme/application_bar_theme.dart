import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class ApplicationBarTheme {
  ApplicationBarTheme._();

  static AppBarTheme getAppBarTheme() {
    return const AppBarTheme(
      color: white,
      elevation: 0,
      titleSpacing: 0,
    );
  }
}
