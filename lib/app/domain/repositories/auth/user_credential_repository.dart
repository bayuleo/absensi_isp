import 'package:asiagolf_app/app/domain/entities/auth/auth_entity.dart';

abstract class UserCredentialRepository {
  AuthEntity? getCredential();

  Future<bool> updateCredential(AuthEntity credentials);

  Future<bool> clearCredential();
}
