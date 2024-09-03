import 'dart:io';

import 'package:dio/dio.dart';

extension MultiPart on File {
  Future<MultipartFile> toMultipart() async {
    final fileName = path.split('/').last;
    return await MultipartFile.fromFile(path, filename: fileName);
  }
}