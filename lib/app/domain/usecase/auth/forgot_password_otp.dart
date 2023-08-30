import 'package:asiagolf_app/app/domain/repositories/auth_repository.dart';
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

    return authRepository.forgotPaswordOTP(params: params);
  }
}

class ForgotPasswordOTPParams {
  final String otp;

  ForgotPasswordOTPParams({
    required this.otp,
  });
}
