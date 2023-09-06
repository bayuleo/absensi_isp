import 'package:asiagolf_app/app/data/model/auth/forgot_password/request_forgot_password_model.dart';
import 'package:asiagolf_app/app/data/model/auth/login/request_login_model.dart';
import 'package:asiagolf_app/app/data/model/auth/login/response_login_model.dart';
import 'package:asiagolf_app/app/data/model/auth/logout/request_logout_model.dart';
import 'package:asiagolf_app/app/data/model/auth/register/request_register_model.dart';
import 'package:asiagolf_app/app/data/model/auth/register/response_register_data_model.dart';
import 'package:asiagolf_app/app/data/model/auth/register/response_register_model.dart';
import 'package:asiagolf_app/app/data/model/auth/send_otp/request_send_otp_model.dart';
import 'package:asiagolf_app/app/data/model/auth/verify_otp/request_verify_otp_model.dart';
import 'package:asiagolf_app/app/data/repositories/auth/user_credential_data_source.dart';
import 'package:asiagolf_app/app/domain/entities/login_entity.dart';
import 'package:asiagolf_app/app/domain/entities/register_entity.dart';
import 'package:asiagolf_app/app/domain/repositories/auth_repository.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/send_otp.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/verify_otp.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/login.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../utils/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _dio = DioHelper.init();
  final UserCredentialRepositoryImpl _localData = Get.find();

  @override
  Future<Result<LoginEntity>> login(RequestLoginModel params) async {
    var enpoint = "/auth/signin";
    try {
      var response = await _dio.get(
        enpoint,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        var auth = ResponseLoginModel.fromJson(response.data);
        await _localData.updateCredential(auth.data!);
        return Result.success(auth.data!);
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      return Result.error(
        message: e.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<RegisterEntity>> register(RequestRegisterModel param) async {
    var endpoint = "/auth/signup";

    try {
      var response = await _dio.get(
        endpoint,
        data: param.toJson(),
      );

      if (response.statusCode == 200) {
        var auth = ResponseRegisterModel.fromJson(response.data);
        return Result.success(auth.data!);
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode!,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      return Result.error(
        message: e.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<bool>> logout(RequestLogoutModel param) async {
    var endpoint = "/auth/signup";

    try {
      var response = await _dio.post(
        endpoint,
        data: param.toJson(),
      );

      if (response.statusCode == 200) {
        return Result.success(true);
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode!,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      return Result.error(
        message: e.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<bool>> forgotPassword(RequestForgotPasswordModel params) async {
    var endpoint = "/auth/forgot_pass";

    try {
      var response = await _dio.post(
        endpoint,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return Result.success(true);
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode!,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      return Result.error(
        message: e.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<bool>> sendOtp(RequestSendOtpModel params) async {
    var endpoint = "/auth/send_otp";

    try {
      var response = await _dio.post(
        endpoint,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return Result.success(true);
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode!,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      return Result.error(
        message: e.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<bool>> verifyOtp(RequestVerifyOtpModel params) async {
    var endpoint = "/auth/verify_otp";

    try {
      var response = await _dio.post(
        endpoint,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return Result.success(true);
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode!,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      return Result.error(
        message: e.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }
}
