import 'package:asiagolf_app/app/data/repositories/auth/user_credential_data_source.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static final UserCredentialRepositoryImpl _localData = Get.find();

  static Dio init() {
    final option = BaseOptions(
      // baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
      contentType: Headers.formUrlEncodedContentType,
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

    final dio = Dio(option);

    dio.interceptors.add(interceptors);

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
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
}
