// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

// The applicant whose onboarding process is being managed.
// Could be just applicantId, or the full ApplicantApplyModel if useful.
 String get applicantId; ApplicantApplyModel? get applicantDetails;// Optional: if we need to display some applicant info alongside tasks
// List of onboarding tasks for this applicant.
 List<OnboardingTaskModel> get tasks;// True if tasks are being fetched or an update is in progress.
 bool get isLoading;// Error message if fetching or updating tasks fails.
 String? get errorMessage;// Success message for operations like task completion.
 String? get successMessage;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.applicantDetails, applicantDetails) || other.applicantDetails == applicantDetails)&&const DeepCollectionEquality().equals(other.tasks, tasks)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,applicantId,applicantDetails,const DeepCollectionEquality().hash(tasks),isLoading,errorMessage,successMessage);

@override
String toString() {
  return 'OnboardingState(applicantId: $applicantId, applicantDetails: $applicantDetails, tasks: $tasks, isLoading: $isLoading, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 String applicantId, ApplicantApplyModel? applicantDetails, List<OnboardingTaskModel> tasks, bool isLoading, String? errorMessage, String? successMessage
});


$ApplicantApplyModelCopyWith<$Res>? get applicantDetails;

}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicantId = null,Object? applicantDetails = freezed,Object? tasks = null,Object? isLoading = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String,applicantDetails: freezed == applicantDetails ? _self.applicantDetails : applicantDetails // ignore: cast_nullable_to_non_nullable
as ApplicantApplyModel?,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<OnboardingTaskModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantApplyModelCopyWith<$Res>? get applicantDetails {
    if (_self.applicantDetails == null) {
    return null;
  }

  return $ApplicantApplyModelCopyWith<$Res>(_self.applicantDetails!, (value) {
    return _then(_self.copyWith(applicantDetails: value));
  });
}
}


/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({required this.applicantId, this.applicantDetails, final  List<OnboardingTaskModel> tasks = const [], this.isLoading = false, this.errorMessage, this.successMessage}): _tasks = tasks;
  

// The applicant whose onboarding process is being managed.
// Could be just applicantId, or the full ApplicantApplyModel if useful.
@override final  String applicantId;
@override final  ApplicantApplyModel? applicantDetails;
// Optional: if we need to display some applicant info alongside tasks
// List of onboarding tasks for this applicant.
 final  List<OnboardingTaskModel> _tasks;
// Optional: if we need to display some applicant info alongside tasks
// List of onboarding tasks for this applicant.
@override@JsonKey() List<OnboardingTaskModel> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

// True if tasks are being fetched or an update is in progress.
@override@JsonKey() final  bool isLoading;
// Error message if fetching or updating tasks fails.
@override final  String? errorMessage;
// Success message for operations like task completion.
@override final  String? successMessage;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.applicantDetails, applicantDetails) || other.applicantDetails == applicantDetails)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,applicantId,applicantDetails,const DeepCollectionEquality().hash(_tasks),isLoading,errorMessage,successMessage);

@override
String toString() {
  return 'OnboardingState(applicantId: $applicantId, applicantDetails: $applicantDetails, tasks: $tasks, isLoading: $isLoading, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 String applicantId, ApplicantApplyModel? applicantDetails, List<OnboardingTaskModel> tasks, bool isLoading, String? errorMessage, String? successMessage
});


@override $ApplicantApplyModelCopyWith<$Res>? get applicantDetails;

}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicantId = null,Object? applicantDetails = freezed,Object? tasks = null,Object? isLoading = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_OnboardingState(
applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String,applicantDetails: freezed == applicantDetails ? _self.applicantDetails : applicantDetails // ignore: cast_nullable_to_non_nullable
as ApplicantApplyModel?,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<OnboardingTaskModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantApplyModelCopyWith<$Res>? get applicantDetails {
    if (_self.applicantDetails == null) {
    return null;
  }

  return $ApplicantApplyModelCopyWith<$Res>(_self.applicantDetails!, (value) {
    return _then(_self.copyWith(applicantDetails: value));
  });
}
}

// dart format on
