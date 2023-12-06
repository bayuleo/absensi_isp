import 'package:asiagolf_app/app/data/remote/absent_data_source.dart';
import 'package:asiagolf_app/app/data/remote/ijin_data_source.dart';
import 'package:asiagolf_app/app/data/remote/users_data_source.dart';
import 'package:get/get.dart';

import '../data/remote/auth_data_source.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthDataSource>(
      () => AuthDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<UsersDataSource>(
      () => UsersDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<AbsentDataSource>(
      () => AbsentDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<IjinDataSource>(
      () => IjinDataSourceImpl(),
      fenix: true,
    );
  }
}
