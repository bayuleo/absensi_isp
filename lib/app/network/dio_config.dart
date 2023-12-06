import 'package:asiagolf_app/app/data/local/user_credentials_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../routes/app_pages.dart';

class DioConfigure {
  static final UserCredentialsDataSource _userCredentialsRepository =
      Get.find();

  // contact with real API
  Dio dio = createDio();

  // contact with Mock API
  Dio dioMock = createDio(true);

  // final tokenDio = Dio(BaseOptions(baseUrl: FlavorConfigs.baseURL));

  DioConfigure._internal();

  static final _singleton = DioConfigure._internal();

  factory DioConfigure() => _singleton;

  static Dio createDio([bool isMock = false]) {
    var dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.ccpmanagement.my.id/',
        receiveTimeout: const Duration(seconds: 30),
        // 15 seconds
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: <String, String>{
          'Authorization':
              'Bearer ${_userCredentialsRepository.getUserCredentials().accessToken}',
          'Content-Type': 'application/json',
          'X-Astabrata-Key':
              'KsU5RECDcggVAj5Xki5nORZb4A1Bw+T3p9h3sBv96CrU8Ww5rKDMahPDDLueToq+EEhbSzbLdmMfX+6GDUcgFI28vPngcpj1kRTFgeRs9n+dZyhkXoNGAivkqmXaikIRqwmwKFaLaIFRN4//vMpju/9OuPc0fkwu4l4PUnI5zok='
        },
      ),
    );

    dio.interceptors.addAll({
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    });

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final credential = _userCredentialsRepository.getUserCredentials();
          final accessToken = credential.accessToken;
          options.headers['Authorization'] = 'Bearer $accessToken';
          handler.next(options);
        },
        onError: (error, handler) async {
          // only call refresh token when
          // - statusCode is 401
          // - response data is empty
          // - request path not contain refresh
          if (error.response?.statusCode == 401) {
            // try {
            //   // prevent duplicate call refreshToken
            //   refreshTokenRequest = refreshTokenRequest ?? refreshToken();
            //   await refreshTokenRequest;
            //   refreshTokenRequest = null;
            //   // retry call api
            //   final res = await _retry(error.requestOptions);
            //   handler.resolve(res);
            // } catch (e) {
            Fluttertoast.showToast(msg: "Session Expired");
            _userCredentialsRepository.clearToken();
            Get.offNamedUntil(
              Routes.LOGIN,
              ModalRoute.withName(Routes.LOGIN),
            );
            // }
            // refreshTokenRequest = null;
            return;
          }
          handler.next(error);
        },
      ),
    );

    return dio;
  }

  void updateToken() {
    _addHeaderEntries({
      'Authorization':
          'Bearer ${_userCredentialsRepository.getUserCredentials().accessToken}',
    });
  }

  void addOtp(String otp) {
    _addHeaderEntries({
      'Header-OTP': otp,
    });
  }

  void removeOtp() {
    _removeHeaderEntry('Header-OTP');
  }

  void _addHeaderEntries(Map<String, String> entries) {
    dio.options.headers.addEntries(entries.entries);
  }

  void _removeHeaderEntry(String key) {
    dio.options.headers.remove(key);
  }
}
