export 'auth/verify_otp/request_verify_otp_model.dart';
export 'auth/verify_otp/response_verify_otp_model.dart';
export 'auth/send_otp/request_send_otp_model.dart';
export 'auth/send_otp/response_send_otp_model.dart';
export 'auth/forgot_password/request_forgot_password_model.dart';
export 'auth/forgot_password/response_forgot_password_model.dart';
export 'auth/logout/response_logout_model.dart';
export 'auth/logout/request_logout_model.dart';
export 'auth/register/request_register_model.dart';
export 'auth/register/response_register_model.dart';
export 'auth/register/response_register_data_model.dart';
export 'auth/login/response_login_model.dart';
export 'auth/login/request_login_model.dart';
export 'auth/login/response_login_data_model.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
