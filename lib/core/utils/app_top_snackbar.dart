import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppTopSnackbar {
  AppTopSnackbar._();

  static void _show(BuildContext context, Widget snackBar) {
    showTopSnackBar(
      Overlay.of(context),
      snackBar,
    );
  }

  static void showInfo(BuildContext context, String message) {
    final snackBar = CustomSnackBar.info(
      message: message,
    );
    _show(context, snackBar);
  }

  static void showError(BuildContext context, String message) {
    final snackBar = CustomSnackBar.error(
      message: message,
    );
    _show(context, snackBar);
  }

  static void showSuccess(BuildContext context, String message) {
    final snackBar = CustomSnackBar.success(
      message: message,
    );
    _show(context, snackBar);
  }
}
