// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_transfer_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RequestTransferState {

 bool get isSubmitting; String? get successMessage; String? get errorMessage;
/// Create a copy of RequestTransferState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestTransferStateCopyWith<RequestTransferState> get copyWith => _$RequestTransferStateCopyWithImpl<RequestTransferState>(this as RequestTransferState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestTransferState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,successMessage,errorMessage);

@override
String toString() {
  return 'RequestTransferState(isSubmitting: $isSubmitting, successMessage: $successMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $RequestTransferStateCopyWith<$Res>  {
  factory $RequestTransferStateCopyWith(RequestTransferState value, $Res Function(RequestTransferState) _then) = _$RequestTransferStateCopyWithImpl;
@useResult
$Res call({
 bool isSubmitting, String? successMessage, String? errorMessage
});




}
/// @nodoc
class _$RequestTransferStateCopyWithImpl<$Res>
    implements $RequestTransferStateCopyWith<$Res> {
  _$RequestTransferStateCopyWithImpl(this._self, this._then);

  final RequestTransferState _self;
  final $Res Function(RequestTransferState) _then;

/// Create a copy of RequestTransferState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSubmitting = null,Object? successMessage = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _RequestTransferState implements RequestTransferState {
  const _RequestTransferState({this.isSubmitting = false, this.successMessage, this.errorMessage});
  

@override@JsonKey() final  bool isSubmitting;
@override final  String? successMessage;
@override final  String? errorMessage;

/// Create a copy of RequestTransferState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestTransferStateCopyWith<_RequestTransferState> get copyWith => __$RequestTransferStateCopyWithImpl<_RequestTransferState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestTransferState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,successMessage,errorMessage);

@override
String toString() {
  return 'RequestTransferState(isSubmitting: $isSubmitting, successMessage: $successMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$RequestTransferStateCopyWith<$Res> implements $RequestTransferStateCopyWith<$Res> {
  factory _$RequestTransferStateCopyWith(_RequestTransferState value, $Res Function(_RequestTransferState) _then) = __$RequestTransferStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSubmitting, String? successMessage, String? errorMessage
});




}
/// @nodoc
class __$RequestTransferStateCopyWithImpl<$Res>
    implements _$RequestTransferStateCopyWith<$Res> {
  __$RequestTransferStateCopyWithImpl(this._self, this._then);

  final _RequestTransferState _self;
  final $Res Function(_RequestTransferState) _then;

/// Create a copy of RequestTransferState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSubmitting = null,Object? successMessage = freezed,Object? errorMessage = freezed,}) {
  return _then(_RequestTransferState(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
