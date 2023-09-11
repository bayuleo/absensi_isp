import 'package:asiagolf_app/app/data/repositories/auth/user_credential_data_source.dart';
import 'package:asiagolf_app/app/utils/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    Get.lazyPut<UserCredentialRepositoryImpl>(
        () => UserCredentialRepositoryImpl(),
        fenix: true);
    Get.lazyPut<DioHelper>(() => DioHelper(), fenix: true);
  }
}

class StorageService extends GetxService {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
}
