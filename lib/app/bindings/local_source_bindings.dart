import 'package:get/get.dart';

import '../data/local/user_credentials_data_source.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCredentialsDataSource>(
      () => UserCredentialsDataSourceImpl(),
      fenix: true,
    );
    // Get.lazyPut<UserProfilLocalDataSource>(
    //   () => UserProfileLocalDataSourceImpl(),
    //   fenix: true,
    // );
    // Get.lazyPut<FileHelper>(
    //   () => FileHelper(),
    //   fenix: true,
    // );
    // Get.lazyPut<PermissionHandler>(
    //   () => PermissionHandler(),
    //   fenix: true,
    // );
    // Get.lazyPut<FilePickerHandler>(
    //   () => FilePickerHandler(),
    //   fenix: true,
    // );
  }
}
