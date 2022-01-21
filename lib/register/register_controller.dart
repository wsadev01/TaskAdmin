import 'package:get/get.dart';

class FormController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debounce(_email, validateEmail, time: const Duration(milliseconds: 500));
    debounce(_password, validatePassword, time: const Duration(milliseconds: 500));
    debounce(_confirmPassword, validatePassword, time: const Duration(milliseconds: 500));
  }
  final RxString _email = RxString("");
  final RxString _password = RxString("");
  final RxString _confirmPassword = RxString("");

  final RxnString _emailErrorText = RxnString(null);
  final RxnString _passwordErrorText = RxnString(null);

  String get email => _email.value;
  set email(String value) => _email.value = value;

  String get password => _password.value;
  set password(String value) => _password.value = value;
  String get confirmPassword => _confirmPassword.value;
  set confirmPassword(String value) => _confirmPassword.value = value;

  String? get emailErrorText => _emailErrorText.value;
  set emailErrorText(String? value) => _emailErrorText.value = value;
  String? get passwordErrorText => _passwordErrorText.value;
  set passwordErrorText(String? value) => _passwordErrorText.value = value;

  void validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailErrorText = "Invalid email format";
    } else if (value.isEmpty) {
      emailErrorText = "Email can not be empty";
    } else {
      emailErrorText = null;
    }
    return;
  }

  validatePassword(String value) {
    if (value.isEmpty) {
      passwordErrorText = "Password can not be empty";
    } else if(value.length < 8) {
      passwordErrorText = "Password can not contain less than eight characters";
    } else if(confirmPassword != password) {
      passwordErrorText = "Passwords do not match";
    } else {
      passwordErrorText = null;
    }
    return;
  }

}