part of 'onboarding_bloc.dart';

@freezed
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.initial() = OnboardingInitialEvent;

  const factory OnboardingEvent.changeStep({
    required int newStep,
  }) = ChangeStepEvent;
}
