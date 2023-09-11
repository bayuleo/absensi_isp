import 'package:asiagolf_app/app/modules/auth/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/modules/auth/login/views/widget/text_field_with_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../splash/views/widget/button_widget.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ForgotPasswordController>(
          builder: (controller) => Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                SvgPicture.asset(
                  'assets/icons/main_logo_bayu.svg',
                ),
                SizedBox(
                  height: 48.h,
                ),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Masukan email yang terhubung ke akun Anda.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldWithLabelWidget(
                  label: "Email",
                  hint: "Email",
                  controller: controller.emailController,
                  onChangedText: controller.onChangedText,
                  keyboardType: TextInputType.text,
                  validator: InputValidatorHelper.validateEmail,
                ),
                SizedBox(
                  height: 40.h,
                ),
                ButtonWidget(
                  text: "Next",
                  enabled: controller.enableButton,
                  isLoading: controller.loadingBtn,
                  onTap: controller.onClickNext,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
