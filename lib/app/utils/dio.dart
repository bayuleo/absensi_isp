import 'package:asiagolf_app/app/data/repositories/auth/user_credential_data_source.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static final UserCredentialRepositoryImpl _localData = Get.find();

  Dio dio = init();

  static Dio init() {
    var dio = Dio(
      BaseOptions(
        baseUrl: 'https://f12e-180-248-47-99.ngrok-free.app',
        connectTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(minutes: 5),
        followRedirects: false,
        headers: <String, String>{
          'Authorization':
              'Bearer ${_localData.getCredential()?.accessToken ?? ''}',
          'Content-Type': 'application/json',
        },
      ),
    );

    final interceptors = InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }, onError: (DioException e, handler) async {
      if (e.response?.statusCode == 401) {
        showSnack("Session Expired");
        _localData.clearCredential();
        Get.offNamedUntil(
          Routes.LOGIN,
          ModalRoute.withName(Routes.LOGIN),
        );
      }
      return handler.next(e);
    });

    dio.interceptors.add(interceptors);

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    );

    return dio;
  }

  void updateToken() {
    _addHeaderEntries({
      'Authorization':
          'Bearer ${_localData.getCredential()?.accessToken ?? ''}',
    });
  }

  void _addHeaderEntries(Map<String, String> entries) {
    dio.options.headers.addEntries(entries.entries);
  }

  void _removeHeaderEntry(String key) {
    dio.options.headers.remove(key);
  }
}
