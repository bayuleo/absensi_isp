import 'package:get/get.dart';

import '../data/repository/auth_repository.dart';
import '../data/repository/user_credentials_repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<UserCredentialsRepository>(
      () => UserCredentialsRepositoryImpl(),
      fenix: true,
    );
  }
}
