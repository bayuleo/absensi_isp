import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password.dart';
import 'package:asiagolf_app/app/modules/auth/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  bool enableButton = false;
  bool loadingBtn = false;

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

  void onClickNext() async {
    FocusScope.of(Get.context!).unfocus();
    late ForgotPasswordParams params;
    late ForgotPasswordUseCase forgotPassword;
    late Result<bool> result;

    loadingBtn = true;
    update();

    params = ForgotPasswordParams(
      email: emailController.text.trim(),
    );

    forgotPassword =
        ForgotPasswordUseCase(authRepository: AuthRepositoryImpl());

    try {
      result = await forgotPassword.call(params);
    } finally {
      loadingBtn = false;
    }

    if (result.status is Success) {
      showSnack(result.message);
      Get.toNamed(
        Routes.FORGOT_PASSWORD_OTP,
        arguments: emailController.text.trim(),
      );
    } else {
      showSnack(result.message);
    }
    update();
  }
}
