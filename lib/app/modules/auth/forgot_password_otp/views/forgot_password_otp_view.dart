import 'package:asiagolf_app/app/modules/auth/splash/views/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/forgot_password_otp_controller.dart';

class ForgotPasswordOtpView extends GetView<ForgotPasswordOtpController> {
  const ForgotPasswordOtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ForgotPasswordOtpController>(
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
                RichText(
                  text: TextSpan(
                    text: 'Kami telah mengirimkan kode ke ',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff2D2D2D),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: controller.email,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2D2D2D),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                OtpTextField(
                  numberOfFields: 4,
                  fieldWidth: 50.w,
                  margin: EdgeInsets.symmetric(
                    horizontal: 12.w,
                  ),
                  borderColor: Colors.black,
                  focusedBorderColor: Colors.black,
                  cursorColor: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  borderWidth: 2,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.onCompleteInputOTP();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  }, // end onSubmit
                ),
                SizedBox(
                  height: 40.h,
                ),
                ButtonWidget(
                  text: "Next",
                  enabled: controller.enableButton,
                  isLoading: controller.isLoadingBtn,
                  onTap: controller.onClickNext,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum menerima kode? ',
                      style: TextStyle(
                        color: Color(0xff333333),
                      ),
                    ),
                    controller.isShowResendOTP
                        ? InkWell(
                            onTap: controller.onClickResend,
                            child: const Text(
                              'Kirim ulang.',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(
                                  0xff333333,
                                ),
                              ),
                            ),
                          )
                        : CountdownTimer(
                            controller: controller.countdownController,
                            widgetBuilder: (_, time) {
                              return Text(
                                '${time?.sec ?? '0'} detik',
                              );
                            },
                          )
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
