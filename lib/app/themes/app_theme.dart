import 'package:flutter/material.dart';
import 'package:test_stacked/app/themes/app_colors.dart';

class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: AppColors.lightColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightColorScheme.primary,
    ),
    scaffoldBackgroundColor: AppColors.lightColorScheme.background,
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: AppColors.darkColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkColorScheme.primary,
    ),
    scaffoldBackgroundColor: AppColors.darkColorScheme.background,
  );
}
