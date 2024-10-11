import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/widgets/decoration/app_input_decoration.dart';

class TextFieldInput extends StatelessWidget {
  final Function(String)? onChanged;
  const TextFieldInput({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: AppInputDecoration.textField(context: context),
      onChanged: onChanged,
    );
  }
}
