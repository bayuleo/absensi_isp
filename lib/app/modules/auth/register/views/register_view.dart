import 'package:asiagolf_app/app/modules/auth/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/modules/auth/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/auth/splash/views/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<RegisterController>(
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
                  'Daftar',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Silakan buat akun terlebih dahulu.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldWithLabelWidget(
                  label: "Nama",
                  hint: "Nama",
                  controller: controller.nameController,
                  onChangedText: controller.onChangedText,
                  keyboardType: TextInputType.text,
                  validator: InputValidatorHelper.validateRequired,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldWithLabelWidget(
                  label: "Alamat",
                  hint: "Alamat",
                  controller: controller.addressController,
                  onChangedText: controller.onChangedText,
                  keyboardType: TextInputType.text,
                  validator: InputValidatorHelper.validateRequired,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldWithLabelWidget(
                  label: "No Telepon",
                  hint: "No Telepon",
                  controller: controller.phoneController,
                  onChangedText: controller.onChangedText,
                  keyboardType: TextInputType.phone,
                  validator: InputValidatorHelper.validatePhoneNumber,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Jenis Kelamin',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<Gender>(
                        title: Text(
                          'Laki-laki',
                          style: TextStyle(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.all(0),
                        dense: true,
                        visualDensity: const VisualDensity(
                          vertical: VisualDensity.minimumDensity,
                        ),
                        value: Gender.male,
                        groupValue: controller.gender,
                        onChanged: (value) =>
                            controller.onSelectedGender(value),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<Gender>(
                        title: Text(
                          'Perempuan',
                          style: TextStyle(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.all(0),
                        dense: true,
                        visualDensity: const VisualDensity(
                          vertical: VisualDensity.minimumDensity,
                        ),
                        value: Gender.female,
                        groupValue: controller.gender,
                        onChanged: (value) =>
                            controller.onSelectedGender(value),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldWithLabelWidget(
                  label: "Email",
                  hint: "Email",
                  controller: controller.emailController,
                  onChangedText: controller.onChangedText,
                  keyboardType: TextInputType.emailAddress,
                  validator: InputValidatorHelper.validateEmail,
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
                  validator: InputValidatorHelper.validatePassword,
                ),
                SizedBox(
                  height: 40.h,
                ),
                ButtonWidget(
                  enabled: controller.enableRegister,
                  text: "Daftar",
                  isLoading: controller.loadingBtn,
                  onTap: controller.onClickRegister,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sudah punya akun? ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: controller.onClickLogin,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(
                            0xff369B43,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
