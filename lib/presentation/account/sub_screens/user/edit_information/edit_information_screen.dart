import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/appbar/appbar.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/input/dropdown_field_input.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_dialog.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';
import 'package:share_way_frontend/main.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/user/edit_information/bloc/edit_information_bloc.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/user/edit_information/bloc/edit_information_state.dart';
import 'package:share_way_frontend/core/widgets/input/text_field_input.dart';

class EditInformationScreen extends StatefulWidget {
  const EditInformationScreen({super.key});

  @override
  State<EditInformationScreen> createState() => _EditInformationScreenState();
}

class _EditInformationScreenState extends State<EditInformationScreen> {
  late EditInformationBloc bloc;

  @override
  void initState() {
    bloc = EditInformationBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(context),
      child: BlocListener<EditInformationBloc, EditInformationState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        child: BlocBuilder<EditInformationBloc, EditInformationState>(
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
                          key: ObjectKey(state.dataChange),
                          children: [
                            spaceH32,
                            _buildFullName(),
                            spaceH16,
                            _buildEmail(),
                            spaceH16,
                            _buildGender()
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

  Widget _buildGender() {
    return BlocBuilder<EditInformationBloc, EditInformationState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  'Giới tính',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            spaceH4,
            DropdownFieldInput(
              items: state.gender,
              initalValue: state.gender.firstWhereOrNull(
                (e) => e.idString == state.user?.gender.toString(),
              ),
              onChanged: (p0) {
                if (p0 != null) {
                  bloc.onChangeGender(p0);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmail() {
    return BlocBuilder<EditInformationBloc, EditInformationState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  'Email',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            spaceH4,
            TextFieldInput(
              initialValue: state.user?.email,
              onChanged: (p0) => bloc.onChangeEmail(p0),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFullName() {
    return BlocBuilder<EditInformationBloc, EditInformationState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  'Họ và Tên',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            spaceH4,
            TextFieldInput(
              initialValue: state.user?.fullName,
              onChanged: (p0) => bloc.onChangeFullName(p0),
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
              isMargin: true,
              onPressed: () => bloc.onSave(context),
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }
}
