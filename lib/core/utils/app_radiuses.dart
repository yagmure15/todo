import 'package:flutter/material.dart';

enum AppRadiuses {
  /// 4px.
  xxs(4),

  /// 8px.
  xs(8),

  /// 16px.
  sm(16),

  /// 24px.
  md(24),

  /// 32px.
  lg(32),

  /// 48px.
  xl(48),

  /// 56px.
  xxl(56),

  /// 64px.
  xxxl(64);

  const AppRadiuses(this.px);

  final double px;

  BorderRadius get radius => BorderRadius.circular(px);
  
  BorderRadius only({bool topLeft = false, bool topRight = false, bool bottomLeft = false, bool bottomRight = false}) =>
      BorderRadius.only(
        topLeft: _rd(topLeft),
        topRight: _rd(topRight),
        bottomLeft: _rd(bottomLeft),
        bottomRight: _rd(bottomRight),
      );
  BorderRadius vertical({bool top = false, bool bottom = false}) => BorderRadius.vertical(
        top: _rd(top),
        bottom: _rd(bottom),
      );

  Radius _rd(bool bl) => Radius.circular(bl ? px : 0);
}
