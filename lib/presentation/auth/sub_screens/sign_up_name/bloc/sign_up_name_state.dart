import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';

part 'sign_up_name_state.g.dart';

@CopyWith()
class SignUpNameState {
  final bool isLoading;
  final String? name;
  final AuthData? authData;
  bool get isContinueButtonEnabled => name != null && name!.isNotEmpty;

  SignUpNameState({
    this.isLoading = false,
    this.name,
    this.authData,
  });
}
