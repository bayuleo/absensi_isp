import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/auth/forgot_password/response_forgot_password_model.dart';
import 'package:asiagolf_app/app/data/remote/auth_data_source.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends BaseController {
  final forgotPasswordKey = GlobalKey<FormState>();
  final _authDataSource = Get.find<AuthDataSource>();
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
    late Result<bool> result;

    if (forgotPasswordKey.currentState!.validate()) {
      loadingBtn = true;
      update();

      await callDataService<ResponseForgotPasswordModel>(
          () => _authDataSource.forgotPassword(
                emailController.text.trim(),
              ), onSuccess: (res) {
        Get.toNamed(
          Routes.FORGOT_PASSWORD_OTP,
          arguments: emailController.text.trim(),
        );
      });
      loadingBtn = false;
      update();
    }
  }
}
