import 'package:get/get.dart';

import '../modules/camera_preview/bindings/camera_preview_binding.dart';
import '../modules/camera_preview/views/camera_preview_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/detail_absensi/bindings/detail_absensi_binding.dart';
import '../modules/detail_absensi/views/detail_absensi_view.dart';
import '../modules/detail_clock_in/bindings/detail_clock_in_binding.dart';
import '../modules/detail_clock_in/views/detail_clock_in_view.dart';
import '../modules/detail_request/bindings/detail_request_binding.dart';
import '../modules/detail_request/views/detail_request_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/forgot_password_otp/bindings/forgot_password_otp_binding.dart';
import '../modules/forgot_password_otp/views/forgot_password_otp_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_admin/bindings/home_admin_binding.dart';
import '../modules/home_admin/views/home_admin_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/report_absensi/bindings/report_absensi_binding.dart';
import '../modules/report_absensi/views/report_absensi_view.dart';
import '../modules/report_lembur/bindings/report_lembur_binding.dart';
import '../modules/report_lembur/views/report_lembur_view.dart';
import '../modules/report_payroll/bindings/report_payroll_binding.dart';
import '../modules/report_payroll/views/report_payroll_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/test/bindings/test_binding.dart';
import '../modules/test/views/test_view.dart';
import '../modules/user_detail/bindings/user_detail_binding.dart';
import '../modules/user_detail/views/user_detail_view.dart';
import '../modules/users_create/bindings/users_create_binding.dart';
import '../modules/users_create/views/users_create_view.dart';
import '../modules/users_list/bindings/users_list_binding.dart';
import '../modules/users_list/views/users_list_view.dart';

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
    GetPage(
      name: _Paths.DETAIL_REQUEST,
      page: () => const DetailRequestView(),
      binding: DetailRequestBinding(),
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => const TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => const HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.USERS_LIST,
      page: () => const UsersListView(),
      binding: UsersListBinding(),
    ),
    GetPage(
      name: _Paths.USERS_CREATE,
      page: () => const UsersCreateView(),
      binding: UsersCreateBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_ABSENSI,
      page: () => const ReportAbsensiView(),
      binding: ReportAbsensiBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_LEMBUR,
      page: () => const ReportLemburView(),
      binding: ReportLemburBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_PAYROLL,
      page: () => const ReportPayrollView(),
      binding: ReportPayrollBinding(),
    ),
    GetPage(
      name: _Paths.USER_DETAIL,
      page: () => const UserDetailView(),
      binding: UserDetailBinding(),
    ),
  ];
}
