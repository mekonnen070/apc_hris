// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegistrationScreenState {

// The current snapshot of all collected form data
 RegistrationFormData get formData;// UI state for the overall submission process
 bool get isSubmitting;// To display any errors during submission or validation
 String? get errorMessage;
/// Create a copy of RegistrationScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationScreenStateCopyWith<RegistrationScreenState> get copyWith => _$RegistrationScreenStateCopyWithImpl<RegistrationScreenState>(this as RegistrationScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationScreenState&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,formData,isSubmitting,errorMessage);

@override
String toString() {
  return 'RegistrationScreenState(formData: $formData, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $RegistrationScreenStateCopyWith<$Res>  {
  factory $RegistrationScreenStateCopyWith(RegistrationScreenState value, $Res Function(RegistrationScreenState) _then) = _$RegistrationScreenStateCopyWithImpl;
@useResult
$Res call({
 RegistrationFormData formData, bool isSubmitting, String? errorMessage
});


$RegistrationFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$RegistrationScreenStateCopyWithImpl<$Res>
    implements $RegistrationScreenStateCopyWith<$Res> {
  _$RegistrationScreenStateCopyWithImpl(this._self, this._then);

  final RegistrationScreenState _self;
  final $Res Function(RegistrationScreenState) _then;

/// Create a copy of RegistrationScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formData = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as RegistrationFormData,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RegistrationScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationFormDataCopyWith<$Res> get formData {
  
  return $RegistrationFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}


/// @nodoc


class _RegistrationScreenState implements RegistrationScreenState {
  const _RegistrationScreenState({this.formData = const RegistrationFormData(), this.isSubmitting = false, this.errorMessage});
  

// The current snapshot of all collected form data
@override@JsonKey() final  RegistrationFormData formData;
// UI state for the overall submission process
@override@JsonKey() final  bool isSubmitting;
// To display any errors during submission or validation
@override final  String? errorMessage;

/// Create a copy of RegistrationScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationScreenStateCopyWith<_RegistrationScreenState> get copyWith => __$RegistrationScreenStateCopyWithImpl<_RegistrationScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationScreenState&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,formData,isSubmitting,errorMessage);

@override
String toString() {
  return 'RegistrationScreenState(formData: $formData, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$RegistrationScreenStateCopyWith<$Res> implements $RegistrationScreenStateCopyWith<$Res> {
  factory _$RegistrationScreenStateCopyWith(_RegistrationScreenState value, $Res Function(_RegistrationScreenState) _then) = __$RegistrationScreenStateCopyWithImpl;
@override @useResult
$Res call({
 RegistrationFormData formData, bool isSubmitting, String? errorMessage
});


@override $RegistrationFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class __$RegistrationScreenStateCopyWithImpl<$Res>
    implements _$RegistrationScreenStateCopyWith<$Res> {
  __$RegistrationScreenStateCopyWithImpl(this._self, this._then);

  final _RegistrationScreenState _self;
  final $Res Function(_RegistrationScreenState) _then;

/// Create a copy of RegistrationScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formData = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_RegistrationScreenState(
formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as RegistrationFormData,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RegistrationScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationFormDataCopyWith<$Res> get formData {
  
  return $RegistrationFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}

// dart format on
