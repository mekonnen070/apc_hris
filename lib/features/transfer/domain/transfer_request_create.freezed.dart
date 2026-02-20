// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_request_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferRequestCreate {

 String get employeeId; String get currentLocation; String get currentLocationId; String get currentDepartment; String get currentPosition; TransferLevels get transferLevelFrom; TransferLevels get transferLevelTo; String get toLocation; String get toLocationId; String get toDepartment; String get toDepartmentId; String get toPosition; String get toPositionId; DateTime get requestDate; TransferPeriod get transferPeriod; String get transferYear; TransferReasons get transferReason;
/// Create a copy of TransferRequestCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferRequestCreateCopyWith<TransferRequestCreate> get copyWith => _$TransferRequestCreateCopyWithImpl<TransferRequestCreate>(this as TransferRequestCreate, _$identity);

  /// Serializes this TransferRequestCreate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferRequestCreate&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.currentLocationId, currentLocationId) || other.currentLocationId == currentLocationId)&&(identical(other.currentDepartment, currentDepartment) || other.currentDepartment == currentDepartment)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.transferLevelFrom, transferLevelFrom) || other.transferLevelFrom == transferLevelFrom)&&(identical(other.transferLevelTo, transferLevelTo) || other.transferLevelTo == transferLevelTo)&&(identical(other.toLocation, toLocation) || other.toLocation == toLocation)&&(identical(other.toLocationId, toLocationId) || other.toLocationId == toLocationId)&&(identical(other.toDepartment, toDepartment) || other.toDepartment == toDepartment)&&(identical(other.toDepartmentId, toDepartmentId) || other.toDepartmentId == toDepartmentId)&&(identical(other.toPosition, toPosition) || other.toPosition == toPosition)&&(identical(other.toPositionId, toPositionId) || other.toPositionId == toPositionId)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.transferPeriod, transferPeriod) || other.transferPeriod == transferPeriod)&&(identical(other.transferYear, transferYear) || other.transferYear == transferYear)&&(identical(other.transferReason, transferReason) || other.transferReason == transferReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,employeeId,currentLocation,currentLocationId,currentDepartment,currentPosition,transferLevelFrom,transferLevelTo,toLocation,toLocationId,toDepartment,toDepartmentId,toPosition,toPositionId,requestDate,transferPeriod,transferYear,transferReason);

@override
String toString() {
  return 'TransferRequestCreate(employeeId: $employeeId, currentLocation: $currentLocation, currentLocationId: $currentLocationId, currentDepartment: $currentDepartment, currentPosition: $currentPosition, transferLevelFrom: $transferLevelFrom, transferLevelTo: $transferLevelTo, toLocation: $toLocation, toLocationId: $toLocationId, toDepartment: $toDepartment, toDepartmentId: $toDepartmentId, toPosition: $toPosition, toPositionId: $toPositionId, requestDate: $requestDate, transferPeriod: $transferPeriod, transferYear: $transferYear, transferReason: $transferReason)';
}


}

/// @nodoc
abstract mixin class $TransferRequestCreateCopyWith<$Res>  {
  factory $TransferRequestCreateCopyWith(TransferRequestCreate value, $Res Function(TransferRequestCreate) _then) = _$TransferRequestCreateCopyWithImpl;
@useResult
$Res call({
 String employeeId, String currentLocation, String currentLocationId, String currentDepartment, String currentPosition, TransferLevels transferLevelFrom, TransferLevels transferLevelTo, String toLocation, String toLocationId, String toDepartment, String toDepartmentId, String toPosition, String toPositionId, DateTime requestDate, TransferPeriod transferPeriod, String transferYear, TransferReasons transferReason
});




}
/// @nodoc
class _$TransferRequestCreateCopyWithImpl<$Res>
    implements $TransferRequestCreateCopyWith<$Res> {
  _$TransferRequestCreateCopyWithImpl(this._self, this._then);

  final TransferRequestCreate _self;
  final $Res Function(TransferRequestCreate) _then;

/// Create a copy of TransferRequestCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? employeeId = null,Object? currentLocation = null,Object? currentLocationId = null,Object? currentDepartment = null,Object? currentPosition = null,Object? transferLevelFrom = null,Object? transferLevelTo = null,Object? toLocation = null,Object? toLocationId = null,Object? toDepartment = null,Object? toDepartmentId = null,Object? toPosition = null,Object? toPositionId = null,Object? requestDate = null,Object? transferPeriod = null,Object? transferYear = null,Object? transferReason = null,}) {
  return _then(_self.copyWith(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,currentLocation: null == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as String,currentLocationId: null == currentLocationId ? _self.currentLocationId : currentLocationId // ignore: cast_nullable_to_non_nullable
as String,currentDepartment: null == currentDepartment ? _self.currentDepartment : currentDepartment // ignore: cast_nullable_to_non_nullable
as String,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as String,transferLevelFrom: null == transferLevelFrom ? _self.transferLevelFrom : transferLevelFrom // ignore: cast_nullable_to_non_nullable
as TransferLevels,transferLevelTo: null == transferLevelTo ? _self.transferLevelTo : transferLevelTo // ignore: cast_nullable_to_non_nullable
as TransferLevels,toLocation: null == toLocation ? _self.toLocation : toLocation // ignore: cast_nullable_to_non_nullable
as String,toLocationId: null == toLocationId ? _self.toLocationId : toLocationId // ignore: cast_nullable_to_non_nullable
as String,toDepartment: null == toDepartment ? _self.toDepartment : toDepartment // ignore: cast_nullable_to_non_nullable
as String,toDepartmentId: null == toDepartmentId ? _self.toDepartmentId : toDepartmentId // ignore: cast_nullable_to_non_nullable
as String,toPosition: null == toPosition ? _self.toPosition : toPosition // ignore: cast_nullable_to_non_nullable
as String,toPositionId: null == toPositionId ? _self.toPositionId : toPositionId // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,transferPeriod: null == transferPeriod ? _self.transferPeriod : transferPeriod // ignore: cast_nullable_to_non_nullable
as TransferPeriod,transferYear: null == transferYear ? _self.transferYear : transferYear // ignore: cast_nullable_to_non_nullable
as String,transferReason: null == transferReason ? _self.transferReason : transferReason // ignore: cast_nullable_to_non_nullable
as TransferReasons,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferRequestCreate].
extension TransferRequestCreatePatterns on TransferRequestCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferRequestCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferRequestCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferRequestCreate value)  $default,){
final _that = this;
switch (_that) {
case _TransferRequestCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferRequestCreate value)?  $default,){
final _that = this;
switch (_that) {
case _TransferRequestCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String employeeId,  String currentLocation,  String currentLocationId,  String currentDepartment,  String currentPosition,  TransferLevels transferLevelFrom,  TransferLevels transferLevelTo,  String toLocation,  String toLocationId,  String toDepartment,  String toDepartmentId,  String toPosition,  String toPositionId,  DateTime requestDate,  TransferPeriod transferPeriod,  String transferYear,  TransferReasons transferReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferRequestCreate() when $default != null:
return $default(_that.employeeId,_that.currentLocation,_that.currentLocationId,_that.currentDepartment,_that.currentPosition,_that.transferLevelFrom,_that.transferLevelTo,_that.toLocation,_that.toLocationId,_that.toDepartment,_that.toDepartmentId,_that.toPosition,_that.toPositionId,_that.requestDate,_that.transferPeriod,_that.transferYear,_that.transferReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String employeeId,  String currentLocation,  String currentLocationId,  String currentDepartment,  String currentPosition,  TransferLevels transferLevelFrom,  TransferLevels transferLevelTo,  String toLocation,  String toLocationId,  String toDepartment,  String toDepartmentId,  String toPosition,  String toPositionId,  DateTime requestDate,  TransferPeriod transferPeriod,  String transferYear,  TransferReasons transferReason)  $default,) {final _that = this;
switch (_that) {
case _TransferRequestCreate():
return $default(_that.employeeId,_that.currentLocation,_that.currentLocationId,_that.currentDepartment,_that.currentPosition,_that.transferLevelFrom,_that.transferLevelTo,_that.toLocation,_that.toLocationId,_that.toDepartment,_that.toDepartmentId,_that.toPosition,_that.toPositionId,_that.requestDate,_that.transferPeriod,_that.transferYear,_that.transferReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String employeeId,  String currentLocation,  String currentLocationId,  String currentDepartment,  String currentPosition,  TransferLevels transferLevelFrom,  TransferLevels transferLevelTo,  String toLocation,  String toLocationId,  String toDepartment,  String toDepartmentId,  String toPosition,  String toPositionId,  DateTime requestDate,  TransferPeriod transferPeriod,  String transferYear,  TransferReasons transferReason)?  $default,) {final _that = this;
switch (_that) {
case _TransferRequestCreate() when $default != null:
return $default(_that.employeeId,_that.currentLocation,_that.currentLocationId,_that.currentDepartment,_that.currentPosition,_that.transferLevelFrom,_that.transferLevelTo,_that.toLocation,_that.toLocationId,_that.toDepartment,_that.toDepartmentId,_that.toPosition,_that.toPositionId,_that.requestDate,_that.transferPeriod,_that.transferYear,_that.transferReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferRequestCreate implements TransferRequestCreate {
  const _TransferRequestCreate({required this.employeeId, required this.currentLocation, required this.currentLocationId, required this.currentDepartment, required this.currentPosition, required this.transferLevelFrom, required this.transferLevelTo, required this.toLocation, required this.toLocationId, required this.toDepartment, required this.toDepartmentId, required this.toPosition, required this.toPositionId, required this.requestDate, required this.transferPeriod, required this.transferYear, required this.transferReason});
  factory _TransferRequestCreate.fromJson(Map<String, dynamic> json) => _$TransferRequestCreateFromJson(json);

@override final  String employeeId;
@override final  String currentLocation;
@override final  String currentLocationId;
@override final  String currentDepartment;
@override final  String currentPosition;
@override final  TransferLevels transferLevelFrom;
@override final  TransferLevels transferLevelTo;
@override final  String toLocation;
@override final  String toLocationId;
@override final  String toDepartment;
@override final  String toDepartmentId;
@override final  String toPosition;
@override final  String toPositionId;
@override final  DateTime requestDate;
@override final  TransferPeriod transferPeriod;
@override final  String transferYear;
@override final  TransferReasons transferReason;

/// Create a copy of TransferRequestCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferRequestCreateCopyWith<_TransferRequestCreate> get copyWith => __$TransferRequestCreateCopyWithImpl<_TransferRequestCreate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferRequestCreateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferRequestCreate&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.currentLocationId, currentLocationId) || other.currentLocationId == currentLocationId)&&(identical(other.currentDepartment, currentDepartment) || other.currentDepartment == currentDepartment)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.transferLevelFrom, transferLevelFrom) || other.transferLevelFrom == transferLevelFrom)&&(identical(other.transferLevelTo, transferLevelTo) || other.transferLevelTo == transferLevelTo)&&(identical(other.toLocation, toLocation) || other.toLocation == toLocation)&&(identical(other.toLocationId, toLocationId) || other.toLocationId == toLocationId)&&(identical(other.toDepartment, toDepartment) || other.toDepartment == toDepartment)&&(identical(other.toDepartmentId, toDepartmentId) || other.toDepartmentId == toDepartmentId)&&(identical(other.toPosition, toPosition) || other.toPosition == toPosition)&&(identical(other.toPositionId, toPositionId) || other.toPositionId == toPositionId)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.transferPeriod, transferPeriod) || other.transferPeriod == transferPeriod)&&(identical(other.transferYear, transferYear) || other.transferYear == transferYear)&&(identical(other.transferReason, transferReason) || other.transferReason == transferReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,employeeId,currentLocation,currentLocationId,currentDepartment,currentPosition,transferLevelFrom,transferLevelTo,toLocation,toLocationId,toDepartment,toDepartmentId,toPosition,toPositionId,requestDate,transferPeriod,transferYear,transferReason);

@override
String toString() {
  return 'TransferRequestCreate(employeeId: $employeeId, currentLocation: $currentLocation, currentLocationId: $currentLocationId, currentDepartment: $currentDepartment, currentPosition: $currentPosition, transferLevelFrom: $transferLevelFrom, transferLevelTo: $transferLevelTo, toLocation: $toLocation, toLocationId: $toLocationId, toDepartment: $toDepartment, toDepartmentId: $toDepartmentId, toPosition: $toPosition, toPositionId: $toPositionId, requestDate: $requestDate, transferPeriod: $transferPeriod, transferYear: $transferYear, transferReason: $transferReason)';
}


}

/// @nodoc
abstract mixin class _$TransferRequestCreateCopyWith<$Res> implements $TransferRequestCreateCopyWith<$Res> {
  factory _$TransferRequestCreateCopyWith(_TransferRequestCreate value, $Res Function(_TransferRequestCreate) _then) = __$TransferRequestCreateCopyWithImpl;
@override @useResult
$Res call({
 String employeeId, String currentLocation, String currentLocationId, String currentDepartment, String currentPosition, TransferLevels transferLevelFrom, TransferLevels transferLevelTo, String toLocation, String toLocationId, String toDepartment, String toDepartmentId, String toPosition, String toPositionId, DateTime requestDate, TransferPeriod transferPeriod, String transferYear, TransferReasons transferReason
});




}
/// @nodoc
class __$TransferRequestCreateCopyWithImpl<$Res>
    implements _$TransferRequestCreateCopyWith<$Res> {
  __$TransferRequestCreateCopyWithImpl(this._self, this._then);

  final _TransferRequestCreate _self;
  final $Res Function(_TransferRequestCreate) _then;

/// Create a copy of TransferRequestCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? employeeId = null,Object? currentLocation = null,Object? currentLocationId = null,Object? currentDepartment = null,Object? currentPosition = null,Object? transferLevelFrom = null,Object? transferLevelTo = null,Object? toLocation = null,Object? toLocationId = null,Object? toDepartment = null,Object? toDepartmentId = null,Object? toPosition = null,Object? toPositionId = null,Object? requestDate = null,Object? transferPeriod = null,Object? transferYear = null,Object? transferReason = null,}) {
  return _then(_TransferRequestCreate(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,currentLocation: null == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as String,currentLocationId: null == currentLocationId ? _self.currentLocationId : currentLocationId // ignore: cast_nullable_to_non_nullable
as String,currentDepartment: null == currentDepartment ? _self.currentDepartment : currentDepartment // ignore: cast_nullable_to_non_nullable
as String,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as String,transferLevelFrom: null == transferLevelFrom ? _self.transferLevelFrom : transferLevelFrom // ignore: cast_nullable_to_non_nullable
as TransferLevels,transferLevelTo: null == transferLevelTo ? _self.transferLevelTo : transferLevelTo // ignore: cast_nullable_to_non_nullable
as TransferLevels,toLocation: null == toLocation ? _self.toLocation : toLocation // ignore: cast_nullable_to_non_nullable
as String,toLocationId: null == toLocationId ? _self.toLocationId : toLocationId // ignore: cast_nullable_to_non_nullable
as String,toDepartment: null == toDepartment ? _self.toDepartment : toDepartment // ignore: cast_nullable_to_non_nullable
as String,toDepartmentId: null == toDepartmentId ? _self.toDepartmentId : toDepartmentId // ignore: cast_nullable_to_non_nullable
as String,toPosition: null == toPosition ? _self.toPosition : toPosition // ignore: cast_nullable_to_non_nullable
as String,toPositionId: null == toPositionId ? _self.toPositionId : toPositionId // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,transferPeriod: null == transferPeriod ? _self.transferPeriod : transferPeriod // ignore: cast_nullable_to_non_nullable
as TransferPeriod,transferYear: null == transferYear ? _self.transferYear : transferYear // ignore: cast_nullable_to_non_nullable
as String,transferReason: null == transferReason ? _self.transferReason : transferReason // ignore: cast_nullable_to_non_nullable
as TransferReasons,
  ));
}


}

// dart format on
