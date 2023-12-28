import 'package:asiagolf_app/app/core/base/base_controllerr.dart';
import 'package:asiagolf_app/app/data/model/auth/change_password/response_change_pasword_model.dart';
import 'package:asiagolf_app/app/data/remote/auth_data_source.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../utils/result.dart';

class ChangePasswordController extends BaseController {
  final changePassKey = GlobalKey<FormState>();
  final _authDataSource = Get.find<AuthDataSource>();
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
    passC.dispose();
    repassC.dispose();
  }

  void onTapShowPassword([bool isConfirm = false]) async {
    isConfirm
        ? isShowConfirmPassword = !isShowConfirmPassword
        : isShowPassword = !isShowPassword;
    update();
  }

  void onClickNext() async {
    FocusScope.of(Get.context!).unfocus();
    late Result<bool> result;

    if (changePassKey.currentState!.validate()) {
      isLoadingBtn = true;
      update();

      await callDataService<ResponseChangePaswordModel>(
          () => _authDataSource.changePassword(
                email,
                otp,
                passC.text.trim(),
              ), onSuccess: (res) {
        Get.offAllNamed(Routes.LOGIN);
        Fluttertoast.showToast(
            msg: "Password berhasil diubah, silahkan login kembali",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: primaryColor,
            textColor: Colors.white,
            fontSize: 16.0);
      });
      isLoadingBtn = false;
      update();
    }
  }

  void onClickLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
