import 'package:asiagolf_app/app/core/widgets/dialog/confirmation_dialog_widget.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/local/user_credentials_data_source.dart';

class HomeAdminController extends GetxController {
  final _userCredentialLocal = Get.find<UserCredentialsDataSource>();

  final count = 0.obs;
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

  void increment() => count.value++;

  void onClickLogout() async {
    Get.dialog(
      ConfirmDialogWidget(
        title: 'Keluar Aplikasi',
        content: 'Apakah anda yakin ingin keluar dari aplikasi ?',
        onConfirm: () async {
          Get.back();
          // await _signOut(); //TODO integrate logout
          _userCredentialLocal.clearToken();
          Get.offAllNamed(Routes.LOGIN);
        },
        onCancel: () {
          Get.back();
        },
      ),
    );
  }
}
