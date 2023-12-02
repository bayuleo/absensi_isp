import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/entities/auth/auth_entity.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/login.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isShowPassword = false;
  bool loadingBtn = false;

  final emailC = TextEditingController();
  final passC = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  Future<void> onClickLogin() async {
    FocusScope.of(Get.context!).unfocus();
    late LoginParams params;
    late LoginUseCase login;
    late Result<AuthEntity> result;

    if (loginKey.currentState!.validate()) {
      loadingBtn = true;
      update();

      params = LoginParams(
        email: emailC.text.trim(),
        password: passC.text.trim(),
      );

      login = LoginUseCase(authRepository: AuthRepositoryImpl());

      try {
        result = await login.call(params);
      } finally {
        loadingBtn = false;
      }

      if (result.status is Success) {
        Get.offAllNamed(Routes.HOME);
      } else {
        showSnack(result.message);
      }
      // Get.offAllNamed(Routes.HOME);
      loadingBtn = false;
      update();
    }
  }

  void onClickSkip() {
    Get.offAndToNamed(Routes.HOME);
  }

  void onClickForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  void onClickRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  onTapShowPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
