import 'package:asiagolf_app/app/modules/auth/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  bool enableButton = false;
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;
  bool isSuccess = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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

  void onEditForm(value) {
    if (InputValidatorHelper.validatorPassword(
                passwordController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validateConfirmPassword(
                passwordController.text.trim(),
                confirmPasswordController.text.trim()) ==
            ValidatorResult.valid) {
      enableButton = true;
    } else {
      enableButton = false;
    }
    update();
  }

  void onTapShowPassword([bool isConfirm = false]) {
    isConfirm
        ? isShowConfirmPassword = !isShowConfirmPassword
        : isShowPassword = !isShowPassword;
    update();
  }

  void onClickNext() {
    isSuccess = true;
    update();
  }

  void onClickLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
