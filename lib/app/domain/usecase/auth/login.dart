import 'package:asiagolf_app/app/domain/entities/auth/auth_entity.dart';
import 'package:asiagolf_app/app/domain/repositories/auth/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class LoginUseCase extends UseCase<dynamic, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Result<AuthEntity>> call(LoginParams params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.login(params: params);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
