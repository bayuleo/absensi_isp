import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:asiagolf_app/app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'widget/text_field_with_label_widget.dart';

class LoginView extends GetView<LoginController> with Validation {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: GetBuilder<LoginController>(
          builder: (controller) => Padding(
            padding: EdgeInsets.all(20.w),
            child: Form(
              key: controller.loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.w,
                      ),
                      child: Image.asset(
                        'assets/icons/main_logo.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFieldWithLabelWidget(
                    label: "Email",
                    hint: "Email",
                    controller: controller.emailC,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailRequired,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFieldWithLabelWidget(
                    key: const ValueKey('login_password_text_field'),
                    label: "Password",
                    hint: "Password",
                    controller: controller.passC,
                    keyboardType: TextInputType.text,
                    obsecure: !controller.isShowPassword,
                    rightIcon: controller.isShowPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    rightIconKey: const ValueKey(
                      'toggle_obscure_password_button',
                    ),
                    onTapRightIcon: controller.onTapShowPassword,
                    validator: passwordRequired,
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
                          color: primaryTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ButtonWidget(
                    text: "Sign In",
                    isLoading: controller.loadingBtn,
                    onTap: controller.onClickLogin,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
