import 'package:asiagolf_app/app/modules/login/utils/input_validatior_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  bool isShowPassword = false;
  bool enableRegister = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onChangedText(value) {
    if (InputValidatorHelper.validatorRequired(nameController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorRequired(addressController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorPhoneNumber(
                phoneController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorEmail(emailController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorPassword(
                passwordController.text.trim()) ==
            ValidatorResult.valid) {
      enableRegister = true;
    } else {
      enableRegister = false;
    }
    update();
  }

  void onClickRegister() {}

  void onClickLogin() {
    Get.back();
  }

  void onTapShowPassword() {
    isShowPassword = !isShowPassword;
    update();
  }
}
