import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

extension ToDay on DateTime {
  String toOurDay() {
    if (day == DateTime.now().day && month == DateTime.now().month && year == DateTime.now().year) {
      return 'today'.tr;
    } else if (day == DateTime.now().day - 1 &&
        month == DateTime.now().month &&
        year == DateTime.now().year) {
      return 'yesterday'.tr;
    } else if (day == DateTime.now().day + 1 &&
        month == DateTime.now().month &&
        year == DateTime.now().year) {
      return 'tomorrow'.tr;
    } else {
      return DateFormat.yMMMd(Get.locale?.countryCode ?? 'en').format(this);
    }
  }

  String toCustomFormat() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String getDayName() {
    return DateFormat('EEEE').format(this);
  }
}
