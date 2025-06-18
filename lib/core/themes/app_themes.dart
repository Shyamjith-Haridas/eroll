import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/themes/app_text_theme.dart';
import 'package:eroll/core/themes/appbar_themes.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    // scaffoldBackgroundColor: Color.fromRGBO(248, 247, 251, 1),
    scaffoldBackgroundColor: AppColors.white,
    textTheme: AppTextTheme.textTheme,
    appBarTheme: AppBarThemes.appBarTheme,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
