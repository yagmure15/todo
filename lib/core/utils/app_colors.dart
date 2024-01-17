import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const blue = Color(0XFFE9F8FE);
  static const purple = Color(0XFF4961EA);
  static const tabBackgroundColor = Color(0XFFF6F7FE);

  static const darkGray = Color(0XFF292D36);
  static const gray = Color(0XFF929292);
  static const lightGray = Color(0XFF959EAD);
  static const red = Color(0XFFEF5350);
  static const lightRed = Color(0XFFFDF1F1);
  static const white = Colors.white;

  static const homeBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [
      Color(0XFF4961EA),
      Color(0XFF4961EA),
      Color(0XFF7849EA),
    ],
  );
}
