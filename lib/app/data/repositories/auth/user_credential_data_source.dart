import 'dart:convert';

import 'package:asiagolf_app/app/data/model/auth/login/response_login_data_model.dart';
import 'package:asiagolf_app/app/domain/repositories/user_credential_repository.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCredentialRepositoryImpl implements UserCredentialRepository {
  final _sharedPreferences = Get.find<SharedPreferences>();

  static const key = 'user_credentials';

  @override
  Future<bool> clearCredential() {
    return _sharedPreferences.remove(key);
  }

  @override
  ResponseLoginDataModel? getCredential() {
    final rawCredentials = _sharedPreferences.getString(key);
    if (isNotEmpty(rawCredentials)) {
      return ResponseLoginDataModel.fromJson(
        jsonDecode(rawCredentials!),
      );
    }
    return null;
  }

  @override
  Future<bool> updateCredential(credentials) {
    return _sharedPreferences.setString(
      key,
      jsonEncode(
        credentials.toJson(),
      ),
    );
  }
}
