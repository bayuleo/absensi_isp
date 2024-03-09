export 'ijin/byId/response_ijin_by_id_model.dart';
export 'ijin/byId/response_ijin_by_id_data_model.dart';
export 'ijin/byId/response_ijin_by_id_data_ijin_model.dart';
export 'ijin/count/response_ijin_count_data_model.dart';
export 'ijin/count/response_ijin_count_model.dart';
export 'ijin/detail/response_detail_ijin_data_model.dart';
export 'ijin/detail/response_detail_ijin_model.dart';
export 'ijin/detail/response_detail_ijin_user_model.dart';
export 'ijin/list/response_ijin_list_ijin_model.dart';
export 'ijin/list/response_ijin_list_model.dart';
export 'ijin/list/response_ijin_list_data_model.dart';
export 'ijin/create/response_create_ijin_data_model.dart';
export 'ijin/create/request_create_ijin_mode.dart';
export 'ijin/create/response_create_ijin_user_model.dart';
export 'ijin/create/response_create_ijin_model.dart';
export 'absent/request_absent_model.dart';
export 'absent/response_absent_data_absent_model.dart';
export 'absent/response_absent_model.dart';
export 'absent/response_absent_data_model.dart';
export 'absent/detail_absent/response_detail_absent_user_model.dart';
export 'absent/detail_absent/response_detail_absent_model.dart';
export 'absent/detail_absent/response_detail_absent_data_model.dart';
export 'argument/argument_edit_gaji.dart';
export 'auth/forgot_password/response_forgot_password_data_model.dart';
export 'auth/forgot_password/response_forgot_password_model.dart';
export 'auth/otp/response_otp_data_model.dart';
export 'auth/otp/response_otp_model.dart';
export 'auth/change_password/response_change_pasword_model.dart';
export 'auth/login/response_login_model.dart';
export 'auth/login/request_login_model.dart';
export 'auth/login/response_login_data_model.dart';
export 'admin/dashboard_absent_model.dart';
export 'admin/ijin/dashboard_ijin_data_ijin_data_model.dart';
export 'admin/ijin/dashboard_ijin_data_model.dart';
export 'admin/ijin/dashboard_ijin_model.dart';
export 'admin/ijin/dashboard_ijin_data_ijin_model.dart';
export 'admin/ijin/dashboard_ijin_data_lembur_data_model.dart';
export 'admin/ijin/dashboard_ijin_data_lembur_model.dart';
export 'admin/dashboard_absent_data_kerja_model.dart';
export 'admin/request_patch_tunjangan.dart';
export 'admin/dashboard_absent_data_model.dart';
export 'admin/request_add_tunjangan.dart';
export 'admin/dashboard_absent_data_ijin_model.dart';
export 'users/response_users_model.dart';
export 'users/list_user/response_list_users_data_model.dart';
export 'users/list_user/response_list_users_data_tunjangan_model.dart';
export 'users/list_user/response_list_users_model.dart';
export 'users/response_users_data_model.dart';
export 'users/create/response_create_user_model.dart';
export 'users/create/response_create_user_data_model.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
