import 'package:flutter/material.dart';

enum AppPaddings {
  /// 4px for all
  xxs(EdgeInsets.all(4)),
  /// 4px for Left
  xxsOnlyLeft(EdgeInsets.only(left: 4)),
  /// 4px for Top
  xxsOnlyTop(EdgeInsets.only(top: 4)),
  /// 4px for Right
  xxsOnlyRight(EdgeInsets.only(right: 4)),
  /// 4px for Bottom
  xxsOnlyBottom(EdgeInsets.only(bottom: 4)),
  /// 4px Vertical Spacing
  xxsVertical(EdgeInsets.symmetric(vertical: 4)),
  /// 4px Horizontal Spacing
  xxsHorizontal(EdgeInsets.symmetric(horizontal: 4)),

  /// 8px for all
  xs(EdgeInsets.all(8)),
  /// 8px for Left
  xsOnlyLeft(EdgeInsets.only(left: 8)),
  /// 8px for Top
  xsOnlyTop(EdgeInsets.only(top: 8)),
  /// 8px for Right
  xsOnlyRight(EdgeInsets.only(right: 8)),
  /// 8px for Bottom
  xsOnlyBottom(EdgeInsets.only(bottom: 8)),
  /// 8px Vertical Spacing
  xsVertical(EdgeInsets.symmetric(vertical: 8)),
  /// 8px Horizontal Spacing
  xsHorizontal(EdgeInsets.symmetric(horizontal: 8)),

  /// 16px for all
  sm(EdgeInsets.all(16)),
  /// 16px for Left
  smOnlyLeft(EdgeInsets.only(left: 16)),
  /// 16px for Top
  smOnlyTop(EdgeInsets.only(top: 16)),
  /// 16px for Right
  smOnlyRight(EdgeInsets.only(right: 16)),
  /// 16px for Bottom
  smOnlyBottom(EdgeInsets.only(bottom: 16)),
  /// 16px Vertical Spacing
  smVertical(EdgeInsets.symmetric(vertical: 16)),
  /// 16px Horizontal Spacing
  smHorizontal(EdgeInsets.symmetric(horizontal: 16)),

  /// 24px for all
  md(EdgeInsets.all(24)),
  /// 24px for Left
  mdOnlyLeft(EdgeInsets.only(left: 24)),
  /// 24px for Top
  mdOnlyTop(EdgeInsets.only(top: 24)),
  /// 24px for Right
  mdOnlyRight(EdgeInsets.only(right: 24)),
  /// 24px for Bottom
  mdOnlyBottom(EdgeInsets.only(bottom: 24)),
  /// 24px Vertical Spacing
  mdVertical(EdgeInsets.symmetric(vertical: 24)),
  /// 24px Horizontal Spacing
  mdHorizontal(EdgeInsets.symmetric(horizontal: 24)),

  /// 32px for all
  lg(EdgeInsets.all(32)),
  /// 32px for Left
  lgOnlyLeft(EdgeInsets.only(left: 32)),
  /// 32px for Top
  lgOnlyTop(EdgeInsets.only(top: 32)),
  /// 32px for Right
  lgOnlyRight(EdgeInsets.only(right: 32)),
  /// 32px for Bottom
  lgOnlyBottom(EdgeInsets.only(bottom: 32)),
  /// 32px Vertical Spacing
  lgVertical(EdgeInsets.symmetric(vertical: 32)),
  /// 32px Horizontal Spacing
  lgHorizontal(EdgeInsets.symmetric(horizontal: 32)),

  /// 48px for all
  xl(EdgeInsets.all(48)),
  /// 48px for Left
  xlOnlyLeft(EdgeInsets.only(left: 48)),
  /// 48px for Top
  xlOnlyTop(EdgeInsets.only(top: 48)),
  /// 48px for Right
  xlOnlyRight(EdgeInsets.only(right: 48)),
  /// 48px for Bottom
  xlOnlyBottom(EdgeInsets.only(bottom: 48)),
  /// 48px Vertical Spacing
  xlVertical(EdgeInsets.symmetric(vertical: 48)),
  /// 48px Horizontal Spacing
  xlHorizontal(EdgeInsets.symmetric(horizontal: 48)),

  /// 56px for all
  xxl(EdgeInsets.all(56)),
  /// 56px for Left
  xxlOnlyLeft(EdgeInsets.only(left: 56)),
  /// 56px for Top
  xxlOnlyTop(EdgeInsets.only(top: 56)),
  /// 56px for Right
  xxlOnlyRight(EdgeInsets.only(right: 56)),
  /// 56px for Bottom
  xxlOnlyBottom(EdgeInsets.only(bottom: 56)),
  /// 56px Vertical Spacing
  xxlVertical(EdgeInsets.symmetric(vertical: 56)),
  /// 56px Horizontal Spacing
  xxlHorizontal(EdgeInsets.symmetric(horizontal: 56)),

  /// Custom Padding
  custom(EdgeInsets.zero);

  const AppPaddings(this.edgeInsets);

  final EdgeInsets edgeInsets;
}

extension EdgeInsetsExtension on EdgeInsets {
  EdgeInsets setLeft(double size) => copyWith(left: size);
  EdgeInsets setRight(double size) => copyWith(right: size);
  EdgeInsets setTop(double size) => copyWith(top: size);
  EdgeInsets setBottom(double size) => copyWith(bottom: size);
  EdgeInsets setSymmetric({double? verticalSize, double? horizontalSize}) => copyWith(
        bottom: verticalSize,
        top: verticalSize,
        left: horizontalSize,
        right: horizontalSize,
      );
}
