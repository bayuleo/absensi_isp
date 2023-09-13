import 'package:asiagolf_app/app/modules/auth/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/modules/auth/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:asiagolf_app/app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> with Validation {
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
                const Text(
                  'Daftar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Text(
                  'Silakan buat akun terlebih dahulu.',
                  style: TextStyle(
                    fontSize: 14,
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
                  keyboardType: TextInputType.text,
                  validator: nameRequired,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldWithLabelWidget(
                  label: "Alamat",
                  hint: "Alamat",
                  controller: controller.addressController,
                  keyboardType: TextInputType.text,
                  validator: inputRequired,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldWithLabelWidget(
                  label: "No Telepon",
                  hint: "No Telepon",
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  validator: inputRequired,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Text(
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
                        title: const Text(
                          'Laki-laki',
                          style: TextStyle(color: Colors.black),
                        ),
                        contentPadding: const EdgeInsets.all(0),
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
                        title: const Text(
                          'Perempuan',
                          style: TextStyle(color: Colors.black),
                        ),
                        contentPadding: const EdgeInsets.all(0),
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
                  validator: passwordRequired,
                ),
                SizedBox(
                  height: 40.h,
                ),
                ButtonWidget(
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
