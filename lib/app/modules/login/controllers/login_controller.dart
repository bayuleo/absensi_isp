import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/core/model/user_credentials.dart';
import 'package:asiagolf_app/app/data/local/user_credentials_data_source.dart';
import 'package:asiagolf_app/app/data/model/auth/login/request_login_model.dart';
import 'package:asiagolf_app/app/data/model/auth/login/response_login_model.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/remote/auth_data_source.dart';

class LoginController extends BaseController {
  final _authDataSource = Get.find<AuthDataSource>();
  final _userCredentialLocal = Get.find<UserCredentialsDataSource>();
  bool isShowPassword = false;
  bool loadingBtn = false;

  final emailC = TextEditingController();
  final passC = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  Future<void> onClickLogin() async {
    FocusScope.of(Get.context!).unfocus();
    late RequestLoginModel params;
    // late LoginUseCase login;
    // late Result<AuthEntity> result;

    if (loginKey.currentState!.validate()) {
      loadingBtn = true;
      update();

      params = RequestLoginModel(
        email: emailC.text.trim(),
        password: passC.text.trim(),
      );

      await callDataService<ResponseLoginModel>(
        () => _authDataSource.login(params),
        onSuccess: (res) async {
          final data = res.data;
          await _userCredentialLocal.saveToken(
              credentials: UserCredentials(
            id: data?.id,
            email: data?.email,
            accessToken: data?.accessToken,
            refreshToken: data?.refreshToken,
          ));
          Get.offAllNamed(Routes.HOME);
        },
      );

      loadingBtn = false;
      update();
    }
  }

  void onClickSkip() {
    Get.offAndToNamed(Routes.HOME);
  }

  void onClickForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  void onClickRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  onTapShowPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
