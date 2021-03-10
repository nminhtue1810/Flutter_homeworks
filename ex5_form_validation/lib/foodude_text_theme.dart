import 'package:ex5_form_validation/app_colors.dart';
import 'package:ex5_form_validation/text_styles.dart';
import 'package:flutter/material.dart';

class TextThemeApp {
  static TextTheme primaryTextTheme = TextTheme(
    headline2: StyleText.headline2,
  ).apply(displayColor: AppColors.primaryColor);

  static TextTheme accentTextTheme =
      primaryTextTheme.copyWith().apply(displayColor: AppColors.accentColor);
}
