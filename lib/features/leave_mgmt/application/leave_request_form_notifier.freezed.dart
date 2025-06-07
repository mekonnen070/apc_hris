// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_request_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeaveRequestFormState {

 bool get isLoading; bool get isSubmitting; List<LeaveType> get leaveTypes; List<LeaveBalance> get leaveBalances; String? get errorMessage; String? get successMessage;
/// Create a copy of LeaveRequestFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveRequestFormStateCopyWith<LeaveRequestFormState> get copyWith => _$LeaveRequestFormStateCopyWithImpl<LeaveRequestFormState>(this as LeaveRequestFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveRequestFormState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other.leaveTypes, leaveTypes)&&const DeepCollectionEquality().equals(other.leaveBalances, leaveBalances)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSubmitting,const DeepCollectionEquality().hash(leaveTypes),const DeepCollectionEquality().hash(leaveBalances),errorMessage,successMessage);

@override
String toString() {
  return 'LeaveRequestFormState(isLoading: $isLoading, isSubmitting: $isSubmitting, leaveTypes: $leaveTypes, leaveBalances: $leaveBalances, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $LeaveRequestFormStateCopyWith<$Res>  {
  factory $LeaveRequestFormStateCopyWith(LeaveRequestFormState value, $Res Function(LeaveRequestFormState) _then) = _$LeaveRequestFormStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSubmitting, List<LeaveType> leaveTypes, List<LeaveBalance> leaveBalances, String? errorMessage, String? successMessage
});




}
/// @nodoc
class _$LeaveRequestFormStateCopyWithImpl<$Res>
    implements $LeaveRequestFormStateCopyWith<$Res> {
  _$LeaveRequestFormStateCopyWithImpl(this._self, this._then);

  final LeaveRequestFormState _self;
  final $Res Function(LeaveRequestFormState) _then;

/// Create a copy of LeaveRequestFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSubmitting = null,Object? leaveTypes = null,Object? leaveBalances = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,leaveTypes: null == leaveTypes ? _self.leaveTypes : leaveTypes // ignore: cast_nullable_to_non_nullable
as List<LeaveType>,leaveBalances: null == leaveBalances ? _self.leaveBalances : leaveBalances // ignore: cast_nullable_to_non_nullable
as List<LeaveBalance>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _LeaveRequestFormState implements LeaveRequestFormState {
  const _LeaveRequestFormState({this.isLoading = true, this.isSubmitting = false, final  List<LeaveType> leaveTypes = const [], final  List<LeaveBalance> leaveBalances = const [], this.errorMessage, this.successMessage}): _leaveTypes = leaveTypes,_leaveBalances = leaveBalances;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSubmitting;
 final  List<LeaveType> _leaveTypes;
@override@JsonKey() List<LeaveType> get leaveTypes {
  if (_leaveTypes is EqualUnmodifiableListView) return _leaveTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leaveTypes);
}

 final  List<LeaveBalance> _leaveBalances;
@override@JsonKey() List<LeaveBalance> get leaveBalances {
  if (_leaveBalances is EqualUnmodifiableListView) return _leaveBalances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leaveBalances);
}

@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of LeaveRequestFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveRequestFormStateCopyWith<_LeaveRequestFormState> get copyWith => __$LeaveRequestFormStateCopyWithImpl<_LeaveRequestFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveRequestFormState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other._leaveTypes, _leaveTypes)&&const DeepCollectionEquality().equals(other._leaveBalances, _leaveBalances)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSubmitting,const DeepCollectionEquality().hash(_leaveTypes),const DeepCollectionEquality().hash(_leaveBalances),errorMessage,successMessage);

@override
String toString() {
  return 'LeaveRequestFormState(isLoading: $isLoading, isSubmitting: $isSubmitting, leaveTypes: $leaveTypes, leaveBalances: $leaveBalances, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$LeaveRequestFormStateCopyWith<$Res> implements $LeaveRequestFormStateCopyWith<$Res> {
  factory _$LeaveRequestFormStateCopyWith(_LeaveRequestFormState value, $Res Function(_LeaveRequestFormState) _then) = __$LeaveRequestFormStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSubmitting, List<LeaveType> leaveTypes, List<LeaveBalance> leaveBalances, String? errorMessage, String? successMessage
});




}
/// @nodoc
class __$LeaveRequestFormStateCopyWithImpl<$Res>
    implements _$LeaveRequestFormStateCopyWith<$Res> {
  __$LeaveRequestFormStateCopyWithImpl(this._self, this._then);

  final _LeaveRequestFormState _self;
  final $Res Function(_LeaveRequestFormState) _then;

/// Create a copy of LeaveRequestFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSubmitting = null,Object? leaveTypes = null,Object? leaveBalances = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_LeaveRequestFormState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,leaveTypes: null == leaveTypes ? _self._leaveTypes : leaveTypes // ignore: cast_nullable_to_non_nullable
as List<LeaveType>,leaveBalances: null == leaveBalances ? _self._leaveBalances : leaveBalances // ignore: cast_nullable_to_non_nullable
as List<LeaveBalance>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
