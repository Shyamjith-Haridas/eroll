import 'package:eroll/core/themes/app_text_theme.dart';
import 'package:eroll/core/themes/appbar_themes.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Color.fromRGBO(248, 247, 251, 1),
    textTheme: AppTextTheme.textTheme,
    appBarTheme: AppBarThemes.appBarTheme,
  );
}
