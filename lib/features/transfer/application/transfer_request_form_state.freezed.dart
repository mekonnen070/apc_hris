// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_request_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransferRequestFormState {

// The transfer request data being built by the user.
 TransferRequest get transferRequestData;// True if the form is currently being submitted to the backend.
 bool get isSubmitting;// Any error message from the last submission attempt.
 String? get errorMessage;// Message for successful submission.
 String? get successMessage;
/// Create a copy of TransferRequestFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferRequestFormStateCopyWith<TransferRequestFormState> get copyWith => _$TransferRequestFormStateCopyWithImpl<TransferRequestFormState>(this as TransferRequestFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferRequestFormState&&(identical(other.transferRequestData, transferRequestData) || other.transferRequestData == transferRequestData)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,transferRequestData,isSubmitting,errorMessage,successMessage);

@override
String toString() {
  return 'TransferRequestFormState(transferRequestData: $transferRequestData, isSubmitting: $isSubmitting, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $TransferRequestFormStateCopyWith<$Res>  {
  factory $TransferRequestFormStateCopyWith(TransferRequestFormState value, $Res Function(TransferRequestFormState) _then) = _$TransferRequestFormStateCopyWithImpl;
@useResult
$Res call({
 TransferRequest transferRequestData, bool isSubmitting, String? errorMessage, String? successMessage
});


$TransferRequestCopyWith<$Res> get transferRequestData;

}
/// @nodoc
class _$TransferRequestFormStateCopyWithImpl<$Res>
    implements $TransferRequestFormStateCopyWith<$Res> {
  _$TransferRequestFormStateCopyWithImpl(this._self, this._then);

  final TransferRequestFormState _self;
  final $Res Function(TransferRequestFormState) _then;

/// Create a copy of TransferRequestFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transferRequestData = null,Object? isSubmitting = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
transferRequestData: null == transferRequestData ? _self.transferRequestData : transferRequestData // ignore: cast_nullable_to_non_nullable
as TransferRequest,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TransferRequestFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransferRequestCopyWith<$Res> get transferRequestData {
  
  return $TransferRequestCopyWith<$Res>(_self.transferRequestData, (value) {
    return _then(_self.copyWith(transferRequestData: value));
  });
}
}


/// @nodoc


class _TransferRequestFormState implements TransferRequestFormState {
  const _TransferRequestFormState({required this.transferRequestData, this.isSubmitting = false, this.errorMessage, this.successMessage});
  

// The transfer request data being built by the user.
@override final  TransferRequest transferRequestData;
// True if the form is currently being submitted to the backend.
@override@JsonKey() final  bool isSubmitting;
// Any error message from the last submission attempt.
@override final  String? errorMessage;
// Message for successful submission.
@override final  String? successMessage;

/// Create a copy of TransferRequestFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferRequestFormStateCopyWith<_TransferRequestFormState> get copyWith => __$TransferRequestFormStateCopyWithImpl<_TransferRequestFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferRequestFormState&&(identical(other.transferRequestData, transferRequestData) || other.transferRequestData == transferRequestData)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,transferRequestData,isSubmitting,errorMessage,successMessage);

@override
String toString() {
  return 'TransferRequestFormState(transferRequestData: $transferRequestData, isSubmitting: $isSubmitting, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$TransferRequestFormStateCopyWith<$Res> implements $TransferRequestFormStateCopyWith<$Res> {
  factory _$TransferRequestFormStateCopyWith(_TransferRequestFormState value, $Res Function(_TransferRequestFormState) _then) = __$TransferRequestFormStateCopyWithImpl;
@override @useResult
$Res call({
 TransferRequest transferRequestData, bool isSubmitting, String? errorMessage, String? successMessage
});


@override $TransferRequestCopyWith<$Res> get transferRequestData;

}
/// @nodoc
class __$TransferRequestFormStateCopyWithImpl<$Res>
    implements _$TransferRequestFormStateCopyWith<$Res> {
  __$TransferRequestFormStateCopyWithImpl(this._self, this._then);

  final _TransferRequestFormState _self;
  final $Res Function(_TransferRequestFormState) _then;

/// Create a copy of TransferRequestFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transferRequestData = null,Object? isSubmitting = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_TransferRequestFormState(
transferRequestData: null == transferRequestData ? _self.transferRequestData : transferRequestData // ignore: cast_nullable_to_non_nullable
as TransferRequest,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TransferRequestFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransferRequestCopyWith<$Res> get transferRequestData {
  
  return $TransferRequestCopyWith<$Res>(_self.transferRequestData, (value) {
    return _then(_self.copyWith(transferRequestData: value));
  });
}
}

// dart format on
