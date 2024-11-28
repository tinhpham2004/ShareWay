import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';
import 'package:share_way_frontend/presentation/account/models/setting.dart';

part 'account_state.g.dart';

@CopyWith()
class AccountState {
  final bool isLoading;
  final AppUser? user;
  final List<Setting> settings;
  final File? selectedImage;
  final List<File> assets;

  AccountState({
    this.isLoading = false,
    this.user,
    this.settings = const [],
    this.selectedImage,
    this.assets = const [],
  });
}
