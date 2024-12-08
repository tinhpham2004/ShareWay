import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/core/widgets/map/pick_location_map.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_location/bloc/give_ride_pick_location_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_pick_location/bloc/give_ride_pick_location_state.dart';

class GiveRidePickLocationScreen extends StatefulWidget {
  GiveRidePickLocationScreen({super.key});

  @override
  State<GiveRidePickLocationScreen> createState() =>
      _GiveRidePickLocationScreenState();
}

class _GiveRidePickLocationScreenState
    extends State<GiveRidePickLocationScreen> {
  late GiveRidePickLocationBloc bloc;

  @override
  void initState() {
    bloc = GiveRidePickLocationBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context),
      child: BlocListener<GiveRidePickLocationBloc, GiveRidePickLocationState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        child: BlocBuilder<GiveRidePickLocationBloc, GiveRidePickLocationState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.white,
              appBar: Appbar(
                title: 'Bạn muốn đi đâu?',
                actions: [
                  AppButton(
                    flex: 0,
                    shape: BoxShape.circle,
                    icon: AppIcon.mapButton,
                    backgroundColor: AppColor.white,
                    padding: EdgeInsets.all(8.w),
                    onPressed: () => _showGoongMapPopup(),
                  ),
                  spaceW16,
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        key: ObjectKey(state.dataChange),
                        children: [
                          _buildLocationInputField(),
                          _buildFilterButtonField(),
                          _buildFilterResultField(),
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
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }

  Widget _buildDashedLine() {
    return SizedBox(
      height: 8.h,
      width: 2.w,
      child: Column(
        children: List.generate(
          2,
          (index) => Expanded(
            child: Container(
              width: 2.w,
              color:
                  index % 2 == 0 ? AppColor.secondary300 : AppColor.transparent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButtonField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFilterButton(title: 'Dùng gần đây', index: 0),
          _buildFilterButton(title: 'Đề xuất', index: 1),
          _buildFilterButton(title: 'Đã lưu', index: 2),
        ],
      ),
    );
  }

  Widget _buildFilterButton({
    required int index,
    required String title,
  }) {
    return BlocBuilder<GiveRidePickLocationBloc, GiveRidePickLocationState>(
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

  Widget _buildLocationInputField() {
    return BlocBuilder<GiveRidePickLocationBloc, GiveRidePickLocationState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 24.h,
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
            itemCount: state.locationList.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 28.sp,
                      child: _buildDashedLine(),
                    ),
                  ],
                ),
                const Expanded(
                  child: Divider(
                    color: AppColor.secondary300,
                  ),
                ),
              ],
            ),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (index != 0) _buildDashedLine() else spaceH8,
                      index == 0
                          ? AppIcon.startLocation
                          : AppIcon.otherLocation,
                      if (index != state.locationList.length - 1)
                        _buildDashedLine()
                      else
                        spaceH8,
                    ],
                  ),
                  spaceW8,
                  Expanded(
                    child: TextFormField(
                      initialValue: state.locationList[index].name,
                      style: textTheme.bodyLarge,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                      ),
                      onTap: () => bloc.onChangeEdittingIndex(index),
                      onChanged: (value) => bloc.onChangeLocation(
                        context: context,
                        index: index,
                        location: value,
                      ),
                    ),
                  ),
                  if (index >= 1 && index < state.locationList.length - 1)
                    Row(
                      children: [
                        IconButton(
                          icon: AppIcon.swapLocation,
                          onPressed: () => bloc.onSwapLocation(index),
                        ),
                        SizedBox(
                          height: 30.h,
                          child: const VerticalDivider(
                            color: AppColor.secondary300,
                          ),
                        ),
                        IconButton(
                          icon: AppIcon.deleteLocation,
                          onPressed: () => bloc.onRemoveLocation(index),
                        ),
                      ],
                    )
                  else if (index == state.locationList.length - 1)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: AppIcon.swapLocation,
                          onPressed: () => bloc.onSwapLocation(index),
                        ),
                        SizedBox(
                          height: 30.h,
                          child: const VerticalDivider(
                            color: AppColor.secondary300,
                          ),
                        ),
                        IconButton(
                          icon: AppIcon.addLocation,
                          onPressed: () => bloc.onAddLocation(context),
                        )
                      ],
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildFilterResultField() {
    return BlocBuilder<GiveRidePickLocationBloc, GiveRidePickLocationState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state
              .autocompleteList.length, // Adjust this for the number of items
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              const Divider(color: AppColor.secondary300),
          itemBuilder: (context, index) {
            return _buildFilterResult(index: index);
          },
        );
      },
    );
  }

  Widget _buildFilterResult({required int index}) {
    return BlocBuilder<GiveRidePickLocationBloc, GiveRidePickLocationState>(
      builder: (context, state) {
        return InkWell(
          onTap: () => bloc.onSelectAutocomplete(
            context: context,
            item: state.autocompleteList[index],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon and distance
                Column(
                  children: [
                    AppIcon.time,
                    spaceH4,
                    Text('${state.autocompleteList[index].distance ?? 0} km',
                        style: textTheme.labelSmall!
                            .copyWith(color: AppColor.secondaryColor)),
                  ],
                ),
                spaceW16,
                // Place details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.autocompleteList[index].mainText ?? '',
                        style: textTheme.titleSmall,
                      ),
                      spaceH4,
                      Text(
                        state.autocompleteList[index].secondaryText ?? '',
                        style: textTheme.bodyMedium!
                            .copyWith(color: AppColor.secondaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showGoongMapPopup() {
    if (bloc.state.edittingIndex == null) {
      showErrorSnackbar(context, 'Vui lòng chọn vị trí cần chỉnh sửa');
      return;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PickLocationMap(
          onConfirmLocation: (item) =>
              bloc.onSelectLocationOnMap(context: context, item: item),
          onChangeLocation: (lng, lat) async =>
              await bloc.onChangeLocationOnMap(
            context: context,
            lng: lng,
            lat: lat,
          ),
        );
      },
    );
  }
}
