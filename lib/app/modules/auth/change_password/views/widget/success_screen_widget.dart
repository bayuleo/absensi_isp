import 'package:asiagolf_app/app/modules/auth/change_password/controllers/change_password_controller.dart';
import 'package:asiagolf_app/app/modules/auth/splash/views/widget/button_widget.dart';
import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SuccessScreenWidget extends StatelessWidget {
  const SuccessScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/success_logo_bayu.svg',
                ),
                SizedBox(
                  height: 28.h,
                ),
                const Text(
                  'Password Berhasil Diubah',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                GetBuilder<ChangePasswordController>(
                  builder: (controller) => ButtonWidget(
                    mg: EdgeInsets.symmetric(
                      horizontal: 40.w,
                    ),
                    text: 'Login',
                    onTap: controller.onClickLogin,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
