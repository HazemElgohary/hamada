import 'package:flutter/material.dart';

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
}
