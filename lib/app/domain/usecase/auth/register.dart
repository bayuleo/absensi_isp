import 'package:asiagolf_app/app/data/model/auth/register/request_register_model.dart';
import 'package:asiagolf_app/app/domain/entities/login_entity.dart';
import 'package:asiagolf_app/app/domain/entities/register_entity.dart';
import 'package:asiagolf_app/app/domain/repositories/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class RegisterUseCase extends UseCase<dynamic, RequestRegisterModel> {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  @override
  Future<Result<RegisterEntity>> call(RequestRegisterModel params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.register(params);
  }
}
