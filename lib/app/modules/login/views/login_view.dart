import 'package:asiagolf_app/app/modules/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<LoginController>(
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
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Silakan Login ke akun Anda.',
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
                  validator: InputValidatorHelper.validateRequired,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldWithLabelWidget(
                  key: const ValueKey('login_password_text_field'),
                  label: "Password",
                  hint: "Password",
                  controller: controller.passwordController,
                  keyboardType: TextInputType.text,
                  obsecure: !controller.isShowPassword,
                  rightIcon: controller.isShowPassword
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  rightIconKey: const ValueKey(
                    'toggle_obscure_password_button',
                  ),
                  onTapRightIcon: controller.onTapShowPassword,
                  onChangedText: controller.onChangedText,
                  validator: InputValidatorHelper.validateRequired,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: controller.onClickForgotPassword,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(
                          0xff369B43,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ButtonWidget(
                  text: "Login",
                  enabled: controller.enableLogin,
                  onTap: controller.onClickLogin,
                ),
                SizedBox(
                  height: 16.h,
                ),
                ButtonWidget(
                  text: "Skip",
                  isFill: false,
                  onTap: controller.onClickSkip,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum punya akun? ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: controller.onClickRegister,
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          color: Color(
                            0xff369B43,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
