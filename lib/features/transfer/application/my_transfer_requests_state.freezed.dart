// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_transfer_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyTransferRequestsState {

 List<TransferRequestModel> get requests; bool get isLoading; String? get errorMessage; String? get successMessage;
/// Create a copy of MyTransferRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyTransferRequestsStateCopyWith<MyTransferRequestsState> get copyWith => _$MyTransferRequestsStateCopyWithImpl<MyTransferRequestsState>(this as MyTransferRequestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTransferRequestsState&&const DeepCollectionEquality().equals(other.requests, requests)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(requests),isLoading,errorMessage,successMessage);

@override
String toString() {
  return 'MyTransferRequestsState(requests: $requests, isLoading: $isLoading, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $MyTransferRequestsStateCopyWith<$Res>  {
  factory $MyTransferRequestsStateCopyWith(MyTransferRequestsState value, $Res Function(MyTransferRequestsState) _then) = _$MyTransferRequestsStateCopyWithImpl;
@useResult
$Res call({
 List<TransferRequestModel> requests, bool isLoading, String? errorMessage, String? successMessage
});




}
/// @nodoc
class _$MyTransferRequestsStateCopyWithImpl<$Res>
    implements $MyTransferRequestsStateCopyWith<$Res> {
  _$MyTransferRequestsStateCopyWithImpl(this._self, this._then);

  final MyTransferRequestsState _self;
  final $Res Function(MyTransferRequestsState) _then;

/// Create a copy of MyTransferRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requests = null,Object? isLoading = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<TransferRequestModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _MyTransferRequestsState implements MyTransferRequestsState {
  const _MyTransferRequestsState({final  List<TransferRequestModel> requests = const [], this.isLoading = false, this.errorMessage, this.successMessage}): _requests = requests;
  

 final  List<TransferRequestModel> _requests;
@override@JsonKey() List<TransferRequestModel> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of MyTransferRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyTransferRequestsStateCopyWith<_MyTransferRequestsState> get copyWith => __$MyTransferRequestsStateCopyWithImpl<_MyTransferRequestsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyTransferRequestsState&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests),isLoading,errorMessage,successMessage);

@override
String toString() {
  return 'MyTransferRequestsState(requests: $requests, isLoading: $isLoading, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$MyTransferRequestsStateCopyWith<$Res> implements $MyTransferRequestsStateCopyWith<$Res> {
  factory _$MyTransferRequestsStateCopyWith(_MyTransferRequestsState value, $Res Function(_MyTransferRequestsState) _then) = __$MyTransferRequestsStateCopyWithImpl;
@override @useResult
$Res call({
 List<TransferRequestModel> requests, bool isLoading, String? errorMessage, String? successMessage
});




}
/// @nodoc
class __$MyTransferRequestsStateCopyWithImpl<$Res>
    implements _$MyTransferRequestsStateCopyWith<$Res> {
  __$MyTransferRequestsStateCopyWithImpl(this._self, this._then);

  final _MyTransferRequestsState _self;
  final $Res Function(_MyTransferRequestsState) _then;

/// Create a copy of MyTransferRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requests = null,Object? isLoading = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_MyTransferRequestsState(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<TransferRequestModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
