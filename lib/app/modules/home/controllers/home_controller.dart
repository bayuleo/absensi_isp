import 'package:asiagolf_app/app/data/repositories/auth/user_credential_data_source.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final UserCredentialRepositoryImpl _localAuth = Get.find();

  String? token;
  @override
  void onInit() {
    token = _localAuth.getCredential()?.accessToken ?? '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onClickLogout() async {
    if (await _localAuth.clearCredential()) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
