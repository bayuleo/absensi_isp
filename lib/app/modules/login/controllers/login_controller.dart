import 'package:asiagolf_app/app/data/model/auth/login/request_login_model.dart';
import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/entities/login_entity.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/login.dart';
import 'package:asiagolf_app/app/modules/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isShowPassword = false;
  bool enableLogin = false;
  bool loadingBtn = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> onClickLogin() async {
    late RequestLoginModel params;
    late LoginUseCase login;
    late Result<LoginEntity> result;

    loadingBtn = true;
    update();

    params = RequestLoginModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(), fcmToken: 'abc', // TODO need integration with FCM
    );

    login = LoginUseCase(authRepository: AuthRepositoryImpl());

    result = await login.call(params);

    loadingBtn = false;

    if (result.status is Success) {
      Get.offAllNamed(Routes.HOME);
    } else {
      showSnack(result.message);
    }
    update();
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

  onChangedText(value) {
    if (InputValidatorHelper.validatorRequired(emailController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorRequired(
                passwordController.text.trim()) ==
            ValidatorResult.valid) {
      enableLogin = true;
    } else {
      enableLogin = false;
    }
    update();
  }

  onTapShowPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
