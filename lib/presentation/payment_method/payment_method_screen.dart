import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_payment_method.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/radio_button/app_radio_button.dart';
import 'package:share_way_frontend/presentation/hitch_ride/hitch_ride_recommendation_detail/bloc/hitch_ride_recommendation_detail_bloc.dart';
import 'package:share_way_frontend/presentation/payment_method/bloc/payment_method_bloc.dart';
import 'package:share_way_frontend/presentation/payment_method/bloc/payment_method_state.dart';

class PaymentMethodScreen extends StatefulWidget {
  final HitchRideRecommendationDetailBloc hitchRideRecommendationDetailBloc;
  const PaymentMethodScreen(
      {super.key, required this.hitchRideRecommendationDetailBloc});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  late PaymentMethodBloc bloc;

  @override
  void initState() {
    bloc = PaymentMethodBloc(
        hitchRideRecommendationDetailBloc:
            widget.hitchRideRecommendationDetailBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(),
      child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.white,
            appBar: Appbar(
              title: 'Phương thức thanh toán',
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      key: ObjectKey(state.dataChange),
                      children: [
                        spaceH32,
                        Row(
                          children: [
                            spaceW16,
                            Text(
                              'Các phương thức thanh toán',
                              style: textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        _buildPaymentMethodField(),
                      ],
                    ),
                  ),
                ),
                _buildConfirmButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Column _buildConfirmButton() {
    return Column(
      children: [
        Row(
          children: [
            AppButton(
              title: 'Xác nhận',
              onPressed: () => bloc.onConfirm(context),
              isMargin: true,
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }

  Widget _buildPaymentMethodField() {
    return BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 16.h,
            bottom: 8.h,
          ),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColor.c_40D6D4D4,
                offset: Offset(0, 4.h),
                blurRadius: 20.r,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: appPaymentMethods.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Divider(
              color: AppColor.secondary300,
            ),
            itemBuilder: (context, index) {
              final paymentMethod = appPaymentMethods[index];
              return Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      paymentMethod.icon!,
                    ],
                  ),
                  spaceW8,
                  Expanded(
                    child: TextFormField(
                      initialValue: paymentMethod.title,
                      enabled: false,
                      style: textTheme.bodyLarge!
                          .copyWith(color: AppColor.secondary400),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  AppRadioButton(
                    value: index,
                    groupValue: state.selectedPaymentMethod,
                    onChanged: (p0) => bloc.onPaymentMethodSelected(
                        context: context, index: p0),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
