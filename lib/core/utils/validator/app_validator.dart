class AppValidator {

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }


  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }

    final RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');

    if (!nameRegex.hasMatch(value)) {
      return 'Name must contain letters only';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }


  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final RegExp phoneRegex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid Egyptian phone number';
    }

    return null;
  }


  static String? validateConfirmPassword(
      String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}