
import 'package:base_clean_architecture/core/util/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class MainTheme {

  final ThemeData light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.backgroundLight,
    accentColor: AppColors.white,
  );

  final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.backgroundDark,
    accentColor: AppColors.black,
  );

}