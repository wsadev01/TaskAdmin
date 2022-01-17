import 'package:get/get.dart';

class FormController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debounce(_email, validateEmail, time: const Duration(milliseconds: 500));
    debounce(_password, validatePassword, time: const Duration(milliseconds: 500));
  }
  final RxString _email = RxString("");
  final RxString _password = RxString("");

  final RxnString _errorText = RxnString(null);

  String get email => _email.value;
  set email(String value) => _email.value = value;

  String get password => _password.value;
  set password(String value) => _password.value = value;

  String? get errorText => _errorText.value;
  set errorText(String? value) => _errorText.value = value;

  void validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      errorText = "Invalid email format";
    } else if (value.isEmpty) {
      errorText = "Email can not be empty";
    }
    return;
  }

  validatePassword(String value) {
    if (value.isEmpty) {
      errorText = "Password can not be empty";
    } else if(value.length < 8) {
      errorText = "Password can not contain less than eight characters";
    }
    return;
  }

}