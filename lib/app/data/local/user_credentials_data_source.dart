import 'dart:convert';

import 'package:asiagolf_app/app/core/model/user_credentials.dart';
import 'package:get/get.dart';
import 'package:quiver/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserCredentialsDataSource {
  UserCredentials getUserCredentials();

  Future<bool> updateUserCredentials(UserCredentials credentials);

  Future<bool> clearToken();

  Future<bool> saveToken({
    required UserCredentials credentials,
  });
}

class UserCredentialsDataSourceImpl implements UserCredentialsDataSource {
  final _sharedPreferences = Get.find<SharedPreferences>();

  static const key = 'user_credentials';

  @override
  Future<bool> clearToken() {
    // final credential = getUserCredentials();
    // return updateUserCredentials(
    //   credential.copyWith(accessToken: null, refreshToken: null),
    // );
    return _sharedPreferences.remove(key);
  }

  @override
  Future<bool> saveToken({required UserCredentials credentials}) {
    final credential = getUserCredentials();
    return updateUserCredentials(
      credential.copyWith(
        id: Optional.of(credentials.id),
        email: Optional.of(credentials.email),
        accessToken: Optional.of(credentials.accessToken),
        refreshToken: Optional.of(credentials.refreshToken),
      ),
    );
  }

  @override
  UserCredentials getUserCredentials() {
    final rawCredentials = _sharedPreferences.getString(key);
    if (rawCredentials == null) {
      return const UserCredentials();
    } else {
      return UserCredentials.fromJson(
        jsonDecode(rawCredentials),
      );
    }
  }

  @override
  Future<bool> updateUserCredentials(UserCredentials credentials) {
    return _sharedPreferences.setString(
      key,
      jsonEncode(
        credentials.toJson(),
      ),
    );
  }
}
