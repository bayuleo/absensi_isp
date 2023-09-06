import 'package:asiagolf_app/app/data/model/auth/login/response_login_data_model.dart';

abstract class UserCredentialRepository {
  ResponseLoginDataModel? getCredential();

  Future<bool> updateCredential(ResponseLoginDataModel credentials);

  Future<bool> clearCredential();
}
