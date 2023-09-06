import 'package:asiagolf_app/app/data/model/auth/send_otp/request_send_otp_model.dart';
import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/send_otp.dart';
import 'package:asiagolf_app/app/modules/login/utils/input_validatior_helper.dart';
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
    late RequestSendOtpModel params;
    late SendOtpUseCase sendOtpUseCase;
    late Result<bool> result;

    loadingBtn = true;
    update();

    params = RequestSendOtpModel(
      email: emailController.text.trim(),
    );

    sendOtpUseCase = SendOtpUseCase(authRepository: AuthRepositoryImpl());

    result = await sendOtpUseCase.call(params);

    loadingBtn = false;

    if (result.status is Success) {
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
