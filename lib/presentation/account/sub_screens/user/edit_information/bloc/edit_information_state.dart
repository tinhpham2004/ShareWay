import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/domain/shared/models/option_item.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';

part 'edit_information_state.g.dart';

@CopyWith()
class EditInformationState {
  final bool isLoading;
  final bool dataChange;
  final AppUser? user;
  final List<OptionItem> gender;

  EditInformationState({
    this.isLoading = false,
    this.dataChange = false,
    this.user,
    this.gender = const [],
  });
}
