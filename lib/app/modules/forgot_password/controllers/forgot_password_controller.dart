import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final forgotPasswordKey = GlobalKey<FormState>();
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

  void onClickNext() async {
    FocusScope.of(Get.context!).unfocus();
    late ForgotPasswordParams params;
    late ForgotPasswordUseCase forgotPassword;
    late Result<bool> result;

    if (forgotPasswordKey.currentState!.validate()) {
      loadingBtn = true;
      update();

      params = ForgotPasswordParams(
        email: emailController.text.trim(),
      );

      // forgotPassword =
      //     ForgotPasswordUseCase(authRepository: AuthRepositoryImpl());
      //
      // try {
      //   result = await forgotPassword.call(params);
      // } finally {
      //   loadingBtn = false;
      // }
      //
      // if (result.status is Success) {
      //   showSnack(result.message);
      //   Get.toNamed(
      //     Routes.FORGOT_PASSWORD_OTP,
      //     arguments: emailController.text.trim(),
      //   );
      // } else {
      //   showSnack(result.message);
      // }
      Get.toNamed(
        Routes.FORGOT_PASSWORD_OTP,
        arguments: emailController.text.trim(),
      );
      loadingBtn = false;
      update();
    }
  }
}
