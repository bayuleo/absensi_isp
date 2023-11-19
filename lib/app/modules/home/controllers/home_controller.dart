import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
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
    late LogoutUseCase logout;
    late Result<bool> result;

    logout = LogoutUseCase(authRepository: AuthRepositoryImpl());

    result = await logout.call(null);
    if (result.status is Success) {
      showSnack(result.message);
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
