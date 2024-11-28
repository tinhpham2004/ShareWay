import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/widgets/decoration/app_input_decoration.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';

class DropdownFieldInput extends StatefulWidget {
  final List<OptionItem> items;
  final Function(OptionItem?)? onChanged;
  final OptionItem? initalValue;
  DropdownFieldInput(
      {super.key, required this.items, this.onChanged, this.initalValue});

  @override
  State<DropdownFieldInput> createState() => _DropdownFieldInputState();
}

class _DropdownFieldInputState extends State<DropdownFieldInput> {
  OptionItem? selectedItem;

  @override
  void initState() {
    selectedItem = widget.initalValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<OptionItem>(
      value: selectedItem,
      decoration: AppInputDecoration.textField(context: context),
      style: textTheme.bodyLarge,
      items: widget.items.map((OptionItem value) {
        return DropdownMenuItem<OptionItem>(
          value: value,
          child: Text(value.name ?? ''),
        );
      }).toList(),
      icon: AppIcon.arrow_downward,
      onChanged: (OptionItem? value) {
        selectedItem = value;
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}
