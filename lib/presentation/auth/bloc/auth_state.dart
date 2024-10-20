import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

part 'auth_state.g.dart';

@CopyWith()
class AuthState {
  final bool isLoading;
  final TextEditingController? phoneNumberController;
  final String? phoneNumber;
  final String? errorText;
  final String? displayName;
  final String? email;
  final String? path;

  AuthState({
    this.isLoading = false,
    this.phoneNumberController,
    this.phoneNumber,
    this.errorText,
    this.displayName,
    this.email,
    this.path,
  });
}
