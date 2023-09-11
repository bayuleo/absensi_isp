import 'package:asiagolf_app/app/data/model/auth/verify_otp/request_verify_otp_model.dart';
import 'package:asiagolf_app/app/domain/repositories/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class VerifyOtpUseCase
    extends UseCase<dynamic, RequestVerifyOtpModel> {
  final AuthRepository authRepository;

  VerifyOtpUseCase({required this.authRepository});

  @override
  Future<Result<bool>> call(RequestVerifyOtpModel params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.verifyOtp(params);
  }
}
