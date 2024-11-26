import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/presentation/pending_ride/bloc/pending_ride_bloc.dart';
import 'package:share_way_frontend/presentation/pending_ride/bloc/pending_ride_state.dart';

class FilterButtonField extends StatefulWidget {
  const FilterButtonField({
    super.key,
  });

  @override
  State<FilterButtonField> createState() => _FilterButtonFieldState();
}

class _FilterButtonFieldState extends State<FilterButtonField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFilterButton(title: 'Cho đi nhờ', index: 0),
          _buildFilterButton(title: 'Đi nhờ', index: 1),
        ],
      ),
    );
  }

  Widget _buildFilterButton({
    required int index,
    required String title,
  }) {
    final bloc = context.read<PendingRideBloc>();
    return BlocBuilder<PendingRideBloc, PendingRideState>(
      builder: (context, state) {
        return AppButton(
          title: title,
          titleStyle: state.selectedButtonIndex == index
              ? textTheme.bodyLarge!.copyWith(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                )
              : textTheme.bodyLarge!.copyWith(
                  color: AppColor.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
          onPressed: () => bloc.onChangeSelectedButtonIndex(index),
          backgroundColor: state.selectedButtonIndex == index
              ? AppColor.primary100
              : AppColor.secondary100,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          flex: 0,
        );
      },
    );
  }
}
