import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';

class AppRadioButton extends StatelessWidget {
  final int value;
  final int groupValue;
  final void Function(int)? onChanged;

  const AppRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged:
              onChanged != null ? (int? value) => onChanged!(value!) : null,
          fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return AppColor.primaryColor;
              }
              return AppColor.secondary200;
            },
          ),
        ),
      ],
    );
  }
}
