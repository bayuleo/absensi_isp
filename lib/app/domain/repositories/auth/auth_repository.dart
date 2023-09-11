import 'package:asiagolf_app/app/domain/entities/auth/auth_entity.dart';
import 'package:asiagolf_app/app/domain/entities/auth/register_entity.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password_new_password.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password_otp.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/login.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/register.dart';
import 'package:asiagolf_app/app/utils/result.dart';

abstract class AuthRepository {
  Future<Result<AuthEntity>> login({
    required LoginParams params,
  });

  Future<Result<RegisterEntity>> register({
    required RegisterParams params,
  });

  Future<Result<bool>> forgotPaswordVerificationEmail({
    required ForgotPasswordParams params,
  });

  Future<Result<bool>> forgotPaswordOTP({
    required ForgotPasswordOTPParams params,
  });

  Future<Result<bool>> forgotPaswordNewPassword({
    required ForgotPasswordNewPasswordParams params,
  });

  Future<Result<bool>> logout();
}
