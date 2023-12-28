import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:asiagolf_app/app/data/remote/auth_data_source.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgotPasswordOtpController extends BaseController {
  final _authDataSource = Get.find<AuthDataSource>();
  bool isShowResendOTP = false;
  bool isLoadingBtn = false;
  bool isLoadingResendBtn = false;
  bool isEnableBtn = false;

  String email = '';
  String otp = '';

  late CountdownTimerController countdownController;

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

  void onClickResend() async {
    isLoadingResendBtn = true;
    update();

    await callDataService<ResponseForgotPasswordModel>(
        () => _authDataSource.forgotPassword(
              email,
            ), onSuccess: (res) {
      Fluttertoast.showToast(
          msg: "OTP Berhasil Dikirim",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
    });

    isLoadingResendBtn = false;
    update();
  }

  void onChangeInput(String otp) {
    isEnableBtn = false;
    update();
  }

  void onClickNext() {
    onCompleteInputOTP(otp);
  }

  void onCompleteInputOTP(String value) async {
    FocusScope.of(Get.context!).unfocus();
    late Result<bool> result;

    otp = value;
    isEnableBtn = true;
    isLoadingBtn = true;
    update();

    await callDataService<ResponseOtpModel>(
      () => _authDataSource.otp(email, otp),
      onSuccess: (res) {
        Get.toNamed(
          Routes.CHANGE_PASSWORD,
          arguments: [email, otp],
        );
      },
    );
    isLoadingBtn = false;
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
