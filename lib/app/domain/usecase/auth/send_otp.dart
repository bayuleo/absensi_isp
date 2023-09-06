import 'package:asiagolf_app/app/data/model/auth/send_otp/request_send_otp_model.dart';
import 'package:asiagolf_app/app/domain/repositories/auth_repository.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:asiagolf_app/app/utils/usecase.dart';

class SendOtpUseCase
    extends UseCase<dynamic, RequestSendOtpModel> {
  final AuthRepository authRepository;

  SendOtpUseCase({required this.authRepository});

  @override
  Future<Result<bool>> call(RequestSendOtpModel params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    }

    return authRepository.sendOtp(params);
  }
}
