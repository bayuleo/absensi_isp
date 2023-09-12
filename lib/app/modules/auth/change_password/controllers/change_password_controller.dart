import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password_new_password.dart';
import 'package:asiagolf_app/app/modules/auth/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  bool enableButton = false;
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;
  bool isSuccess = false;
  bool isLoadingBtn = false;

  String email = '';
  String otp = '';

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    email = Get.arguments[0] ?? '';
    otp = Get.arguments[1] ?? '';
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

  void onTapShowPassword([bool isConfirm = false]) async {
    isConfirm
        ? isShowConfirmPassword = !isShowConfirmPassword
        : isShowPassword = !isShowPassword;
    update();
  }

  void onClickNext() async {
    FocusScope.of(Get.context!).unfocus();
    late ForgotPasswordNewPasswordParams params;
    late ForgotPasswordNewPasswordUseCase forgotPassword;
    late Result<bool> result;

    isLoadingBtn = true;
    update();

    params = ForgotPasswordNewPasswordParams(
      password: passwordController.text.trim(),
      passwordConfirmation: confirmPasswordController.text.trim(),
      otp: otp,
      email: email,
    );

    forgotPassword =
        ForgotPasswordNewPasswordUseCase(authRepository: AuthRepositoryImpl());

    try {
      result = await forgotPassword.call(params);
    } finally {
      isLoadingBtn = false;
    }

    if (result.status is Success) {
      isSuccess = true;
    } else {
      showSnack(result.message);
    }
    update();
  }

  void onClickLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
