import 'package:asiagolf_app/app/domain/entities/auth/register_entity.dart';
import 'package:asiagolf_app/app/domain/repositories/auth/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class RegisterUseCase extends UseCase<RegisterEntity, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  @override
  Future<Result<RegisterEntity>> call(RegisterParams params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.register(params: params);
  }
}

class RegisterParams {
  final String email;
  final String name;
  final String address;
  final String phone;
  final String gender;
  final String latitude;
  final String longitude;
  final String password;
  final String passwordConfirmation;

  RegisterParams({
    required this.email,
    required this.name,
    required this.address,
    required this.phone,
    required this.gender,
    required this.latitude,
    required this.longitude,
    required this.password,
    required this.passwordConfirmation,
  });
}
