import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/button/app_button_outline.dart';
import 'package:share_way_frontend/core/widgets/decoration/app_input_decoration.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/login/bloc/login_bloc.dart';
import 'package:share_way_frontend/presentation/login/bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;

  @override
  void initState() {
    bloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context),
      child: BlocBuilder<LoginBloc, LoginState>(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Đặt xe cùng ShareWay',
                              style: textTheme.headlineSmall!.copyWith(
                                color: AppColor.primaryText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            spaceH12,
                            Text(
                              'Đăng nhập / Đăng ký tài khoản ngay bây giờ',
                              style: textTheme.labelLarge!.copyWith(
                                color: AppColor.secondary300,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            spaceH12,
                            InternationalPhoneNumberInput(
                              // initialValue: PhoneNumber(isoCode: 'VN'),
                              textFieldController: state.phoneNumberController,
                              selectorConfig: const SelectorConfig(
                                useBottomSheetSafeArea: true,
                                selectorType: PhoneInputSelectorType.DIALOG,
                              ),
                              selectorTextStyle:
                                  textTheme.labelMedium!.copyWith(
                                color: AppColor.primaryText,
                              ),
                              formatInput: true,
                              searchBoxDecoration: AppInputDecoration.textField(
                                  context: context),
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
                            ),
                            spaceH12,
                            RichText(
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
                            ),
                            spaceH20,
                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    color: AppColor.secondary200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
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
                            ),
                            spaceH20,
                            Row(
                              children: [
                                AppButtonOutline(
                                  title: 'Đăng nhập bằng Google',
                                  icon: Assets.icons.google.svg(),
                                  onPressed: () => bloc.onGooleSignIn(context),
                                ),
                              ],
                            ),
                            spaceH20,
                            Row(
                              children: [
                                AppButtonOutline(
                                  title: 'Đăng xuất bằng Google',
                                  icon: Assets.icons.google.svg(),
                                  onPressed: () =>
                                      bloc.onGoogleSignOut(context),
                                ),
                              ],
                            ),
                            spaceH20,
                            Text('Email: ${state.email}'),
                            Text('Name: ${state.displayName}'),
                          ],
                        ),
                        Column(
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
