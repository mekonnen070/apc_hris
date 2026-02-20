// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_creation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeCreationState {

// Holds the complete employee data being built across steps.
// Initialize with a new or empty EmployeeInfoModel.
 EmployeeInfoModel get employeeData;// True if the entire form is currently being submitted to the backend.
 bool get isSubmitting;// Any error message from the last submission attempt.
 String? get errorMessage;
/// Create a copy of EmployeeCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeCreationStateCopyWith<EmployeeCreationState> get copyWith => _$EmployeeCreationStateCopyWithImpl<EmployeeCreationState>(this as EmployeeCreationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeCreationState&&(identical(other.employeeData, employeeData) || other.employeeData == employeeData)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,employeeData,isSubmitting,errorMessage);

@override
String toString() {
  return 'EmployeeCreationState(employeeData: $employeeData, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EmployeeCreationStateCopyWith<$Res>  {
  factory $EmployeeCreationStateCopyWith(EmployeeCreationState value, $Res Function(EmployeeCreationState) _then) = _$EmployeeCreationStateCopyWithImpl;
@useResult
$Res call({
 EmployeeInfoModel employeeData, bool isSubmitting, String? errorMessage
});


$EmployeeInfoModelCopyWith<$Res> get employeeData;

}
/// @nodoc
class _$EmployeeCreationStateCopyWithImpl<$Res>
    implements $EmployeeCreationStateCopyWith<$Res> {
  _$EmployeeCreationStateCopyWithImpl(this._self, this._then);

  final EmployeeCreationState _self;
  final $Res Function(EmployeeCreationState) _then;

/// Create a copy of EmployeeCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? employeeData = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
employeeData: null == employeeData ? _self.employeeData : employeeData // ignore: cast_nullable_to_non_nullable
as EmployeeInfoModel,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EmployeeCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeInfoModelCopyWith<$Res> get employeeData {
  
  return $EmployeeInfoModelCopyWith<$Res>(_self.employeeData, (value) {
    return _then(_self.copyWith(employeeData: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmployeeCreationState].
extension EmployeeCreationStatePatterns on EmployeeCreationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeCreationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeCreationState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeCreationState value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeCreationState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeCreationState value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeCreationState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EmployeeInfoModel employeeData,  bool isSubmitting,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeCreationState() when $default != null:
return $default(_that.employeeData,_that.isSubmitting,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EmployeeInfoModel employeeData,  bool isSubmitting,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EmployeeCreationState():
return $default(_that.employeeData,_that.isSubmitting,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EmployeeInfoModel employeeData,  bool isSubmitting,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeCreationState() when $default != null:
return $default(_that.employeeData,_that.isSubmitting,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EmployeeCreationState implements EmployeeCreationState {
  const _EmployeeCreationState({required this.employeeData, this.isSubmitting = false, this.errorMessage});
  

// Holds the complete employee data being built across steps.
// Initialize with a new or empty EmployeeInfoModel.
@override final  EmployeeInfoModel employeeData;
// True if the entire form is currently being submitted to the backend.
@override@JsonKey() final  bool isSubmitting;
// Any error message from the last submission attempt.
@override final  String? errorMessage;

/// Create a copy of EmployeeCreationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeCreationStateCopyWith<_EmployeeCreationState> get copyWith => __$EmployeeCreationStateCopyWithImpl<_EmployeeCreationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeCreationState&&(identical(other.employeeData, employeeData) || other.employeeData == employeeData)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,employeeData,isSubmitting,errorMessage);

@override
String toString() {
  return 'EmployeeCreationState(employeeData: $employeeData, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EmployeeCreationStateCopyWith<$Res> implements $EmployeeCreationStateCopyWith<$Res> {
  factory _$EmployeeCreationStateCopyWith(_EmployeeCreationState value, $Res Function(_EmployeeCreationState) _then) = __$EmployeeCreationStateCopyWithImpl;
@override @useResult
$Res call({
 EmployeeInfoModel employeeData, bool isSubmitting, String? errorMessage
});


@override $EmployeeInfoModelCopyWith<$Res> get employeeData;

}
/// @nodoc
class __$EmployeeCreationStateCopyWithImpl<$Res>
    implements _$EmployeeCreationStateCopyWith<$Res> {
  __$EmployeeCreationStateCopyWithImpl(this._self, this._then);

  final _EmployeeCreationState _self;
  final $Res Function(_EmployeeCreationState) _then;

/// Create a copy of EmployeeCreationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? employeeData = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_EmployeeCreationState(
employeeData: null == employeeData ? _self.employeeData : employeeData // ignore: cast_nullable_to_non_nullable
as EmployeeInfoModel,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EmployeeCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeInfoModelCopyWith<$Res> get employeeData {
  
  return $EmployeeInfoModelCopyWith<$Res>(_self.employeeData, (value) {
    return _then(_self.copyWith(employeeData: value));
  });
}
}

// dart format on
