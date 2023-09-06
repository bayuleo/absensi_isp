import 'package:asiagolf_app/app/data/model/auth/verify_otp/request_verify_otp_model.dart';
import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/verify_otp.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get.dart';

class ForgotPasswordOtpController extends GetxController {
  bool enableButton = false;
  bool isShowResendOTP = false;
  bool loadingBtn = false;
  late CountdownTimerController countdownController;
  String email = '';

  final count = 0.obs;

  @override
  void onInit() {
    email = Get.arguments;
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

  void onClickResend() {}

  void onCompleteInputOTP(String input) async {
    enableButton = !enableButton;
    update();

    late RequestVerifyOtpModel params;
    late VerifyOtpUseCase verifyOtpUseCase;
    late Result<bool> result;

    loadingBtn = true;
    update();

    params = RequestVerifyOtpModel(
      email: email,
      code: input,
    );

    verifyOtpUseCase = VerifyOtpUseCase(authRepository: AuthRepositoryImpl());

    result = await verifyOtpUseCase.call(params);

    loadingBtn = false;

    if (result.status is Success) {
      Get.toNamed(
        Routes.CHANGE_PASSWORD,
        arguments: email,
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
