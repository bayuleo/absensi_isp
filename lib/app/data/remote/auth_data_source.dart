import 'dart:convert';

import 'package:asiagolf_app/app/data/model/auth/login/request_login_model.dart';
import 'package:asiagolf_app/app/data/model/auth/login/response_login_model.dart';
import 'package:asiagolf_app/app/network/dio_config.dart';
import 'package:asiagolf_app/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class AuthDataSource {
  Future<ResponseLoginModel> login(RequestLoginModel data);
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

  // @override
  // Future<ResponseSignIn> signIn(RequestSignIn data) async {
  //   var response = await dioConfigure.dio.post(
  //     endpoints.auth.signin,
  //     data: jsonEncode(
  //       data.toJson(),
  //     ),
  //   );
  //   return ResponseSignIn.fromJson(response.data);
  // }
  //
  // @override
  // Future<ResponseSignUp> signUp(RequestSignUp data) async {
  //   var response = await dioConfigure.dio.post(
  //     endpoints.auth.signup,
  //     data: jsonEncode(data.toJson()),
  //   );
  //   return ResponseSignUp.fromJson(response.data);
  // }
  //
  // @override
  // Future<ResponseForgotPassword> forgotPassword(
  //     RequestForgotPassword data) async {
  //   var response = await dioConfigure.dio.post(
  //     endpoints.auth.forgotPassword,
  //     data: jsonEncode(
  //       data.toJson(),
  //     ),
  //   );
  //   return ResponseForgotPassword.fromJson(response.data);
  // }
  //
  // @override
  // Future<ResponseOtp> verifyOTP(RequestOtp data) async {
  //   var response = await dioConfigure.dio.post(
  //     endpoints.auth.otp,
  //     data: jsonEncode(
  //       data.toJson(),
  //     ),
  //   );
  //   return ResponseOtp.fromJson(response.data);
  // }
  //
  // @override
  // Future<ResponseResetPassword> resetPassword(RequestResetPassword data) async {
  //   var response = await dioConfigure.dio.post(
  //     endpoints.auth.resetPassword,
  //     data: jsonEncode(
  //       data.toJson(),
  //     ),
  //   );
  //   return ResponseResetPassword.fromJson(response.data);
  // }
  //
  // @override
  // Future<ResponseSignOut> signOut() async {
  //   var response = await dioConfigure.dio.post(
  //     endpoints.auth.signout,
  //   );
  //   return ResponseSignOut.fromJson(response.data);
  // }
  //
  // @override
  // Future<ResponseCheckNis> checkNIS(RequestCheckNis data) async {
  //   var response = await dioConfigure.dio.post(
  //     endpoints.auth.checkNIS,
  //     data: jsonEncode(
  //       data.toJson(),
  //     ),
  //   );
  //   return ResponseCheckNis.fromJson(response.data);
  // }
  //
  // @override
  // Future<ResponseGenerateOtp> generateOTP(RequestGenerateOtp data) async {
  //   var response = await dioConfigure.dio.post(
  //     endpoints.auth.generateOTP,
  //     data: jsonEncode(
  //       data.toJson(),
  //     ),
  //   );
  //   return ResponseGenerateOtp.fromJson(response.data);
  // }
  //
  // @override
  // Future<ResponseValidateOtp> validateOTP(RequestValidateOtp data) async {
  //   var response = await dioConfigure.dio.post(
  //     endpoints.auth.validateOTP,
  //     data: jsonEncode(
  //       data.toJson(),
  //     ),
  //   );
  //   return ResponseValidateOtp.fromJson(response.data);
  // }
}
