class SignUpValidation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please provide your email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please provide your password';
    }

    return null;
  }
}
