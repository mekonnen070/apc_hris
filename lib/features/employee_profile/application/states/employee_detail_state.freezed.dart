// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeDetailState {

// The core data of the employee being viewed.
 EmployeeInfoModel get employeeData;// True if actively fetching fresh data for the current employee.
 bool get isLoading;// True if a delete operation is in progress.
 bool get isDeleting;// General error message, e.g., from a failed refresh.
 String? get errorMessage;// Message to show upon successful deletion.
 String? get deleteSuccessMessage;// Message to show if deletion fails.
 String? get deleteErrorMessage;
/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeDetailStateCopyWith<EmployeeDetailState> get copyWith => _$EmployeeDetailStateCopyWithImpl<EmployeeDetailState>(this as EmployeeDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDetailState&&(identical(other.employeeData, employeeData) || other.employeeData == employeeData)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.deleteSuccessMessage, deleteSuccessMessage) || other.deleteSuccessMessage == deleteSuccessMessage)&&(identical(other.deleteErrorMessage, deleteErrorMessage) || other.deleteErrorMessage == deleteErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,employeeData,isLoading,isDeleting,errorMessage,deleteSuccessMessage,deleteErrorMessage);

@override
String toString() {
  return 'EmployeeDetailState(employeeData: $employeeData, isLoading: $isLoading, isDeleting: $isDeleting, errorMessage: $errorMessage, deleteSuccessMessage: $deleteSuccessMessage, deleteErrorMessage: $deleteErrorMessage)';
}


}

/// @nodoc
abstract mixin class $EmployeeDetailStateCopyWith<$Res>  {
  factory $EmployeeDetailStateCopyWith(EmployeeDetailState value, $Res Function(EmployeeDetailState) _then) = _$EmployeeDetailStateCopyWithImpl;
@useResult
$Res call({
 EmployeeInfoModel employeeData, bool isLoading, bool isDeleting, String? errorMessage, String? deleteSuccessMessage, String? deleteErrorMessage
});


$EmployeeInfoModelCopyWith<$Res> get employeeData;

}
/// @nodoc
class _$EmployeeDetailStateCopyWithImpl<$Res>
    implements $EmployeeDetailStateCopyWith<$Res> {
  _$EmployeeDetailStateCopyWithImpl(this._self, this._then);

  final EmployeeDetailState _self;
  final $Res Function(EmployeeDetailState) _then;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? employeeData = null,Object? isLoading = null,Object? isDeleting = null,Object? errorMessage = freezed,Object? deleteSuccessMessage = freezed,Object? deleteErrorMessage = freezed,}) {
  return _then(_self.copyWith(
employeeData: null == employeeData ? _self.employeeData : employeeData // ignore: cast_nullable_to_non_nullable
as EmployeeInfoModel,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,deleteSuccessMessage: freezed == deleteSuccessMessage ? _self.deleteSuccessMessage : deleteSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,deleteErrorMessage: freezed == deleteErrorMessage ? _self.deleteErrorMessage : deleteErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeInfoModelCopyWith<$Res> get employeeData {
  
  return $EmployeeInfoModelCopyWith<$Res>(_self.employeeData, (value) {
    return _then(_self.copyWith(employeeData: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmployeeDetailState].
extension EmployeeDetailStatePatterns on EmployeeDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeDetailState value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EmployeeInfoModel employeeData,  bool isLoading,  bool isDeleting,  String? errorMessage,  String? deleteSuccessMessage,  String? deleteErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeDetailState() when $default != null:
return $default(_that.employeeData,_that.isLoading,_that.isDeleting,_that.errorMessage,_that.deleteSuccessMessage,_that.deleteErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EmployeeInfoModel employeeData,  bool isLoading,  bool isDeleting,  String? errorMessage,  String? deleteSuccessMessage,  String? deleteErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _EmployeeDetailState():
return $default(_that.employeeData,_that.isLoading,_that.isDeleting,_that.errorMessage,_that.deleteSuccessMessage,_that.deleteErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EmployeeInfoModel employeeData,  bool isLoading,  bool isDeleting,  String? errorMessage,  String? deleteSuccessMessage,  String? deleteErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeDetailState() when $default != null:
return $default(_that.employeeData,_that.isLoading,_that.isDeleting,_that.errorMessage,_that.deleteSuccessMessage,_that.deleteErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EmployeeDetailState implements EmployeeDetailState {
  const _EmployeeDetailState({required this.employeeData, this.isLoading = false, this.isDeleting = false, this.errorMessage, this.deleteSuccessMessage, this.deleteErrorMessage});
  

// The core data of the employee being viewed.
@override final  EmployeeInfoModel employeeData;
// True if actively fetching fresh data for the current employee.
@override@JsonKey() final  bool isLoading;
// True if a delete operation is in progress.
@override@JsonKey() final  bool isDeleting;
// General error message, e.g., from a failed refresh.
@override final  String? errorMessage;
// Message to show upon successful deletion.
@override final  String? deleteSuccessMessage;
// Message to show if deletion fails.
@override final  String? deleteErrorMessage;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeDetailStateCopyWith<_EmployeeDetailState> get copyWith => __$EmployeeDetailStateCopyWithImpl<_EmployeeDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeDetailState&&(identical(other.employeeData, employeeData) || other.employeeData == employeeData)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.deleteSuccessMessage, deleteSuccessMessage) || other.deleteSuccessMessage == deleteSuccessMessage)&&(identical(other.deleteErrorMessage, deleteErrorMessage) || other.deleteErrorMessage == deleteErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,employeeData,isLoading,isDeleting,errorMessage,deleteSuccessMessage,deleteErrorMessage);

@override
String toString() {
  return 'EmployeeDetailState(employeeData: $employeeData, isLoading: $isLoading, isDeleting: $isDeleting, errorMessage: $errorMessage, deleteSuccessMessage: $deleteSuccessMessage, deleteErrorMessage: $deleteErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$EmployeeDetailStateCopyWith<$Res> implements $EmployeeDetailStateCopyWith<$Res> {
  factory _$EmployeeDetailStateCopyWith(_EmployeeDetailState value, $Res Function(_EmployeeDetailState) _then) = __$EmployeeDetailStateCopyWithImpl;
@override @useResult
$Res call({
 EmployeeInfoModel employeeData, bool isLoading, bool isDeleting, String? errorMessage, String? deleteSuccessMessage, String? deleteErrorMessage
});


@override $EmployeeInfoModelCopyWith<$Res> get employeeData;

}
/// @nodoc
class __$EmployeeDetailStateCopyWithImpl<$Res>
    implements _$EmployeeDetailStateCopyWith<$Res> {
  __$EmployeeDetailStateCopyWithImpl(this._self, this._then);

  final _EmployeeDetailState _self;
  final $Res Function(_EmployeeDetailState) _then;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? employeeData = null,Object? isLoading = null,Object? isDeleting = null,Object? errorMessage = freezed,Object? deleteSuccessMessage = freezed,Object? deleteErrorMessage = freezed,}) {
  return _then(_EmployeeDetailState(
employeeData: null == employeeData ? _self.employeeData : employeeData // ignore: cast_nullable_to_non_nullable
as EmployeeInfoModel,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,deleteSuccessMessage: freezed == deleteSuccessMessage ? _self.deleteSuccessMessage : deleteSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,deleteErrorMessage: freezed == deleteErrorMessage ? _self.deleteErrorMessage : deleteErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EmployeeDetailState
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
