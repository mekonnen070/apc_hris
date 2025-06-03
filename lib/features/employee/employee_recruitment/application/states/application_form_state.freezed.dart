// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationFormState {

// The application data being built by the user.
 ApplicantApplyModel get applicationData;// True if the form is currently being submitted to the backend.
 bool get isSubmitting;// Any error message from the last submission attempt.
 String? get errorMessage;// Message for successful submission.
 String? get successMessage;// To track the picked resume file locally before upload.
 File? get pickedResumeFile;
/// Create a copy of ApplicationFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationFormStateCopyWith<ApplicationFormState> get copyWith => _$ApplicationFormStateCopyWithImpl<ApplicationFormState>(this as ApplicationFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationFormState&&(identical(other.applicationData, applicationData) || other.applicationData == applicationData)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.pickedResumeFile, pickedResumeFile) || other.pickedResumeFile == pickedResumeFile));
}


@override
int get hashCode => Object.hash(runtimeType,applicationData,isSubmitting,errorMessage,successMessage,pickedResumeFile);

@override
String toString() {
  return 'ApplicationFormState(applicationData: $applicationData, isSubmitting: $isSubmitting, errorMessage: $errorMessage, successMessage: $successMessage, pickedResumeFile: $pickedResumeFile)';
}


}

/// @nodoc
abstract mixin class $ApplicationFormStateCopyWith<$Res>  {
  factory $ApplicationFormStateCopyWith(ApplicationFormState value, $Res Function(ApplicationFormState) _then) = _$ApplicationFormStateCopyWithImpl;
@useResult
$Res call({
 ApplicantApplyModel applicationData, bool isSubmitting, String? errorMessage, String? successMessage, File? pickedResumeFile
});


$ApplicantApplyModelCopyWith<$Res> get applicationData;

}
/// @nodoc
class _$ApplicationFormStateCopyWithImpl<$Res>
    implements $ApplicationFormStateCopyWith<$Res> {
  _$ApplicationFormStateCopyWithImpl(this._self, this._then);

  final ApplicationFormState _self;
  final $Res Function(ApplicationFormState) _then;

/// Create a copy of ApplicationFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationData = null,Object? isSubmitting = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? pickedResumeFile = freezed,}) {
  return _then(_self.copyWith(
applicationData: null == applicationData ? _self.applicationData : applicationData // ignore: cast_nullable_to_non_nullable
as ApplicantApplyModel,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,pickedResumeFile: freezed == pickedResumeFile ? _self.pickedResumeFile : pickedResumeFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}
/// Create a copy of ApplicationFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantApplyModelCopyWith<$Res> get applicationData {
  
  return $ApplicantApplyModelCopyWith<$Res>(_self.applicationData, (value) {
    return _then(_self.copyWith(applicationData: value));
  });
}
}


/// @nodoc


class _ApplicationFormState implements ApplicationFormState {
  const _ApplicationFormState({required this.applicationData, this.isSubmitting = false, this.errorMessage, this.successMessage, this.pickedResumeFile});
  

// The application data being built by the user.
@override final  ApplicantApplyModel applicationData;
// True if the form is currently being submitted to the backend.
@override@JsonKey() final  bool isSubmitting;
// Any error message from the last submission attempt.
@override final  String? errorMessage;
// Message for successful submission.
@override final  String? successMessage;
// To track the picked resume file locally before upload.
@override final  File? pickedResumeFile;

/// Create a copy of ApplicationFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationFormStateCopyWith<_ApplicationFormState> get copyWith => __$ApplicationFormStateCopyWithImpl<_ApplicationFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationFormState&&(identical(other.applicationData, applicationData) || other.applicationData == applicationData)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.pickedResumeFile, pickedResumeFile) || other.pickedResumeFile == pickedResumeFile));
}


@override
int get hashCode => Object.hash(runtimeType,applicationData,isSubmitting,errorMessage,successMessage,pickedResumeFile);

@override
String toString() {
  return 'ApplicationFormState(applicationData: $applicationData, isSubmitting: $isSubmitting, errorMessage: $errorMessage, successMessage: $successMessage, pickedResumeFile: $pickedResumeFile)';
}


}

/// @nodoc
abstract mixin class _$ApplicationFormStateCopyWith<$Res> implements $ApplicationFormStateCopyWith<$Res> {
  factory _$ApplicationFormStateCopyWith(_ApplicationFormState value, $Res Function(_ApplicationFormState) _then) = __$ApplicationFormStateCopyWithImpl;
@override @useResult
$Res call({
 ApplicantApplyModel applicationData, bool isSubmitting, String? errorMessage, String? successMessage, File? pickedResumeFile
});


@override $ApplicantApplyModelCopyWith<$Res> get applicationData;

}
/// @nodoc
class __$ApplicationFormStateCopyWithImpl<$Res>
    implements _$ApplicationFormStateCopyWith<$Res> {
  __$ApplicationFormStateCopyWithImpl(this._self, this._then);

  final _ApplicationFormState _self;
  final $Res Function(_ApplicationFormState) _then;

/// Create a copy of ApplicationFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationData = null,Object? isSubmitting = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? pickedResumeFile = freezed,}) {
  return _then(_ApplicationFormState(
applicationData: null == applicationData ? _self.applicationData : applicationData // ignore: cast_nullable_to_non_nullable
as ApplicantApplyModel,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,pickedResumeFile: freezed == pickedResumeFile ? _self.pickedResumeFile : pickedResumeFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

/// Create a copy of ApplicationFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantApplyModelCopyWith<$Res> get applicationData {
  
  return $ApplicantApplyModelCopyWith<$Res>(_self.applicationData, (value) {
    return _then(_self.copyWith(applicationData: value));
  });
}
}

// dart format on
