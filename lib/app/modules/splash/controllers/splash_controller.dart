import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('bayu');
  }

  @override
  void onReady() {
    super.onReady();
    startAppHandler();
  }

  Future<void> startAppHandler() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    // final credential = _userCredentialsRepository.getCredentials();
    // if (credential.accessToken != null) {
    //   Get.offAllNamed(Routes.MAIN_CONTENT);
    // } else {
    Get.offAllNamed(Routes.LOGIN);
    // }
  }
}
