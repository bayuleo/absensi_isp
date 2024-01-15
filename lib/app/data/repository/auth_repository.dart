import 'package:asiagolf_app/app/data/model/index.dart';
import 'package:get/get.dart';

import '../local/user_credentials_data_source.dart';
import '../remote/auth_data_source.dart';

abstract class AuthRepository {
  Future<ResponseLoginModel> login(RequestLoginModel data);

  Future<ResponseForgotPasswordModel> forgotPassword(String email);

  Future<ResponseOtpModel> otp(String email, String otp);

  // Future<void> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final _userCredentialsDataSource = Get.find<UserCredentialsDataSource>();
  final _authDataSource = Get.find<AuthDataSource>();

  // @override
  // Future<void> signOut() async {
  //   await _authDataSource.signOut();
  //   await _userCredentialsDataSource.clearToken();
  // }

  @override
  Future<ResponseLoginModel> login(RequestLoginModel data) async {
    final res = await _authDataSource.login(data);
    return res;
  }

  @override
  Future<ResponseForgotPasswordModel> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<ResponseOtpModel> otp(String email, String otp) {
    // TODO: implement otp
    throw UnimplementedError();
  }
}