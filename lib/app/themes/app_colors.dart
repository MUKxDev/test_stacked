import 'package:flutter/material.dart';

class AppColors {
  static const Color whtie = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);

  // light
  static const Color yellow = Color(0xffffb703);

  // dark
  static const Color darkYellow = Color(0xffee9b00);
  static const Color navy = Color(0xff023047);

  // light ColorSchemes
  static ColorScheme lightColorScheme = const ColorScheme.light().copyWith(
    primary: AppColors.yellow,
  );

  // dark ColorSchemes
  static ColorScheme darkColorScheme = const ColorScheme.dark().copyWith(
    primary: AppColors.darkYellow,
    background: AppColors.navy,
  );
}
