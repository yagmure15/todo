import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

enum AppTextStyle {
  headline1(
    TextStyle(
      fontSize: 24,
      height: 1.2,
      debugLabel: 'Headline 1',
      color: AppColors.darkGray,
    ),
  ),
  headline2(
    TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      height: 1.2,
      debugLabel: 'Headline 2',
      color: AppColors.darkGray,
    ),
  ),
  subtitle1(
    TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.2,
      debugLabel: 'Subtitle 1',
    ),
  ),
  subtitle2(
    TextStyle(
      fontSize: 14,
      height: 1.2,
      debugLabel: 'Subtitle 2',
      color: AppColors.lightGray,
    ),
  ),
  bodytext1(
    TextStyle(
      fontSize: 12,
      height: 1.2,
      debugLabel: 'Bodytext 1',
      color: AppColors.lightGray,
    ),
  ),
  bodytext2(
    TextStyle(
      fontSize: 12,
      height: 1.2,
      fontWeight: FontWeight.w500,
      debugLabel: 'Bodytext 2',
      color: AppColors.darkGray,
    ),
  ),
  button(
    TextStyle(
      fontSize: 11,
      height: 1.2,
      debugLabel: 'Button',
      color: AppColors.darkGray,
    ),
  ),
  caption(
    TextStyle(
      fontSize: 9,
      height: 1.2,
      debugLabel: 'Caption',
      color: AppColors.darkGray,
    ),
  );

  const AppTextStyle(this.style);
  final TextStyle style;
}

extension TextStylesExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle changeColor({required Color color}) => copyWith(color: color);
  TextStyle changeSize(double size) => copyWith(fontSize: size);
  TextStyle get fontWeight500 => copyWith(fontWeight: FontWeight.w500);
}
