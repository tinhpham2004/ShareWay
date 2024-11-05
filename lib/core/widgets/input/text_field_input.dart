import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/widgets/decoration/app_input_decoration.dart';

class TextFieldInput extends StatelessWidget {
  final Function(String)? onChanged;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? initialValue;
  const TextFieldInput({
    super.key,
    this.onChanged,
    this.isReadOnly = false,
    this.onTap,
    this.controller,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: AppInputDecoration.textField(context: context),
      onChanged: onChanged,
      readOnly: isReadOnly,
      onTap: onTap,
      initialValue: initialValue,
    );
  }
}
