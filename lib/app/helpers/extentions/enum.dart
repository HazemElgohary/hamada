import 'package:flutter/material.dart';
import 'package:hamada/app/config/constants.dart';
import 'package:hamada/app/helpers/enums.dart';

extension BrandsEx on Brands {
  Color getColor() {
    return switch (this) {
      Brands.toshiba => Colors.red,
      Brands.zanussi => const Color(0xffffe001),
      Brands.kiriazi => Colors.green,
      Brands.samsung => Colors.grey,
      Brands.lg => Colors.red,
      Brands.sharp => Colors.red,
      Brands.whiteWhale => Colors.blue,
      Brands.whitePoint => Colors.blue,
      Brands.hoover => Colors.blue,
      Brands.daewoo => Colors.red,
      Brands.ariston => Colors.red,
    };
  }

  List<String> getImages() {
    return switch (this) {
      Brands.toshiba => Constants.toshibaImages,
      Brands.zanussi => Constants.zanossiImages,
      Brands.kiriazi => [],
      Brands.samsung => [],
      Brands.lg => [],
      Brands.sharp => [],
      Brands.whiteWhale => [],
      Brands.whitePoint => [],
      Brands.hoover => [],
      Brands.daewoo => [],
      Brands.ariston => [],
    };
  }
}
