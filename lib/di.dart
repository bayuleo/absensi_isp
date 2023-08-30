import 'package:asiagolf_app/app/data/local/user_credential_data_source.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    Get.lazyPut<UserCredentialsDataSource>(
        () => UserCredentialsDataSourceImpl(),
        fenix: true);
  }
}

class StorageService extends GetxService {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
}
