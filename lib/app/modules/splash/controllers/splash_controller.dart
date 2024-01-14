import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/location.dart';
import 'package:get/get.dart';

import '../../../data/repository/user_credentials_repository.dart';

class SplashController extends GetxController {
  static final UserCredentialsRepository _localData = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    startAppHandler();
  }

  Future<void> startAppHandler() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    await getPosition();
    final credential = _localData.getCredentials();
    if (credential.accessToken != null) {
      if (credential.role == 'admin') {
        Get.offAllNamed(Routes.HOME_ADMIN);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
