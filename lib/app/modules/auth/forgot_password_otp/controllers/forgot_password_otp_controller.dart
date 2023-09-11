import 'package:asiagolf_app/app/routes/app_pages.dart';
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
    email = Get.arguments() ?? '';
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

  void onClickResend() {
    // TODO need integration
  }

  void onCompleteInputOTP() {
    enableButton = !enableButton;
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
