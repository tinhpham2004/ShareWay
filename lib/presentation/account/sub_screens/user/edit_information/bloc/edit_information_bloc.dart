// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/utils/enums/gender_enum.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';
import 'package:share_way_frontend/domain/user/user_repository.dart';
import 'package:share_way_frontend/presentation/account/sub_screens/user/edit_information/bloc/edit_information_state.dart';

class EditInformationBloc extends Cubit<EditInformationState> {
  EditInformationBloc() : super(EditInformationState());

  final _userRepository = UserRepository();

  void onStart(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      onFetchUser(context);
      final gender = [
        OptionItem(idString: 'male', name: 'Nam'),
        OptionItem(idString: 'female', name: 'Nữ'),
      ];
      emit(state.copyWith(gender: gender));
    } catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onFetchUser(BuildContext context) async {
    try {
      final response = await _userRepository.getProfile();
      emit(state.copyWith(user: response, dataChange: !state.dataChange));
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    }
  }

  void onChangeFullName(String fullName) {
    emit(state.copyWith(
      user: state.user?.copyWith(fullName: fullName),
    ));
  }

  void onChangeEmail(String email) {
    emit(state.copyWith(
      user: state.user?.copyWith(email: email),
    ));
  }

  void onChangeGender(OptionItem item) {
    emit(
      state.copyWith(
        user: state.user?.copyWith(
          gender: GenderEnum.fromString(item.idString ?? ''),
        ),
      ),
    );
  }

  void onSave(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final response = await _userRepository.updateProfile(state.user!);
    if (response == false) {
      emit(state.copyWith(isLoading: false));
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      return;
    }
    emit(state.copyWith(isLoading: false, dataChange: true));
    showSuccessSnackbar(context, 'Cập nhật thông tin thành công');
  }
}
