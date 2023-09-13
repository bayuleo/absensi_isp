import 'package:asiagolf_app/app/domain/repositories/auth/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class ForgotPasswordUseCase extends UseCase<dynamic, ForgotPasswordParams> {
  final AuthRepository authRepository;

  ForgotPasswordUseCase({required this.authRepository});

  @override
  Future<Result<bool>> call(ForgotPasswordParams params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.forgotPasswordVerificationEmail(params: params);
  }
}

class ForgotPasswordParams {
  final String email;

  ForgotPasswordParams({
    required this.email,
  });
}
