import 'package:asiagolf_app/app/data/local/user_credential_data_source.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final UserCredentialsDataSource _userCredentialsDataSource = Get.find();

  String? token;
  @override
  void onInit() {
    var x = _userCredentialsDataSource.getCredential();
    token = x?.accessToken ?? '';
    print(x);
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
    if (await _userCredentialsDataSource.clearCredential()) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
