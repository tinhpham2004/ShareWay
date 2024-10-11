import 'package:copy_with_extension/copy_with_extension.dart';

part 'onboarding_state.g.dart';

@CopyWith()
class OnboardingState {

  final bool isLoading;

  OnboardingState({
    this.isLoading = false,
  });
}
