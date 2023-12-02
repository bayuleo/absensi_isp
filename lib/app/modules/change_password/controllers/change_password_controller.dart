import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password_new_password.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final changePassKey = GlobalKey<FormState>();
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;
  bool isSuccess = false;
  bool isLoadingBtn = false;

  String email = '';
  String otp = '';

  TextEditingController passC = TextEditingController();
  TextEditingController repassC = TextEditingController();

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

    if (changePassKey.currentState!.validate()) {
      isLoadingBtn = true;
      update();

      params = ForgotPasswordNewPasswordParams(
        password: passC.text.trim(),
        passwordConfirmation: repassC.text.trim(),
        otp: otp,
        email: email,
      );

      // forgotPassword = ForgotPasswordNewPasswordUseCase(
      //     authRepository: AuthRepositoryImpl());
      //
      // try {
      //   result = await forgotPassword.call(params);
      // } finally {
      //   isLoadingBtn = false;
      // }
      //
      // if (result.status is Success) {
      //   isSuccess = true;
      // } else {
      //   showSnack(result.message);
      // }
      if (true) {
        isSuccess = true;
      } else {
        showSnack('error message');
      }
      isLoadingBtn = true;
      update();
    }
  }

  void onClickLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
