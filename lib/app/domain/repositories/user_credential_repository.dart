import 'package:asiagolf_app/app/data/model/auth/auth_data_model.dart';

abstract class UserCredentialRepository {
  AuthDataModel? getCredential();

  Future<bool> updateCredential(AuthDataModel credentials);

  Future<bool> clearCredential();
}
