import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/widgets/decoration/app_input_decoration.dart';

class TextFieldInput extends StatelessWidget {
  final Function(String)? onChanged;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? initialValue;
  final InputDecoration? decoration;
  final EdgeInsets? padding;
  const TextFieldInput({
    super.key,
    this.onChanged,
    this.isReadOnly = false,
    this.onTap,
    this.controller,
    this.initialValue,
    this.decoration,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      child: TextFormField(
        controller: controller,
        decoration:
            decoration ?? AppInputDecoration.textField(context: context),
        onChanged: onChanged,
        readOnly: isReadOnly,
        onTap: onTap,
        initialValue: initialValue,
      ),
    );
  }
}
