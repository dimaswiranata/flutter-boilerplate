// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int newStep) changeStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int newStep)? changeStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int newStep)? changeStep,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitialEvent value) initial,
    required TResult Function(ChangeStepEvent value) changeStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitialEvent value)? initial,
    TResult? Function(ChangeStepEvent value)? changeStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitialEvent value)? initial,
    TResult Function(ChangeStepEvent value)? changeStep,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingEventCopyWith<$Res> {
  factory $OnboardingEventCopyWith(
          OnboardingEvent value, $Res Function(OnboardingEvent) then) =
      _$OnboardingEventCopyWithImpl<$Res, OnboardingEvent>;
}

/// @nodoc
class _$OnboardingEventCopyWithImpl<$Res, $Val extends OnboardingEvent>
    implements $OnboardingEventCopyWith<$Res> {
  _$OnboardingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnboardingInitialEventImplCopyWith<$Res> {
  factory _$$OnboardingInitialEventImplCopyWith(
          _$OnboardingInitialEventImpl value,
          $Res Function(_$OnboardingInitialEventImpl) then) =
      __$$OnboardingInitialEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingInitialEventImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$OnboardingInitialEventImpl>
    implements _$$OnboardingInitialEventImplCopyWith<$Res> {
  __$$OnboardingInitialEventImplCopyWithImpl(
      _$OnboardingInitialEventImpl _value,
      $Res Function(_$OnboardingInitialEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnboardingInitialEventImpl implements OnboardingInitialEvent {
  const _$OnboardingInitialEventImpl();

  @override
  String toString() {
    return 'OnboardingEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingInitialEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int newStep) changeStep,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int newStep)? changeStep,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int newStep)? changeStep,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitialEvent value) initial,
    required TResult Function(ChangeStepEvent value) changeStep,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitialEvent value)? initial,
    TResult? Function(ChangeStepEvent value)? changeStep,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitialEvent value)? initial,
    TResult Function(ChangeStepEvent value)? changeStep,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OnboardingInitialEvent implements OnboardingEvent {
  const factory OnboardingInitialEvent() = _$OnboardingInitialEventImpl;
}

/// @nodoc
abstract class _$$ChangeStepEventImplCopyWith<$Res> {
  factory _$$ChangeStepEventImplCopyWith(_$ChangeStepEventImpl value,
          $Res Function(_$ChangeStepEventImpl) then) =
      __$$ChangeStepEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int newStep});
}

/// @nodoc
class __$$ChangeStepEventImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$ChangeStepEventImpl>
    implements _$$ChangeStepEventImplCopyWith<$Res> {
  __$$ChangeStepEventImplCopyWithImpl(
      _$ChangeStepEventImpl _value, $Res Function(_$ChangeStepEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newStep = null,
  }) {
    return _then(_$ChangeStepEventImpl(
      newStep: null == newStep
          ? _value.newStep
          : newStep // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeStepEventImpl implements ChangeStepEvent {
  const _$ChangeStepEventImpl({required this.newStep});

  @override
  final int newStep;

  @override
  String toString() {
    return 'OnboardingEvent.changeStep(newStep: $newStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStepEventImpl &&
            (identical(other.newStep, newStep) || other.newStep == newStep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newStep);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStepEventImplCopyWith<_$ChangeStepEventImpl> get copyWith =>
      __$$ChangeStepEventImplCopyWithImpl<_$ChangeStepEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int newStep) changeStep,
  }) {
    return changeStep(newStep);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int newStep)? changeStep,
  }) {
    return changeStep?.call(newStep);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int newStep)? changeStep,
    required TResult orElse(),
  }) {
    if (changeStep != null) {
      return changeStep(newStep);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitialEvent value) initial,
    required TResult Function(ChangeStepEvent value) changeStep,
  }) {
    return changeStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitialEvent value)? initial,
    TResult? Function(ChangeStepEvent value)? changeStep,
  }) {
    return changeStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitialEvent value)? initial,
    TResult Function(ChangeStepEvent value)? changeStep,
    required TResult orElse(),
  }) {
    if (changeStep != null) {
      return changeStep(this);
    }
    return orElse();
  }
}

abstract class ChangeStepEvent implements OnboardingEvent {
  const factory ChangeStepEvent({required final int newStep}) =
      _$ChangeStepEventImpl;

  int get newStep;
  @JsonKey(ignore: true)
  _$$ChangeStepEventImplCopyWith<_$ChangeStepEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OnboardingState {
  OnboardingStatus get status => throw _privateConstructorUsedError;
  int get currentStep => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call({OnboardingStatus status, int currentStep});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentStep = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OnboardingStatus,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OnboardingStatus status, int currentStep});
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentStep = null,
  }) {
    return _then(_$OnboardingStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OnboardingStatus,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnboardingStateImpl implements _OnboardingState {
  const _$OnboardingStateImpl(
      {this.status = OnboardingStatus.initial, this.currentStep = 0});

  @override
  @JsonKey()
  final OnboardingStatus status;
  @override
  @JsonKey()
  final int currentStep;

  @override
  String toString() {
    return 'OnboardingState(status: $status, currentStep: $currentStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, currentStep);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState(
      {final OnboardingStatus status,
      final int currentStep}) = _$OnboardingStateImpl;

  @override
  OnboardingStatus get status;
  @override
  int get currentStep;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
