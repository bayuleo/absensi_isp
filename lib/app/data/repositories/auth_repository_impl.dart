import 'package:asiagolf_app/app/data/local/user_credential_data_source.dart';
import 'package:asiagolf_app/app/data/model/auth/auth_model.dart';
import 'package:asiagolf_app/app/domain/entities/auth_entity.dart';
import 'package:asiagolf_app/app/domain/repositories/auth_repository.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/login.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../utils/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _dio = DioHelper.init();
  final UserCredentialsDataSource _userCredentialsDataSource = Get.find();

  @override
  Future<Result<AuthEntity>> login({
    required LoginParams params,
  }) async {
    // var enpoint = "/auth/signin";
    var enpoint =
        "https://run.mocky.io/v3/77b1a5be-5fa4-446c-9d20-86ab38879dc7";
    final data = {
      "account": params.userName,
      "password": params.password,
    };

    try {
      var response = await _dio.get(
        enpoint,
        data: data,
      );

      if (response.statusCode == 200) {
        var auth = AuthModel.fromJson(response.data);
        await _userCredentialsDataSource.updateCredential(auth.data);
        return Result.success(auth.data);
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
  Future<Result<AuthEntity>> register({required params}) async {
    // var endpoint = "/auth/signup";
    var endpoint =
        "https://run.mocky.io/v3/77b1a5be-5fa4-446c-9d20-86ab38879dc7";

    final data = {
      "email": params.email,
      "name": params.name,
      "address": params.address,
      "phone": params.phone,
      "gender": params.gender,
      "latitude": params.latitude,
      "longitude": params.longitude,
      "password": params.password,
      "password_confirmation": params.passwordConfirmation,
    };

    try {
      var response = await _dio.get(
        endpoint,
        data: data,
      );

      if (response.statusCode == 200) {
        var auth = AuthModel.fromJson(response.data);
        await _userCredentialsDataSource.updateCredential(auth.data);
        return Result.success(auth.data);
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
  Future<Result<bool>> logout() async {
    var endpoint = "/auth/signup";

    try {
      var response = await _dio.post(
        endpoint,
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
