import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/button/app_button_outline.dart';
import 'package:share_way_frontend/core/widgets/decoration/app_input_decoration.dart';
import 'package:share_way_frontend/presentation/auth/bloc/auth_bloc.dart';
import 'package:share_way_frontend/presentation/auth/bloc/auth_state.dart';

class AuthScreen extends StatefulWidget {
  final String path;
  const AuthScreen({super.key, required this.path});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthBloc bloc;

  @override
  void initState() {
    bloc = AuthBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context: context, path: widget.path),
      child: BlocBuilder<AuthBloc, AuthState>(
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
                          _buildPhoneNumberField(state, context),
                          spaceH12,
                          _buildTermsField(),
                          spaceH20,
                          _buildDivider(),
                          spaceH20,
                          _buildGoogleLoginButton(context),
                          spaceH20,
                          Row(
                            children: [
                              AppButtonOutline(
                                title: 'Đăng xuất bằng Google',
                                icon: AppIcon.google,
                                onPressed: () => bloc.onGoogleSignOut(context),
                              ),
                            ],
                          ),
                          spaceH20,
                          Text('Email: ${state.email}'),
                          Text('Name: ${state.displayName}'),
                        ],
                      ),
                    ),
                  ),
                  _buildContinueButton(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Column _buildContinueButton(BuildContext context) {
    return Column(
                  children: [
                    Row(
                      children: [
                        AppButton(
                          title: 'Tiếp tục',
                          onPressed: () =>
                              bloc.onValidatePhoneNumber(context),
                        ),
                      ],
                    ),
                    spaceH12,
                  ],
                );
  }

  Row _buildGoogleLoginButton(BuildContext context) {
    return Row(
                          children: [
                            AppButtonOutline(
                              title: 'Đăng nhập bằng Google',
                              icon: AppIcon.google,
                              onPressed: () => bloc.onGooleSignIn(context),
                            ),
                          ],
                        );
  }

  Row _buildDivider() {
    return Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: AppColor.secondary200,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Hoặc",
                                style: textTheme.labelLarge!.copyWith(
                                  color: AppColor.primaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: AppColor.secondary200,
                              ),
                            ),
                          ],
                        );
  }

  RichText _buildTermsField() {
    return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Bằng việc tiếp tục, Bạn đồng ý với ',
                                style: textTheme.labelLarge!.copyWith(
                                  color: AppColor.secondary300,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'quy chế, điều khoản',
                                style: textTheme.labelLarge!.copyWith(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' sử dụng của tổ chức.',
                                style: textTheme.labelLarge!.copyWith(
                                  color: AppColor.secondary300,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
  }

  InternationalPhoneNumberInput _buildPhoneNumberField(AuthState state, BuildContext context) {
    return InternationalPhoneNumberInput(
                          // initialValue: PhoneNumber(isoCode: 'VN'),
                          textFieldController: state.phoneNumberController,
                          selectorConfig: const SelectorConfig(
                            useBottomSheetSafeArea: true,
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          selectorTextStyle: textTheme.labelMedium!.copyWith(
                            color: AppColor.primaryText,
                          ),
                          formatInput: true,
                          searchBoxDecoration:
                              AppInputDecoration.textField(context: context),
                          inputDecoration: AppInputDecoration.textField(
                            context: context,
                            hintext: 'Số điện thoại',
                            errorText: state.errorText,
                            suffixIcon: GestureDetector(
                              onTap: () => bloc.onClearData(),
                              child: AppIcon.clearData,
                            ),
                          ),
                          onInputChanged: (PhoneNumber value) =>
                              bloc.onChangePhoneNumber(value.phoneNumber),
                        );
  }

  Text _buildSmallText() {
    return Text(
                          'Đăng nhập / Đăng ký tài khoản ngay bây giờ',
                          style: textTheme.labelLarge!.copyWith(
                            color: AppColor.secondary300,
                            fontWeight: FontWeight.w500,
                          ),
                        );
  }

  Text _buildHeader() {
    return Text(
                          'Đặt xe cùng ShareWay',
                          style: textTheme.headlineSmall!.copyWith(
                            color: AppColor.primaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        );
  }
}
