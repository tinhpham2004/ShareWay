import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/widgets/decoration/app_input_decoration.dart';

class OtpFieldInput extends StatelessWidget {
  final void Function(String)? onChanged;
  final bool isOtpValid;

  OtpFieldInput({super.key, this.onChanged, this.isOtpValid = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: TextFormField(
          onChanged: (value) => onChanged?.call(value),
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: AppInputDecoration.otpField(
            context: context,
            errorText: isOtpValid == false ? '' : null,
          ),
        ),
      ),
    );
  }
}
