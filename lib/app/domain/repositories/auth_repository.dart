import 'package:asiagolf_app/app/domain/entities/auth_entity.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/login.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/register.dart';
import 'package:asiagolf_app/app/utils/result.dart';

abstract class AuthRepository {
  Future<Result<AuthEntity>> login({
    required LoginParams params,
  });

  Future<Result<AuthEntity>> register({
    required RegisterParams params,
  });

  Future<Result<bool>> logout();
}
