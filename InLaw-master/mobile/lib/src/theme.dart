import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF011C2E);
  static const primaryLight = Color(0xff2c4357);
  static const primaryDark = Color(0xff000005);
  static const textLight = Color(0xffffffff);
  static const text = Color(0xffffffff);
  static const secondary = Color(0xffeeb210);
  static const divider = Color(0xff718792);
}

TextStyle get _headline1 => const TextStyle(
      fontSize: 28,
      fontFamily: 'Kanit',
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    );

OutlinedButtonThemeData get _outlineButtonTheme => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary)),
    );

ThemeData getTheme() {
  final theme = ThemeData.light().copyWith(
    backgroundColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.primary,
      outlinedButtonTheme: _outlineButtonTheme,
      colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primary,
          onPrimary: AppColors.textLight,
          primaryContainer: AppColors.primaryDark,
          onPrimaryContainer: AppColors.text,
          secondary: AppColors.secondary,
          onTertiary: AppColors.textLight));
  return theme;
}
