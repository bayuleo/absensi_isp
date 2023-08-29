import 'package:asiagolf_app/app/modules/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  bool enableButton = false;

  TextEditingController emailController = TextEditingController();

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
    emailController.dispose();
    super.onClose();
  }

  void onChangedText(value) {
    if (InputValidatorHelper.validatorEmail(emailController.text.trim()) ==
        ValidatorResult.valid) {
      enableButton = true;
    } else {
      enableButton = false;
    }
    update();
  }

  void onClickNext() {
    Get.toNamed(Routes.FORGOT_PASSWORD_OTP);
  }
}
