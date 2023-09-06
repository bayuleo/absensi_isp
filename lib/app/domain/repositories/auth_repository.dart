import 'package:asiagolf_app/app/data/model/auth/forgot_password/request_forgot_password_model.dart';
import 'package:asiagolf_app/app/data/model/auth/login/request_login_model.dart';
import 'package:asiagolf_app/app/data/model/auth/logout/request_logout_model.dart';
import 'package:asiagolf_app/app/data/model/auth/register/request_register_model.dart';
import 'package:asiagolf_app/app/data/model/auth/send_otp/request_send_otp_model.dart';
import 'package:asiagolf_app/app/data/model/auth/verify_otp/request_verify_otp_model.dart';
import 'package:asiagolf_app/app/domain/entities/login_entity.dart';
import 'package:asiagolf_app/app/domain/entities/register_entity.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/send_otp.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/verify_otp.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/login.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/register.dart';
import 'package:asiagolf_app/app/utils/result.dart';

abstract class AuthRepository {
  Future<Result<LoginEntity>> login(
     RequestLoginModel params,
  );

  Future<Result<RegisterEntity>> register(RequestRegisterModel params
  );

  Future<Result<bool>> sendOtp(RequestSendOtpModel params);

  Future<Result<bool>> verifyOtp(
    RequestVerifyOtpModel params
  );

  Future<Result<bool>> forgotPassword(RequestForgotPasswordModel params
  );

  Future<Result<bool>> logout(RequestLogoutModel param);
}
