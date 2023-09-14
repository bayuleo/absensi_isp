import 'package:asiagolf_app/app/modules/change_password/bindings/change_password_binding.dart';
import 'package:asiagolf_app/app/modules/change_password/views/change_password_view.dart';
import 'package:asiagolf_app/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:asiagolf_app/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:asiagolf_app/app/modules/forgot_password_otp/bindings/forgot_password_otp_binding.dart';
import 'package:asiagolf_app/app/modules/forgot_password_otp/views/forgot_password_otp_view.dart';
import 'package:asiagolf_app/app/modules/login/bindings/login_binding.dart';
import 'package:asiagolf_app/app/modules/login/views/login_view.dart';
import 'package:asiagolf_app/app/modules/register/bindings/register_binding.dart';
import 'package:asiagolf_app/app/modules/register/views/register_view.dart';
import 'package:asiagolf_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:asiagolf_app/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_OTP,
      page: () => const ForgotPasswordOtpView(),
      binding: ForgotPasswordOtpBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
