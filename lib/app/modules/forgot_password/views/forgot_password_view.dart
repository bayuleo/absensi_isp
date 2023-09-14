import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../splash/views/widget/button_widget.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController>
    with Validation {
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
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Text(
                  'Masukan email yang terhubung ke akun Anda.',
                  style: TextStyle(
                    fontSize: 14,
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
                  keyboardType: TextInputType.text,
                  validator: emailRequired,
                ),
                SizedBox(
                  height: 40.h,
                ),
                ButtonWidget(
                  text: "Next",
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
