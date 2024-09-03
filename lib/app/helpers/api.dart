import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'keys.dart';
import 'prefs.dart';

class DioWrapper {
  final Dio dio;

  DioWrapper(this.dio);

  Future<Response> _validate(Response res) async {
    if (res.statusCode == 500) {
      throw 'Server Error';
    } else if (res.statusCode == 401) {
      final lang = Prefs.getString(PrefsKeys.lang);
      Prefs.clear();
      Prefs.setString(PrefsKeys.lang, lang);
      // Get.offAllNamed(Routes.SIGN_IN_SCREEN);
    }
    // else if (res.data == null) {
    //   throw 'api returned null response';
    // }
    return res;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    try {
      final res = await dio.get(path,
          queryParameters: query,
          options: Options(headers: {
            // 'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (Prefs.getString(PrefsKeys.token).isNotEmpty)
              HttpHeaders.authorizationHeader: 'Bearer ${Prefs.getString(PrefsKeys.token)}',
            ...headers,
          }),
          onReceiveProgress: (ds, sd) {});
      return _validate(res);
    } on DioException catch (e, st) {
      log(e.toString());
      log(st.toString());
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw 'please_check_your_connection'.tr;
      }
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    try {
      final res = await dio.post(
        path,
        data: body,
        queryParameters: query,
        options: Options(
          headers: {
            // 'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (Prefs.getString(PrefsKeys.token).isNotEmpty)
              HttpHeaders.authorizationHeader: 'Bearer ${Prefs.getString(PrefsKeys.token)}',
            ...headers,
          },
          contentType: contentType,
        ),
        onSendProgress: (count, total) {
          log('count : $count');
          log('total : $total');
          log('percentage : ${((count / total) * 100).toStringAsFixed(0)}');
        },
      );
      return _validate(res);
    } on DioException catch (e, st) {
      log(e.toString());
      log(st.toString());
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw 'please_check_your_connection'.tr;
      }
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    try {
      final res = await dio.put(
        path,
        data: body,
        queryParameters: query,
        options: Options(headers: {
          // 'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (Prefs.getString(PrefsKeys.token).isNotEmpty)
            HttpHeaders.authorizationHeader: 'Bearer ${Prefs.getString(PrefsKeys.token)}',
          ...headers,
        }),
      );
      return _validate(res);
    } on DioException catch (e, st) {
      log(e.toString());
      log(st.toString());
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw 'please check your connection'.tr;
      }
      rethrow;
    }
  }

  Future<Response> delete(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    try {
      final res = await dio.delete(
        path,
        data: body,
        queryParameters: query,
        options: Options(
          headers: {
            // 'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (Prefs.getString(PrefsKeys.token).isNotEmpty)
              HttpHeaders.authorizationHeader: 'Bearer ${Prefs.getString(PrefsKeys.token)}',
            ...headers,
          },
        ),
      );
      return _validate(res);
    } on DioException catch (e, st) {
      log(e.toString());
      log(st.toString());
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw 'please_check_your_connection'.tr;
      }
      rethrow;
    }
  }
}

// Api facade
class Api {
  static DioWrapper get _client => Get.find<DioWrapper>();

  static Future<Response> get(
    String path, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    return _client.get(
      path,
      query: query,
      headers: headers,
      attachToken: attachToken,
    );
  }

  static Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    return _client.post(
      path,
      body: body,
      headers: headers,
      query: query,
      contentType: contentType,
      attachToken: attachToken,
    );
  }

  static Future<Response> put(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    return _client.put(
      path,
      body: body,
      headers: headers,
      query: query,
      attachToken: attachToken,
    );
  }

  static Future<Response> delete(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    return _client.delete(
      path,
      body: body,
      headers: headers,
      query: query,
    );
  }
}
