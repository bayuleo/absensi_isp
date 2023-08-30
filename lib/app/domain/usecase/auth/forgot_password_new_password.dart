import 'package:asiagolf_app/app/domain/repositories/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class ForgotPasswordNewPasswordUseCase
    extends UseCase<dynamic, ForgotPasswordNewPasswordParams> {
  final AuthRepository authRepository;

  ForgotPasswordNewPasswordUseCase({required this.authRepository});

  @override
  Future<Result<bool>> call(ForgotPasswordNewPasswordParams params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.forgotPaswordNewPassword(params: params);
  }
}

class ForgotPasswordNewPasswordParams {
  final String password;

  ForgotPasswordNewPasswordParams({
    required this.password,
  });
}
