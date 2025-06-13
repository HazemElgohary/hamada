import 'package:flutter/material.dart';
import 'package:hamada/app/routes/app_pages.dart';

import '../enums.dart';

extension StringExtensions on String {
  DateTime toDate() {
    return DateTime.parse(this);
  }

  TimeOfDay timeOfDay() {
    final finish = split(':');
    return TimeOfDay(
      hour: int.parse(finish.first),
      minute: int.parse(finish[1]),
    );
  }

  Brands getBrand() {
    return switch (this) {
      Routes.TOSHIBA => Brands.toshiba,
      Routes.ZANUSSI => Brands.zanussi,
      Routes.KIRIAZI => Brands.kiriazi,
      Routes.SAMSUNG => Brands.samsung,
      Routes.LG => Brands.lg,
      Routes.SHARP => Brands.sharp,
      Routes.WHITEWHALE => Brands.whiteWhale,
      Routes.WHITEPOINT => Brands.whitePoint,
      Routes.HOOVER => Brands.hoover,
      Routes.DAEWOO => Brands.daewoo,
      Routes.ARISTON => Brands.ariston,
      String() => Brands.zanussi,
    };
  }
}
