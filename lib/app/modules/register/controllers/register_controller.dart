import 'package:asiagolf_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:asiagolf_app/app/domain/entities/auth_entity.dart';
import 'package:asiagolf_app/app/domain/usecase/auth/register.dart';
import 'package:asiagolf_app/app/modules/login/utils/input_validatior_helper.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/helpers.dart';
import 'package:asiagolf_app/app/utils/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

enum Gender {
  male('L'),
  female('P');

  final String value;
  const Gender(this.value);

  static Gender fromValue(String? value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse: () => Gender.male,
    );
  }
}

class RegisterController extends GetxController {
  bool isShowPassword = false;
  bool enableRegister = false;
  bool loadingBtn = false;

  Gender gender = Gender.male;

  Position? _position;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getDataLocation();
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onChangedText(value) {
    if (InputValidatorHelper.validatorRequired(nameController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorRequired(addressController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorPhoneNumber(
                phoneController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorEmail(emailController.text.trim()) ==
            ValidatorResult.valid &&
        InputValidatorHelper.validatorPassword(
                passwordController.text.trim()) ==
            ValidatorResult.valid) {
      enableRegister = true;
    } else {
      enableRegister = false;
    }
    update();
  }

  void onClickRegister() async {
    late RegisterParams params;
    late RegisterUseCase register;
    late Result<AuthEntity> result;

    loadingBtn = true;
    update();

    params = RegisterParams(
      name: nameController.text.trim(),
      address: addressController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      passwordConfirmation: passwordController.text.trim(),
      gender: gender.value,
      longitude: _position?.longitude.toString() ?? '',
      latitude: _position?.latitude.toString() ?? '',
    );

    register = RegisterUseCase(authRepository: AuthRepositoryImpl());

    result = await register.call(params);

    loadingBtn = false;

    if (result.status is Success) {
      Get.offAllNamed(Routes.HOME);
    } else {
      showSnack(result.message);
    }
    update();
  }

  void onClickLogin() {
    Get.back();
  }

  void getDataLocation() async {
    getLocation().then(
      (value) {
        _position = value;
      },
    );
  }

  void onTapShowPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  void onSelectedGender(Gender? value) {
    gender = value ?? Gender.male;
    update();
  }
}
