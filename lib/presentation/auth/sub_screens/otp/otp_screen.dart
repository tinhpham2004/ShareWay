import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/dialog/loading_dialog.dart';
import 'package:share_way_frontend/core/widgets/input/otp_field_input.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/otp/bloc/otp_bloc.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/otp/bloc/otp_state.dart';

class OtpScreen extends StatefulWidget {
  final AuthData authData;
  const OtpScreen({
    super.key,
    required this.authData,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OtpBloc bloc;

  @override
  void initState() {
    bloc = OtpBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(widget.authData),
      child: BlocListener<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        child: BlocBuilder<OtpBloc, OtpState>(
          builder: (context, state) {
            return Scaffold(
              body: Column(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(),
                          spaceH8,
                          _buildSmallText(state),
                          spaceH24,
                          _buildOTPInputField(state, context),
                          _buildOTPErrors(state),
                          _buildRemainingTime(state),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column _buildSmallText(OtpState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Mã xác thực sẽ được gửi tới số ',
                style: textTheme.labelLarge!.copyWith(
                  color: AppColor.secondary300,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: state.authData?.phoneNumber ?? 'N/A',
                style: textTheme.labelLarge!.copyWith(
                  color: AppColor.primaryText,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        spaceH8,
        Text(
          'Vui lòng kiểm tra tin nhắn và nhập mã xác thực vào đây',
          style: textTheme.labelLarge!.copyWith(
            color: AppColor.secondary300,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildRemainingTime(OtpState state) {
    return state.remainingTime == 0
        ? GestureDetector(
            onTap: () => bloc.onResendOtp(),
            child: Text(
              'Gửi lại mã xác thực',
              style: textTheme.labelLarge!.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : Text(
            'Gửi lại mã xác thực (${state.formattedTime})',
            style: textTheme.labelLarge!.copyWith(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          );
  }

  Text _buildOTPErrors(OtpState state) {
    return Text(
      state.errorText ?? '',
      style: textTheme.labelMedium!.copyWith(
        color: AppColor.error,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Row _buildOTPInputField(OtpState state, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        6,
        (index) {
          return OtpFieldInput(
            isOtpValid: state.isOtpValid,
            onChanged: (value) => bloc.onOtpChanged(
              context: context,
              index: index,
              value: int.tryParse(value),
            ),
          );
        },
      ),
    );
  }

  Text _buildHeader() {
    return Text(
      'Nhập mã xác thực',
      style: textTheme.headlineSmall!.copyWith(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
