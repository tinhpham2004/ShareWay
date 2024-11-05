import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/add_vehicle/widgets/add_vehicle_search_dialog.dart';
import 'package:share_way_frontend/core/widgets/input/text_field_input.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/add_vehicle/bloc/add_vehicle_bloc.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/vehicle/add_vehicle/bloc/add_vehicle_state.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  late AddVehicleBloc bloc;

  @override
  void initState() {
    bloc = AddVehicleBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context),
      child: BlocListener<AddVehicleBloc, AddVehicleState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        child: BlocBuilder<AddVehicleBloc, AddVehicleState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.white,
              appBar: Appbar(title: 'Thêm phương tiện'),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            spaceH32,
                            _buildVehicleType(),
                            spaceH16,
                            _buildLicensePlate(),
                            spaceH16,
                            _buildCevetNumber()
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildSaveButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column _buildCevetNumber() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Số cà vẹt',
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        spaceH4,
        TextFieldInput(
          onChanged: (p0) => bloc.onChangeData(cavetNumber: p0),
        ),
      ],
    );
  }

  Column _buildLicensePlate() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Biển số xe',
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        spaceH4,
        TextFieldInput(
          onChanged: (p0) => bloc.onChangeData(licensePlate: p0),
        ),
      ],
    );
  }

  Widget _buildVehicleType() {
    return BlocBuilder<AddVehicleBloc, AddVehicleState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  'Loại xe',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            spaceH4,
            TextFieldInput(
              key: ObjectKey(state.dataChange),
              isReadOnly: true,
              initialValue: state.selectedVehicle?.name,
              onTap: () {
                showAddVehicleSearchDialog(
                  context: context,
                  onSelected: (p0) => bloc.onChangeVehicle(p0),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Column _buildSaveButton() {
    return Column(
      children: [
        Row(
          children: [
            AppButton(
              title: 'Lưu thay đổi',
              onPressed: () => bloc.onSave(context),
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }
}
