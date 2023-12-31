import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';
import 'widget/success_screen_widget.dart';

class ChangePasswordView extends GetView<ChangePasswordController>
    with Validation {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChangePasswordController>(
        builder: (controller) => Padding(
          padding: EdgeInsets.all(20.w),
          child: !controller.isSuccess
              ? SingleChildScrollView(
                  child: Form(
                    key: controller.changePassKey,
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
                          label: 'New Password',
                          keyboardType: TextInputType.text,
                          obsecure: !controller.isShowPassword,
                          rightIcon: controller.isShowPassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          rightIconKey: const ValueKey(
                            'toggle_obscure_password_button',
                          ),
                          onTapRightIcon: () => controller.onTapShowPassword(),
                          controller: controller.passC,
                          validator: passwordRequired,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWithLabelWidget(
                          label: 'Confirm Password',
                          keyboardType: TextInputType.text,
                          obsecure: !controller.isShowConfirmPassword,
                          rightIcon: controller.isShowConfirmPassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          rightIconKey: const ValueKey(
                            'toggle_obscure_password_button',
                          ),
                          onTapRightIcon: () =>
                              controller.onTapShowPassword(true),
                          controller: controller.repassC,
                          validator: (value) => repasswordRequired(
                            value,
                            controller.passC.text.trim(),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        ButtonWidget(
                          text: "Next",
                          isLoading: controller.isLoadingBtn,
                          onTap: controller.onClickNext,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    ),
                  ),
                )
              : const SuccessScreenWidget(),
        ),
      ),
    );
  }
}
