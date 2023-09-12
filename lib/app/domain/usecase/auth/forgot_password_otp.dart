import 'package:asiagolf_app/app/domain/repositories/auth/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class ForgotPasswordOTPUseCase
    extends UseCase<dynamic, ForgotPasswordOTPParams> {
  final AuthRepository authRepository;

  ForgotPasswordOTPUseCase({required this.authRepository});

  @override
  Future<Result<bool>> call(ForgotPasswordOTPParams params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.forgotPasswordOTP(params: params);
  }
}

class ForgotPasswordOTPParams {
  final String otp;
  final String email;

  ForgotPasswordOTPParams({
    required this.otp,
    required this.email,
  });

  Map<String, dynamic> toJson() => {'otp': otp, 'email': email};
}
