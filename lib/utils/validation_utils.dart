import '../constants/regex_constants.dart';
import '../constants/validation_constants.dart';

class ValidationUtils
{
  // empty check for username and char less than 4
  static validateUsername(String username) {
    if (username.trim().length == 0) {
      return ValidationConstants.enterUsername;
    } else if (username.length >= 1 && username.length < 4) {
      return ValidationConstants.enterUsername4OrMoreCharWarning;
    }
    return null;
  }

  // validate email if optional
  static validateEmail(String email) {
    bool emailValid = RegExp(RegexConstants.emailRegex).hasMatch(email);
    if (email == "") {
      return ValidationConstants.enterValidEmailWarning;
    } else if (!emailValid) {
      return ValidationConstants.enterValidEmailWarning;
    }
    return null;
  }

  // password empty check and char more than 8 with proper format
  static validatePassword(String password, String validationString) {
    bool isValidPassword =
        RegExp(RegexConstants.passwordRegex).hasMatch(password);
    if (password.trim().length == 0) {
      return validationString;
    } else if (password.trim().length < 8) {
      return ValidationConstants.passwordValidateWarning;
    } else if (password.trim().length >= 8) {
      if (!isValidPassword) {
        return ValidationConstants.passwordValidateWarning;
      }
    }
    return null;
  }
}