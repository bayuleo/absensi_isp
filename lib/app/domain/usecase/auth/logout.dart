import 'package:asiagolf_app/app/domain/repositories/auth/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class LogoutUseCase extends UseCase<bool, dynamic> {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  @override
  Future<Result<bool>> call(params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.logout();
  }
}
