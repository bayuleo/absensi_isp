import 'package:get/get.dart';

import '../modules/camera_preview/bindings/camera_preview_binding.dart';
import '../modules/camera_preview/views/camera_preview_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/detail_absensi/bindings/detail_absensi_binding.dart';
import '../modules/detail_absensi/views/detail_absensi_view.dart';
import '../modules/detail_clock_in/bindings/detail_clock_in_binding.dart';
import '../modules/detail_clock_in/views/detail_clock_in_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/forgot_password_otp/bindings/forgot_password_otp_binding.dart';
import '../modules/forgot_password_otp/views/forgot_password_otp_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
    GetPage(
      name: _Paths.DETAIL_CLOCK_IN,
      page: () => const DetailClockInView(),
      binding: DetailClockInBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ABSENSI,
      page: () => const DetailAbsensiView(),
      binding: DetailAbsensiBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_PREVIEW,
      page: () => const CameraPreviewView(),
      binding: CameraPreviewBinding(),
    ),
  ];
}
