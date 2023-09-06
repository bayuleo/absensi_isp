import 'package:asiagolf_app/app/data/model/auth/login/request_login_model.dart';
import 'package:asiagolf_app/app/domain/entities/login_entity.dart';
import 'package:asiagolf_app/app/domain/repositories/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class LoginUseCase extends UseCase<dynamic, RequestLoginModel> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Result<LoginEntity>> call(RequestLoginModel params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.login(params);
  }
}
