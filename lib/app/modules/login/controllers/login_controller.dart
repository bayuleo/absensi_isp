import 'package:asiagolf_app/app/modules/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isShowPassword = false;
  bool enableLogin = false;

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

  void onClickLogin() {
    Get.offAndToNamed(Routes.HOME);
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

  onChangedText(value) {
    if (InputValidatorHelper.validatorRequired(emailController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorRequired(
                passwordController.text.trim()) ==
            ValidatorResult.valid) {
      enableLogin = true;
    } else {
      enableLogin = false;
    }
    update();
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
