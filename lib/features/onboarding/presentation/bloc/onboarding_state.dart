part of 'onboarding_bloc.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(OnboardingStatus.initial) OnboardingStatus status,
    @Default(0) int currentStep,
  }) = _OnboardingState;

  factory OnboardingState.initial() {
    return const OnboardingState();
  }
}

enum OnboardingStatus {
  initial,
  loading,
  error,
  success,
}
