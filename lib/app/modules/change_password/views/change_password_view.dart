import 'package:asiagolf_app/app/modules/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/splash/views/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';
import 'widget/success_screen_widget.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChangePasswordController>(
        builder: (controller) => Padding(
          padding: EdgeInsets.all(20.w),
          child: !controller.isSuccess
              ? SingleChildScrollView(
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
                        onChangedText: controller.onEditForm,
                        controller: controller.passwordController,
                        validator: InputValidatorHelper.validatePassword,
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
                        onChangedText: controller.onEditForm,
                        controller: controller.confirmPasswordController,
                        validator: validateConfirmPassword,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ButtonWidget(
                        text: "Next",
                        enabled: controller.enableButton,
                        onTap: controller.onClickNext,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                )
              : SuccessScreenWidget(),
        ),
      ),
    );
  }

  validateConfirmPassword(value) {
    final validatorResult = InputValidatorHelper.validateConfirmPassword(
        controller.passwordController.text, value);
    if (validatorResult == ValidatorResult.empty) {
      return 'Password wajib terisi';
    }
    if (validatorResult == ValidatorResult.invalid) {
      return 'Minimal 8 karakter huruf atau angka';
    }
    if (validatorResult == ValidatorResult.other) {
      return 'Confirm password tidak cocok';
    }
    return null;
  }
}
