import 'dart:convert';

import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/network/dio_config.dart';
import 'package:asiagolf_app/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class AuthDataSource {
  Future<ResponseLoginModel> login(RequestLoginModel data);

  Future<ResponseForgotPasswordModel> forgotPassword(String email);

  Future<ResponseOtpModel> otp(String email, String otp);

  Future<ResponseChangePaswordModel> changePassword(
      String email, String otp, String password);
}

class AuthDataSourceImpl implements AuthDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseLoginModel> login(RequestLoginModel data) async {
    var response = await dioConfigure.dio.post(
      endpoints.auth.login,
      data: jsonEncode(
        data.toJson(),
      ),
    );
    return ResponseLoginModel.fromJson(response.data);
  }

  @override
  Future<ResponseForgotPasswordModel> forgotPassword(String email) async {
    var data = {'email': email};
    var response = await dioConfigure.dio.post(
      endpoints.auth.forgotPassword,
      data: jsonEncode(
        data,
      ),
    );
    return ResponseForgotPasswordModel.fromJson(response.data);
  }

  @override
  Future<ResponseOtpModel> otp(String email, String otp) async {
    var data = {
      'email': email,
      'otpCode': otp,
    };
    var response = await dioConfigure.dio.post(
      endpoints.auth.otp,
      data: jsonEncode(
        data,
      ),
    );
    return ResponseOtpModel.fromJson(response.data);
  }

  @override
  Future<ResponseChangePaswordModel> changePassword(
      String email, String otp, String password) async {
    var data = {
      'email': email,
      'otpCode': otp,
      'newPassword': password,
    };
    var response = await dioConfigure.dio.post(
      endpoints.auth.changePassword,
      data: jsonEncode(
        data,
      ),
    );
    return ResponseChangePaswordModel.fromJson(response.data);
  }
}
