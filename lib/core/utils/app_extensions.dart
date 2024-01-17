import 'dart:ui';

import 'package:intl/intl.dart';

extension NumberFormatting on double {
  String formatAsCurrency({Locale? locale, String? currency}) {
    final formatter = NumberFormat.currency(
      locale: locale?.countryCode ?? 'tr_TR',
      symbol: currency ?? '₺',
      decimalDigits: 2,
    );

    return formatter.format(this);
  }
}
