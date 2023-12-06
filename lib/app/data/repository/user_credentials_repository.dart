import 'package:get/get.dart';

import '../../core/model/user_credentials.dart';
import '../local/user_credentials_data_source.dart';

abstract class UserCredentialsRepository {
  UserCredentials getCredentials();

  Future<bool> updateCredentials(UserCredentials credentials);
}

class UserCredentialsRepositoryImpl implements UserCredentialsRepository {
  final UserCredentialsDataSource _userCredentialsDataSource =
      Get.find<UserCredentialsDataSource>();

  @override
  UserCredentials getCredentials() {
    return _userCredentialsDataSource.getUserCredentials();
  }

  @override
  Future<bool> updateCredentials(UserCredentials credentials) {
    return _userCredentialsDataSource.updateUserCredentials(credentials);
  }
}
