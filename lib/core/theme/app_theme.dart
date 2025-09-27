import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

abstract class AppTheme {
  static final ThemeData darkThem = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'janna',
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryColor,
      ),
    ),
    fontFamily: 'janna',
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      )
    ),
  );
}
