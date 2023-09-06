import 'package:asiagolf_app/app/data/model/auth/forgot_password/request_forgot_password_model.dart';
import 'package:asiagolf_app/app/domain/repositories/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class ForgotPasswordUseCase extends UseCase<dynamic, RequestForgotPasswordModel> {
  final AuthRepository authRepository;

  ForgotPasswordUseCase({required this.authRepository});

  @override
  Future<Result<bool>> call(RequestForgotPasswordModel params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.forgotPassword(params);
  }
}
