// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferRequest {

 int get transferRequestId;// --- Nullability corrected based on C# model ---
 String? get employeeId;// --- Current Location/Position (Required in C#) ---
 String get currentLocation; String? get currentLocationId; String get currentDepartment; String get currentPosition;// --- Levels (Enums are value types, non-nullable by default in C#) ---
 TransferLevels get transferLevelFrom; TransferLevels get transferLevelTo;// --- Destination Location/Position (Nullable in C#) ---
 String? get toLocation; String? get toLocationId; String? get toDepartment; String? get toDepartmentId; String? get toPosition; String? get toPositionId;// --- Date and Reason ---
 DateTime get requestDate; TransferPeriod get transferPeriod; String? get transferYear; TransferReasons? get transferReason;// Corrected to be nullable
// --- Approval Info (Nullable in C#) ---
 TransferStatus get transferStatus; String? get approvedBy; DateTime? get approvalDate;
/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferRequestCopyWith<TransferRequest> get copyWith => _$TransferRequestCopyWithImpl<TransferRequest>(this as TransferRequest, _$identity);

  /// Serializes this TransferRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferRequest&&(identical(other.transferRequestId, transferRequestId) || other.transferRequestId == transferRequestId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.currentLocationId, currentLocationId) || other.currentLocationId == currentLocationId)&&(identical(other.currentDepartment, currentDepartment) || other.currentDepartment == currentDepartment)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.transferLevelFrom, transferLevelFrom) || other.transferLevelFrom == transferLevelFrom)&&(identical(other.transferLevelTo, transferLevelTo) || other.transferLevelTo == transferLevelTo)&&(identical(other.toLocation, toLocation) || other.toLocation == toLocation)&&(identical(other.toLocationId, toLocationId) || other.toLocationId == toLocationId)&&(identical(other.toDepartment, toDepartment) || other.toDepartment == toDepartment)&&(identical(other.toDepartmentId, toDepartmentId) || other.toDepartmentId == toDepartmentId)&&(identical(other.toPosition, toPosition) || other.toPosition == toPosition)&&(identical(other.toPositionId, toPositionId) || other.toPositionId == toPositionId)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.transferPeriod, transferPeriod) || other.transferPeriod == transferPeriod)&&(identical(other.transferYear, transferYear) || other.transferYear == transferYear)&&(identical(other.transferReason, transferReason) || other.transferReason == transferReason)&&(identical(other.transferStatus, transferStatus) || other.transferStatus == transferStatus)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvalDate, approvalDate) || other.approvalDate == approvalDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,transferRequestId,employeeId,currentLocation,currentLocationId,currentDepartment,currentPosition,transferLevelFrom,transferLevelTo,toLocation,toLocationId,toDepartment,toDepartmentId,toPosition,toPositionId,requestDate,transferPeriod,transferYear,transferReason,transferStatus,approvedBy,approvalDate]);

@override
String toString() {
  return 'TransferRequest(transferRequestId: $transferRequestId, employeeId: $employeeId, currentLocation: $currentLocation, currentLocationId: $currentLocationId, currentDepartment: $currentDepartment, currentPosition: $currentPosition, transferLevelFrom: $transferLevelFrom, transferLevelTo: $transferLevelTo, toLocation: $toLocation, toLocationId: $toLocationId, toDepartment: $toDepartment, toDepartmentId: $toDepartmentId, toPosition: $toPosition, toPositionId: $toPositionId, requestDate: $requestDate, transferPeriod: $transferPeriod, transferYear: $transferYear, transferReason: $transferReason, transferStatus: $transferStatus, approvedBy: $approvedBy, approvalDate: $approvalDate)';
}


}

/// @nodoc
abstract mixin class $TransferRequestCopyWith<$Res>  {
  factory $TransferRequestCopyWith(TransferRequest value, $Res Function(TransferRequest) _then) = _$TransferRequestCopyWithImpl;
@useResult
$Res call({
 int transferRequestId, String? employeeId, String currentLocation, String? currentLocationId, String currentDepartment, String currentPosition, TransferLevels transferLevelFrom, TransferLevels transferLevelTo, String? toLocation, String? toLocationId, String? toDepartment, String? toDepartmentId, String? toPosition, String? toPositionId, DateTime requestDate, TransferPeriod transferPeriod, String? transferYear, TransferReasons? transferReason, TransferStatus transferStatus, String? approvedBy, DateTime? approvalDate
});




}
/// @nodoc
class _$TransferRequestCopyWithImpl<$Res>
    implements $TransferRequestCopyWith<$Res> {
  _$TransferRequestCopyWithImpl(this._self, this._then);

  final TransferRequest _self;
  final $Res Function(TransferRequest) _then;

/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transferRequestId = null,Object? employeeId = freezed,Object? currentLocation = null,Object? currentLocationId = freezed,Object? currentDepartment = null,Object? currentPosition = null,Object? transferLevelFrom = null,Object? transferLevelTo = null,Object? toLocation = freezed,Object? toLocationId = freezed,Object? toDepartment = freezed,Object? toDepartmentId = freezed,Object? toPosition = freezed,Object? toPositionId = freezed,Object? requestDate = null,Object? transferPeriod = null,Object? transferYear = freezed,Object? transferReason = freezed,Object? transferStatus = null,Object? approvedBy = freezed,Object? approvalDate = freezed,}) {
  return _then(_self.copyWith(
transferRequestId: null == transferRequestId ? _self.transferRequestId : transferRequestId // ignore: cast_nullable_to_non_nullable
as int,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String?,currentLocation: null == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as String,currentLocationId: freezed == currentLocationId ? _self.currentLocationId : currentLocationId // ignore: cast_nullable_to_non_nullable
as String?,currentDepartment: null == currentDepartment ? _self.currentDepartment : currentDepartment // ignore: cast_nullable_to_non_nullable
as String,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as String,transferLevelFrom: null == transferLevelFrom ? _self.transferLevelFrom : transferLevelFrom // ignore: cast_nullable_to_non_nullable
as TransferLevels,transferLevelTo: null == transferLevelTo ? _self.transferLevelTo : transferLevelTo // ignore: cast_nullable_to_non_nullable
as TransferLevels,toLocation: freezed == toLocation ? _self.toLocation : toLocation // ignore: cast_nullable_to_non_nullable
as String?,toLocationId: freezed == toLocationId ? _self.toLocationId : toLocationId // ignore: cast_nullable_to_non_nullable
as String?,toDepartment: freezed == toDepartment ? _self.toDepartment : toDepartment // ignore: cast_nullable_to_non_nullable
as String?,toDepartmentId: freezed == toDepartmentId ? _self.toDepartmentId : toDepartmentId // ignore: cast_nullable_to_non_nullable
as String?,toPosition: freezed == toPosition ? _self.toPosition : toPosition // ignore: cast_nullable_to_non_nullable
as String?,toPositionId: freezed == toPositionId ? _self.toPositionId : toPositionId // ignore: cast_nullable_to_non_nullable
as String?,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,transferPeriod: null == transferPeriod ? _self.transferPeriod : transferPeriod // ignore: cast_nullable_to_non_nullable
as TransferPeriod,transferYear: freezed == transferYear ? _self.transferYear : transferYear // ignore: cast_nullable_to_non_nullable
as String?,transferReason: freezed == transferReason ? _self.transferReason : transferReason // ignore: cast_nullable_to_non_nullable
as TransferReasons?,transferStatus: null == transferStatus ? _self.transferStatus : transferStatus // ignore: cast_nullable_to_non_nullable
as TransferStatus,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvalDate: freezed == approvalDate ? _self.approvalDate : approvalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferRequest].
extension TransferRequestPatterns on TransferRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferRequest value)  $default,){
final _that = this;
switch (_that) {
case _TransferRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TransferRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int transferRequestId,  String? employeeId,  String currentLocation,  String? currentLocationId,  String currentDepartment,  String currentPosition,  TransferLevels transferLevelFrom,  TransferLevels transferLevelTo,  String? toLocation,  String? toLocationId,  String? toDepartment,  String? toDepartmentId,  String? toPosition,  String? toPositionId,  DateTime requestDate,  TransferPeriod transferPeriod,  String? transferYear,  TransferReasons? transferReason,  TransferStatus transferStatus,  String? approvedBy,  DateTime? approvalDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferRequest() when $default != null:
return $default(_that.transferRequestId,_that.employeeId,_that.currentLocation,_that.currentLocationId,_that.currentDepartment,_that.currentPosition,_that.transferLevelFrom,_that.transferLevelTo,_that.toLocation,_that.toLocationId,_that.toDepartment,_that.toDepartmentId,_that.toPosition,_that.toPositionId,_that.requestDate,_that.transferPeriod,_that.transferYear,_that.transferReason,_that.transferStatus,_that.approvedBy,_that.approvalDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int transferRequestId,  String? employeeId,  String currentLocation,  String? currentLocationId,  String currentDepartment,  String currentPosition,  TransferLevels transferLevelFrom,  TransferLevels transferLevelTo,  String? toLocation,  String? toLocationId,  String? toDepartment,  String? toDepartmentId,  String? toPosition,  String? toPositionId,  DateTime requestDate,  TransferPeriod transferPeriod,  String? transferYear,  TransferReasons? transferReason,  TransferStatus transferStatus,  String? approvedBy,  DateTime? approvalDate)  $default,) {final _that = this;
switch (_that) {
case _TransferRequest():
return $default(_that.transferRequestId,_that.employeeId,_that.currentLocation,_that.currentLocationId,_that.currentDepartment,_that.currentPosition,_that.transferLevelFrom,_that.transferLevelTo,_that.toLocation,_that.toLocationId,_that.toDepartment,_that.toDepartmentId,_that.toPosition,_that.toPositionId,_that.requestDate,_that.transferPeriod,_that.transferYear,_that.transferReason,_that.transferStatus,_that.approvedBy,_that.approvalDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int transferRequestId,  String? employeeId,  String currentLocation,  String? currentLocationId,  String currentDepartment,  String currentPosition,  TransferLevels transferLevelFrom,  TransferLevels transferLevelTo,  String? toLocation,  String? toLocationId,  String? toDepartment,  String? toDepartmentId,  String? toPosition,  String? toPositionId,  DateTime requestDate,  TransferPeriod transferPeriod,  String? transferYear,  TransferReasons? transferReason,  TransferStatus transferStatus,  String? approvedBy,  DateTime? approvalDate)?  $default,) {final _that = this;
switch (_that) {
case _TransferRequest() when $default != null:
return $default(_that.transferRequestId,_that.employeeId,_that.currentLocation,_that.currentLocationId,_that.currentDepartment,_that.currentPosition,_that.transferLevelFrom,_that.transferLevelTo,_that.toLocation,_that.toLocationId,_that.toDepartment,_that.toDepartmentId,_that.toPosition,_that.toPositionId,_that.requestDate,_that.transferPeriod,_that.transferYear,_that.transferReason,_that.transferStatus,_that.approvedBy,_that.approvalDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferRequest implements TransferRequest {
  const _TransferRequest({required this.transferRequestId, this.employeeId, required this.currentLocation, this.currentLocationId, required this.currentDepartment, required this.currentPosition, required this.transferLevelFrom, required this.transferLevelTo, this.toLocation, this.toLocationId, this.toDepartment, this.toDepartmentId, this.toPosition, this.toPositionId, required this.requestDate, required this.transferPeriod, this.transferYear, this.transferReason, this.transferStatus = TransferStatus.pending, this.approvedBy, this.approvalDate});
  factory _TransferRequest.fromJson(Map<String, dynamic> json) => _$TransferRequestFromJson(json);

@override final  int transferRequestId;
// --- Nullability corrected based on C# model ---
@override final  String? employeeId;
// --- Current Location/Position (Required in C#) ---
@override final  String currentLocation;
@override final  String? currentLocationId;
@override final  String currentDepartment;
@override final  String currentPosition;
// --- Levels (Enums are value types, non-nullable by default in C#) ---
@override final  TransferLevels transferLevelFrom;
@override final  TransferLevels transferLevelTo;
// --- Destination Location/Position (Nullable in C#) ---
@override final  String? toLocation;
@override final  String? toLocationId;
@override final  String? toDepartment;
@override final  String? toDepartmentId;
@override final  String? toPosition;
@override final  String? toPositionId;
// --- Date and Reason ---
@override final  DateTime requestDate;
@override final  TransferPeriod transferPeriod;
@override final  String? transferYear;
@override final  TransferReasons? transferReason;
// Corrected to be nullable
// --- Approval Info (Nullable in C#) ---
@override@JsonKey() final  TransferStatus transferStatus;
@override final  String? approvedBy;
@override final  DateTime? approvalDate;

/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferRequestCopyWith<_TransferRequest> get copyWith => __$TransferRequestCopyWithImpl<_TransferRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferRequest&&(identical(other.transferRequestId, transferRequestId) || other.transferRequestId == transferRequestId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.currentLocationId, currentLocationId) || other.currentLocationId == currentLocationId)&&(identical(other.currentDepartment, currentDepartment) || other.currentDepartment == currentDepartment)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.transferLevelFrom, transferLevelFrom) || other.transferLevelFrom == transferLevelFrom)&&(identical(other.transferLevelTo, transferLevelTo) || other.transferLevelTo == transferLevelTo)&&(identical(other.toLocation, toLocation) || other.toLocation == toLocation)&&(identical(other.toLocationId, toLocationId) || other.toLocationId == toLocationId)&&(identical(other.toDepartment, toDepartment) || other.toDepartment == toDepartment)&&(identical(other.toDepartmentId, toDepartmentId) || other.toDepartmentId == toDepartmentId)&&(identical(other.toPosition, toPosition) || other.toPosition == toPosition)&&(identical(other.toPositionId, toPositionId) || other.toPositionId == toPositionId)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.transferPeriod, transferPeriod) || other.transferPeriod == transferPeriod)&&(identical(other.transferYear, transferYear) || other.transferYear == transferYear)&&(identical(other.transferReason, transferReason) || other.transferReason == transferReason)&&(identical(other.transferStatus, transferStatus) || other.transferStatus == transferStatus)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvalDate, approvalDate) || other.approvalDate == approvalDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,transferRequestId,employeeId,currentLocation,currentLocationId,currentDepartment,currentPosition,transferLevelFrom,transferLevelTo,toLocation,toLocationId,toDepartment,toDepartmentId,toPosition,toPositionId,requestDate,transferPeriod,transferYear,transferReason,transferStatus,approvedBy,approvalDate]);

@override
String toString() {
  return 'TransferRequest(transferRequestId: $transferRequestId, employeeId: $employeeId, currentLocation: $currentLocation, currentLocationId: $currentLocationId, currentDepartment: $currentDepartment, currentPosition: $currentPosition, transferLevelFrom: $transferLevelFrom, transferLevelTo: $transferLevelTo, toLocation: $toLocation, toLocationId: $toLocationId, toDepartment: $toDepartment, toDepartmentId: $toDepartmentId, toPosition: $toPosition, toPositionId: $toPositionId, requestDate: $requestDate, transferPeriod: $transferPeriod, transferYear: $transferYear, transferReason: $transferReason, transferStatus: $transferStatus, approvedBy: $approvedBy, approvalDate: $approvalDate)';
}


}

/// @nodoc
abstract mixin class _$TransferRequestCopyWith<$Res> implements $TransferRequestCopyWith<$Res> {
  factory _$TransferRequestCopyWith(_TransferRequest value, $Res Function(_TransferRequest) _then) = __$TransferRequestCopyWithImpl;
@override @useResult
$Res call({
 int transferRequestId, String? employeeId, String currentLocation, String? currentLocationId, String currentDepartment, String currentPosition, TransferLevels transferLevelFrom, TransferLevels transferLevelTo, String? toLocation, String? toLocationId, String? toDepartment, String? toDepartmentId, String? toPosition, String? toPositionId, DateTime requestDate, TransferPeriod transferPeriod, String? transferYear, TransferReasons? transferReason, TransferStatus transferStatus, String? approvedBy, DateTime? approvalDate
});




}
/// @nodoc
class __$TransferRequestCopyWithImpl<$Res>
    implements _$TransferRequestCopyWith<$Res> {
  __$TransferRequestCopyWithImpl(this._self, this._then);

  final _TransferRequest _self;
  final $Res Function(_TransferRequest) _then;

/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transferRequestId = null,Object? employeeId = freezed,Object? currentLocation = null,Object? currentLocationId = freezed,Object? currentDepartment = null,Object? currentPosition = null,Object? transferLevelFrom = null,Object? transferLevelTo = null,Object? toLocation = freezed,Object? toLocationId = freezed,Object? toDepartment = freezed,Object? toDepartmentId = freezed,Object? toPosition = freezed,Object? toPositionId = freezed,Object? requestDate = null,Object? transferPeriod = null,Object? transferYear = freezed,Object? transferReason = freezed,Object? transferStatus = null,Object? approvedBy = freezed,Object? approvalDate = freezed,}) {
  return _then(_TransferRequest(
transferRequestId: null == transferRequestId ? _self.transferRequestId : transferRequestId // ignore: cast_nullable_to_non_nullable
as int,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String?,currentLocation: null == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as String,currentLocationId: freezed == currentLocationId ? _self.currentLocationId : currentLocationId // ignore: cast_nullable_to_non_nullable
as String?,currentDepartment: null == currentDepartment ? _self.currentDepartment : currentDepartment // ignore: cast_nullable_to_non_nullable
as String,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as String,transferLevelFrom: null == transferLevelFrom ? _self.transferLevelFrom : transferLevelFrom // ignore: cast_nullable_to_non_nullable
as TransferLevels,transferLevelTo: null == transferLevelTo ? _self.transferLevelTo : transferLevelTo // ignore: cast_nullable_to_non_nullable
as TransferLevels,toLocation: freezed == toLocation ? _self.toLocation : toLocation // ignore: cast_nullable_to_non_nullable
as String?,toLocationId: freezed == toLocationId ? _self.toLocationId : toLocationId // ignore: cast_nullable_to_non_nullable
as String?,toDepartment: freezed == toDepartment ? _self.toDepartment : toDepartment // ignore: cast_nullable_to_non_nullable
as String?,toDepartmentId: freezed == toDepartmentId ? _self.toDepartmentId : toDepartmentId // ignore: cast_nullable_to_non_nullable
as String?,toPosition: freezed == toPosition ? _self.toPosition : toPosition // ignore: cast_nullable_to_non_nullable
as String?,toPositionId: freezed == toPositionId ? _self.toPositionId : toPositionId // ignore: cast_nullable_to_non_nullable
as String?,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,transferPeriod: null == transferPeriod ? _self.transferPeriod : transferPeriod // ignore: cast_nullable_to_non_nullable
as TransferPeriod,transferYear: freezed == transferYear ? _self.transferYear : transferYear // ignore: cast_nullable_to_non_nullable
as String?,transferReason: freezed == transferReason ? _self.transferReason : transferReason // ignore: cast_nullable_to_non_nullable
as TransferReasons?,transferStatus: null == transferStatus ? _self.transferStatus : transferStatus // ignore: cast_nullable_to_non_nullable
as TransferStatus,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvalDate: freezed == approvalDate ? _self.approvalDate : approvalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
