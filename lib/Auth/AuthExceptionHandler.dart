import 'AuthResultStatus.dart';

class AuthExceptionHandler {
  static handleException(e) {
    var status;
    print(e);
    switch (e) {
      case "ERROR_INVALID_EMAIL":
        status = AuthResultStatus.invalidEmail;
        break;
      case "ERROR_WRONG_PASSWORD":
        status = AuthResultStatus.wrongPassword;
        break;
      case "ERROR_USER_NOT_FOUND":
        status = AuthResultStatus.userNotFound;
        break;
      case "ERROR_USER_DISABLED":
        status = AuthResultStatus.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Geçersiz e-posta!";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Hatalı şifre girdiniz!";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "Böyle bir hesap bulunamadı!";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "Bu kullanıcı engellendi!";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Lütfen bir süre bekleyip tekrar deneyin.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "E-posta ve şifre etkinleştirilmedi.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            "Bu e-posta kullanılmakta.Tekrar deneyin ya da şifrenizi sıfırlayın.";
        break;
      default:
        errorMessage = "Wrong email or password!";
    }

    return errorMessage;
  }
}
