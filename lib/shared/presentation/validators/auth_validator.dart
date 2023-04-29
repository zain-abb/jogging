import 'package:flutter/material.dart';
import 'package:jogging/app/extensions.dart';

import '../utils/constants.dart';

/// Contains validation methods related to authentication flow.
class AuthValidator {
  AuthValidator._();

  static String? validateEmail(BuildContext context, String? value) {
    if (value!.trim().isEmpty) {
      return 'Email cannot be empty'.hardcoded;
    } else if (!Constants.emailRegex.hasMatch(value)) {
      return 'Email invalid'.hardcoded;
    } else {
      return null;
    }
  }

  static String? validateName(BuildContext context, String? value) {
    if (value!.trim().isEmpty) {
      return 'Name cannot be empty'.hardcoded;
    } else if (!Constants.nameRegex.hasMatch(value)) {
      return 'Name invalid'.hardcoded;
    } else {
      return null;
    }
  }
}
