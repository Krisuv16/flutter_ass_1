class FieldValidator {
  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Enter Email';
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return 'Enter Valid Email';
    }
    return '';
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Enter password';
    }

    if (value.length < 6) {
      return 'Password is too short';
    }
    return '';
  }
}
