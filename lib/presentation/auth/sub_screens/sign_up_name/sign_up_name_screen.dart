import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/dialog/loading_dialog.dart';
import 'package:share_way_frontend/core/widgets/input/text_field_input.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/sign_up_name/bloc/sign_up_name_bloc.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/sign_up_name/bloc/sign_up_name_state.dart';

class SignUpNameScreen extends StatefulWidget {
  final AuthData authData;
  const SignUpNameScreen({super.key, required this.authData});

  @override
  State<SignUpNameScreen> createState() => _SignUpNameScreenState();
}

class _SignUpNameScreenState extends State<SignUpNameScreen> {
  late SignUpNameBloc bloc;

  @override
  void initState() {
    bloc = SignUpNameBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(widget.authData),
      child: BlocListener<SignUpNameBloc, SignUpNameState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) => previous.isLoading != current.isLoading,
        child: BlocBuilder<SignUpNameBloc, SignUpNameState>(
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(left: 16.0, top: 64.h, right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(),
                            spaceH8,
                            _buildSmallText(),
                            spaceH24,
                            _buildNameInputField(),
                          ],
                        ),
                      ),
                    ),
                    _buildContinueButton(context, state),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Column _buildContinueButton(BuildContext context, SignUpNameState state) {
    return Column(
      children: [
        Row(
          children: [
            AppButton(
              title: 'Tiếp tục',
              onPressed: () => bloc.onContinueButtonPressed(context),
              isEnabled: state.isContinueButtonEnabled,
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }

  TextFieldInput _buildNameInputField() {
    return TextFieldInput(
      onChanged: (value) => bloc.onChangeName(value),
    );
  }

  Text _buildSmallText() {
    return Text(
      'Vui lòng nhập tên của bạn',
      style: textTheme.labelLarge!.copyWith(
        color: AppColor.secondary300,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text _buildHeader() {
    return Text(
      'Tên của bạn là gì?',
      style: textTheme.headlineSmall!.copyWith(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
