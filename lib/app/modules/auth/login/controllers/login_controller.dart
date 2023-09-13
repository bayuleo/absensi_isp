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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> onClickLogin() async {
    FocusScope.of(Get.context!).unfocus();
    late LoginParams params;
    late LoginUseCase login;
    late Result<AuthEntity> result;

    loadingBtn = true;
    update();

    params = LoginParams(
      account: emailController.text.trim(),
      password: passwordController.text.trim(),
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
    update();
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
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
