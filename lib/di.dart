// import 'package:asiagolf_app/app/data/repositories/auth/user_credential_data_source.dart';
// import 'package:asiagolf_app/app/utils/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/bindings/local_source_bindings.dart';
import 'app/bindings/remote_source_bindings.dart';
import 'app/bindings/repository_bindings.dart';
import 'app/network/dio_config.dart';
import 'app/network/endpoints.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
    LocalSourceBindings().dependencies();
    Get.lazyPut<DioConfigure>(() => DioConfigure(), fenix: true);
    Get.lazyPut<Endpoints>(() => Endpoints(), fenix: true);
    Get.lazyPut<Logger>(
      () => Logger(
        printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 8,
          lineLength: 100,
          colors: false,
          printEmojis: true,
          printTime: true,
        ),
      ),
      fenix: true,
    );
  }
}

class StorageService extends GetxService {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
}
