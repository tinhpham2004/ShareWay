import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

part 'login_state.g.dart';

@CopyWith()
class LoginState {
  final TextEditingController? phoneNumberController;
  final String? phoneNumber;
  final String? errorText;
  final String? displayName;
  final String? email;

  LoginState({
    this.phoneNumberController,
    this.phoneNumber,
    this.errorText,
    this.displayName,
    this.email
  });
}
