import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password_otp.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get.dart';

class ForgotPasswordOtpController extends GetxController {
  bool enableButton = false;
  bool isShowResendOTP = false;
  bool isLoadingBtn = false;
  late CountdownTimerController countdownController;
  String email = '';

  final count = 0.obs;
  @override
  void onInit() {
    email = Get.arguments ?? '';
    _setupTimer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    countdownController.dispose();
    super.onClose();
  }

  void onClickNext() {
    Get.toNamed(Routes.CHANGE_PASSWORD);
  }

  void onClickResend() async {
    late ForgotPasswordParams params;
    late ForgotPasswordUseCase forgotPassword;
    late Result<bool> result;

    params = ForgotPasswordParams(
      email: email,
    );

    forgotPassword =
        ForgotPasswordUseCase(authRepository: AuthRepositoryImpl());

    result = await forgotPassword.call(params);

    if (result.status is Success) {
      showSnack(result.message);
      _setupTimer();
      isShowResendOTP = false;
    } else {
      showSnack(result.message);
    }
    update();
  }

  void onCompleteInputOTP(String otp) async {
    FocusScope.of(Get.context!).unfocus();
    late ForgotPasswordOTPParams params;
    late ForgotPasswordOTPUseCase forgotPassword;
    late Result<bool> result;

    isLoadingBtn = true;
    update();

    params = ForgotPasswordOTPParams(
      email: email,
      otp: otp,
    );

    forgotPassword =
        ForgotPasswordOTPUseCase(authRepository: AuthRepositoryImpl());

    try {
      result = await forgotPassword.call(params);
    } finally {
      isLoadingBtn = false;
    }

    if (result.status is Success) {
      showSnack(result.message);
      Get.toNamed(
        Routes.CHANGE_PASSWORD,
        arguments: [email, otp],
      );
    } else {
      showSnack(result.message);
    }
    update();
  }

  void _setupTimer() {
    var now = DateTime.now();
    var endTime = DateTime(
            now.year, now.month, now.day, now.hour, now.minute, now.second + 60)
        .millisecondsSinceEpoch;
    countdownController = CountdownTimerController(
      endTime: endTime,
      onEnd: onEndTimer,
    );
    update();
  }

  void onEndTimer() {
    isShowResendOTP = !isShowResendOTP;
    update();
  }
}
