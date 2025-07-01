// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placement_application_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlacementApplicationState {

 bool get isSubmitting; String? get successMessage; String? get errorMessage;
/// Create a copy of PlacementApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlacementApplicationStateCopyWith<PlacementApplicationState> get copyWith => _$PlacementApplicationStateCopyWithImpl<PlacementApplicationState>(this as PlacementApplicationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlacementApplicationState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,successMessage,errorMessage);

@override
String toString() {
  return 'PlacementApplicationState(isSubmitting: $isSubmitting, successMessage: $successMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PlacementApplicationStateCopyWith<$Res>  {
  factory $PlacementApplicationStateCopyWith(PlacementApplicationState value, $Res Function(PlacementApplicationState) _then) = _$PlacementApplicationStateCopyWithImpl;
@useResult
$Res call({
 bool isSubmitting, String? successMessage, String? errorMessage
});




}
/// @nodoc
class _$PlacementApplicationStateCopyWithImpl<$Res>
    implements $PlacementApplicationStateCopyWith<$Res> {
  _$PlacementApplicationStateCopyWithImpl(this._self, this._then);

  final PlacementApplicationState _self;
  final $Res Function(PlacementApplicationState) _then;

/// Create a copy of PlacementApplicationState
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


class _PlacementApplicationState implements PlacementApplicationState {
  const _PlacementApplicationState({this.isSubmitting = false, this.successMessage, this.errorMessage});
  

@override@JsonKey() final  bool isSubmitting;
@override final  String? successMessage;
@override final  String? errorMessage;

/// Create a copy of PlacementApplicationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlacementApplicationStateCopyWith<_PlacementApplicationState> get copyWith => __$PlacementApplicationStateCopyWithImpl<_PlacementApplicationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlacementApplicationState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,successMessage,errorMessage);

@override
String toString() {
  return 'PlacementApplicationState(isSubmitting: $isSubmitting, successMessage: $successMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PlacementApplicationStateCopyWith<$Res> implements $PlacementApplicationStateCopyWith<$Res> {
  factory _$PlacementApplicationStateCopyWith(_PlacementApplicationState value, $Res Function(_PlacementApplicationState) _then) = __$PlacementApplicationStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSubmitting, String? successMessage, String? errorMessage
});




}
/// @nodoc
class __$PlacementApplicationStateCopyWithImpl<$Res>
    implements _$PlacementApplicationStateCopyWith<$Res> {
  __$PlacementApplicationStateCopyWithImpl(this._self, this._then);

  final _PlacementApplicationState _self;
  final $Res Function(_PlacementApplicationState) _then;

/// Create a copy of PlacementApplicationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSubmitting = null,Object? successMessage = freezed,Object? errorMessage = freezed,}) {
  return _then(_PlacementApplicationState(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
