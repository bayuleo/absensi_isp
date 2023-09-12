import 'dart:convert';

import 'package:asiagolf_app/app/data/model/auth/api_response_model.dart';
import 'package:asiagolf_app/app/data/model/auth/auth_data_model.dart';
import 'package:asiagolf_app/app/data/model/auth/common_model.dart';
import 'package:asiagolf_app/app/data/model/auth/register_data_model.dart';
import 'package:asiagolf_app/app/data/repositories/auth/user_credential_data_source.dart';
import 'package:asiagolf_app/app/domain/entities/auth/auth_entity.dart';
import 'package:asiagolf_app/app/domain/entities/auth/register_entity.dart';
import 'package:asiagolf_app/app/domain/repositories/auth/auth_repository.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password_new_password.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password_otp.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/login.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../utils/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _dioHelper = Get.find<DioHelper>();
  final UserCredentialRepositoryImpl _localData = Get.find();

  @override
  Future<Result<AuthEntity>> login({
    required LoginParams params,
  }) async {
    var enpoint = "/auth/login";

    try {
      var response = await _dioHelper.dio.post(
        enpoint,
        data: jsonEncode(
          params.toJson(),
        ),
      );

      if (response.statusCode == 200) {
        var result = Result.success(ApiResponse<AuthEntity>.fromJson(
            response.data, (data) => AuthDataModel.fromJson(data)));
        await _localData.updateCredential(result.data.data);
        _dioHelper.updateToken();
        return Result.success(result.data.data);
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      var data = CommonModel.fromJson(e.response?.data);

      return Result.error(
        message: data.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<RegisterEntity>> register({required params}) async {
    var endpoint = "/auth/register";

    try {
      var response = await _dioHelper.dio.post(
        endpoint,
        data: jsonEncode(
          params.toJson(),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = Result.success(ApiResponse<RegisterEntity>.fromJson(
            response.data, (data) => RegisterDataModel.fromJson(data)));
        return Result.success(result.data.data);
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode!,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      var data = CommonModel.fromJson(e.response?.data);

      return Result.error(
        message: data.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<bool>> logout() async {
    var endpoint = "/auth/logout";

    try {
      var response = await _dioHelper.dio.post(
        endpoint,
      );

      if (response.statusCode == 200) {
        await _localData.clearCredential();
        return Result.success(true, message: "Logout Berhasil!");
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode!,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      var data = CommonModel.fromJson(e.response?.data);

      return Result.error(
        message: data.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<bool>> forgotPasswordNewPassword(
      {required ForgotPasswordNewPasswordParams params}) async {
    var endpoint = "/auth/forgot_pass";

    try {
      var response = await _dioHelper.dio.post(
        endpoint,
        data: jsonEncode(
          params.toJson(),
        ),
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

      var data = CommonModel.fromJson(e.response?.data);

      return Result.error(
        message: data.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<bool>> forgotPasswordOTP(
      {required ForgotPasswordOTPParams params}) async {
    var endpoint = "/auth/verify_otp";

    try {
      var response = await _dioHelper.dio.post(
        endpoint,
        data: jsonEncode(
          params.toJson(),
        ),
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

      var data = CommonModel.fromJson(e.response?.data);

      return Result.error(
        message: data.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  @override
  Future<Result<bool>> forgotPasswordVerificationEmail(
      {required ForgotPasswordParams params}) async {
    var endpoint = "/auth/send_otp";

    try {
      var response = await _dioHelper.dio.post(
        endpoint,
        data: jsonEncode(
          params.toJson(),
        ),
      );

      if (response.statusCode == 200) {
        return Result.success(true,
            message:
                "OTP reset kata sandi berhasil dikirim, silakan cek kotak masuk email Anda");
      }

      return Result.error(
        message: response.data["message"],
        code: response.statusCode!,
      );
    } on DioException catch (e) {
      final errorMessage =
          "Get Auth -> Error Code ${e.response?.statusCode} = ${e.message}";

      var data = CommonModel.fromJson(e.response?.data);

      return Result.error(
        message: data.message ?? errorMessage,
        code: e.response?.statusCode ?? -1,
      );
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }
}
