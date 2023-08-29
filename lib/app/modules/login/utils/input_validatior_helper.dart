enum ValidatorResult { empty, invalid, valid, other }

class InputValidatorHelper {
  static const emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const passwordRegex = r"^[a-zA-Z0-9]{8,}$";
  static const phoneNumberRegex = r"^[0-9]{7,14}$";

  static ValidatorResult validatorEmail(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    return RegExp(emailRegex).hasMatch(input)
        ? ValidatorResult.valid
        : ValidatorResult.invalid;
  }

  static ValidatorResult validatorRequired(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    return ValidatorResult.valid;
  }

  static ValidatorResult validatorPassword(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    return RegExp(passwordRegex).hasMatch(input)
        ? ValidatorResult.valid
        : ValidatorResult.invalid;
  }

  static ValidatorResult validatorPhoneNumber(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    return RegExp(phoneNumberRegex).hasMatch(input)
        ? ValidatorResult.valid
        : ValidatorResult.invalid;
  }

  static validateEmail(value) {
    final validatorResult = validatorEmail(value);
    if (validatorResult == ValidatorResult.empty) {
      return "Email required";
    }
    if (validatorResult == ValidatorResult.invalid) {
      return "Email invalid";
    }
    return null;
  }

  static validatePassword(value) {
    final validatorResult = validatorPassword(value);
    if (validatorResult == ValidatorResult.empty) {
      return "Password required";
    }
    if (validatorResult == ValidatorResult.invalid) {
      return "Password minimal 8 karakter huruf atau angka";
    }
    return null;
  }

  static validatePhoneNumber(value) {
    final validatorResult = validatorPhoneNumber(value);
    if (validatorResult == ValidatorResult.empty) {
      return "No Telepon required";
    }
    if (validatorResult == ValidatorResult.invalid) {
      return "No Telepon invalid";
    }
    return null;
  }

  static ValidatorResult validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (password == null ||
        password.trim().isEmpty ||
        confirmPassword == null ||
        confirmPassword.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    if (!RegExp(passwordRegex).hasMatch(confirmPassword)) {
      return ValidatorResult.invalid;
    }
    if (password == confirmPassword) {
      return ValidatorResult.valid;
    }
    return ValidatorResult.other;
  }

  static validateRequired(value) {
    final validatorResult = validatorRequired(value);
    if (validatorResult == ValidatorResult.empty) {
      return "Required";
    }
  }
}
