import 'package:copy_with_extension/copy_with_extension.dart';

part 'sign_up_name_state.g.dart';

@CopyWith()
class SignUpNameState {
  final String? name;
  bool get isContinueButtonEnabled => name != null && name!.isNotEmpty;

  SignUpNameState({
    this.name,
  });
}
