import 'package:asiagolf_app/app/data/model/auth/forgot_password/request_forgot_password_model.dart';
import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/forgot_password.dart';
import 'package:asiagolf_app/app/modules/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  bool enableButton = false;
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;
  bool isSuccess = false;
  bool loadingBtn = false;

  String email = '';

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    email = Get.arguments;
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

  void onEditForm(value) {
    if (InputValidatorHelper.validatorPassword(
                passwordController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validateConfirmPassword(
                passwordController.text.trim(),
                confirmPasswordController.text.trim()) ==
            ValidatorResult.valid) {
      enableButton = true;
    } else {
      enableButton = false;
    }
    update();
  }

  void onTapShowPassword([bool isConfirm = false]) {
    isConfirm
        ? isShowConfirmPassword = !isShowConfirmPassword
        : isShowPassword = !isShowPassword;
    update();
  }

  void onClickNext() async {
    late RequestForgotPasswordModel params;
    late ForgotPasswordUseCase forgotPasswordUseCase;
    late Result<bool> result;

    loadingBtn = true;
    update();

    params = RequestForgotPasswordModel(
      email: email,
      password: passwordController.text.trim(),
    );

    forgotPasswordUseCase =
        ForgotPasswordUseCase(authRepository: AuthRepositoryImpl());

    result = await forgotPasswordUseCase.call(params);

    loadingBtn = false;

    if (result.status is Success) {
      isSuccess = true;
    } else {
      showSnack(result.message);
    }

    update();
  }

  void onClickLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
