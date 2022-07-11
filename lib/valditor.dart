String? validateLogin(String value, String msg) {
  if (value.isEmpty || value == null) {
    return msg;
  }
  return null;
}

String? isEmailValid(String email) {
  final _EmailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (email == null || email.isEmpty) {
    return 'Enter your email';
  } else if (!_EmailRegExp.hasMatch(email ?? '')) {
    return 'Enter vaild email';
  } else
    return null;
}
