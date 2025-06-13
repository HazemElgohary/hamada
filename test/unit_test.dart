import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:hamada/app/helpers/enums.dart';

void main() {
  test(
    'description',
    () {
      final list = Brands.values.map(
        (e) => 'Routes.${e.name.toUpperCase()} => Brands.${e.name},',
      );
      for (var element in list) {
        print(element);
      }
    },
  );
}
