// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clearance_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClearanceRequest {

 String get requestId; String get employeeId; ClearanceType get type; DateTime get requestDate; DateTime? get targetCompletionDate; ClearanceStatus get clearanceStatus; String? get remarks;
/// Create a copy of ClearanceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClearanceRequestCopyWith<ClearanceRequest> get copyWith => _$ClearanceRequestCopyWithImpl<ClearanceRequest>(this as ClearanceRequest, _$identity);

  /// Serializes this ClearanceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearanceRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.targetCompletionDate, targetCompletionDate) || other.targetCompletionDate == targetCompletionDate)&&(identical(other.clearanceStatus, clearanceStatus) || other.clearanceStatus == clearanceStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,employeeId,type,requestDate,targetCompletionDate,clearanceStatus,remarks);

@override
String toString() {
  return 'ClearanceRequest(requestId: $requestId, employeeId: $employeeId, type: $type, requestDate: $requestDate, targetCompletionDate: $targetCompletionDate, clearanceStatus: $clearanceStatus, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class $ClearanceRequestCopyWith<$Res>  {
  factory $ClearanceRequestCopyWith(ClearanceRequest value, $Res Function(ClearanceRequest) _then) = _$ClearanceRequestCopyWithImpl;
@useResult
$Res call({
 String requestId, String employeeId, ClearanceType type, DateTime requestDate, DateTime? targetCompletionDate, ClearanceStatus clearanceStatus, String? remarks
});




}
/// @nodoc
class _$ClearanceRequestCopyWithImpl<$Res>
    implements $ClearanceRequestCopyWith<$Res> {
  _$ClearanceRequestCopyWithImpl(this._self, this._then);

  final ClearanceRequest _self;
  final $Res Function(ClearanceRequest) _then;

/// Create a copy of ClearanceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? employeeId = null,Object? type = null,Object? requestDate = null,Object? targetCompletionDate = freezed,Object? clearanceStatus = null,Object? remarks = freezed,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClearanceType,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,targetCompletionDate: freezed == targetCompletionDate ? _self.targetCompletionDate : targetCompletionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,clearanceStatus: null == clearanceStatus ? _self.clearanceStatus : clearanceStatus // ignore: cast_nullable_to_non_nullable
as ClearanceStatus,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClearanceRequest].
extension ClearanceRequestPatterns on ClearanceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClearanceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClearanceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClearanceRequest value)  $default,){
final _that = this;
switch (_that) {
case _ClearanceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClearanceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ClearanceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String employeeId,  ClearanceType type,  DateTime requestDate,  DateTime? targetCompletionDate,  ClearanceStatus clearanceStatus,  String? remarks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClearanceRequest() when $default != null:
return $default(_that.requestId,_that.employeeId,_that.type,_that.requestDate,_that.targetCompletionDate,_that.clearanceStatus,_that.remarks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String employeeId,  ClearanceType type,  DateTime requestDate,  DateTime? targetCompletionDate,  ClearanceStatus clearanceStatus,  String? remarks)  $default,) {final _that = this;
switch (_that) {
case _ClearanceRequest():
return $default(_that.requestId,_that.employeeId,_that.type,_that.requestDate,_that.targetCompletionDate,_that.clearanceStatus,_that.remarks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String employeeId,  ClearanceType type,  DateTime requestDate,  DateTime? targetCompletionDate,  ClearanceStatus clearanceStatus,  String? remarks)?  $default,) {final _that = this;
switch (_that) {
case _ClearanceRequest() when $default != null:
return $default(_that.requestId,_that.employeeId,_that.type,_that.requestDate,_that.targetCompletionDate,_that.clearanceStatus,_that.remarks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClearanceRequest implements ClearanceRequest {
  const _ClearanceRequest({required this.requestId, required this.employeeId, required this.type, required this.requestDate, this.targetCompletionDate, this.clearanceStatus = ClearanceStatus.pending, this.remarks});
  factory _ClearanceRequest.fromJson(Map<String, dynamic> json) => _$ClearanceRequestFromJson(json);

@override final  String requestId;
@override final  String employeeId;
@override final  ClearanceType type;
@override final  DateTime requestDate;
@override final  DateTime? targetCompletionDate;
@override@JsonKey() final  ClearanceStatus clearanceStatus;
@override final  String? remarks;

/// Create a copy of ClearanceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClearanceRequestCopyWith<_ClearanceRequest> get copyWith => __$ClearanceRequestCopyWithImpl<_ClearanceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClearanceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearanceRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.targetCompletionDate, targetCompletionDate) || other.targetCompletionDate == targetCompletionDate)&&(identical(other.clearanceStatus, clearanceStatus) || other.clearanceStatus == clearanceStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,employeeId,type,requestDate,targetCompletionDate,clearanceStatus,remarks);

@override
String toString() {
  return 'ClearanceRequest(requestId: $requestId, employeeId: $employeeId, type: $type, requestDate: $requestDate, targetCompletionDate: $targetCompletionDate, clearanceStatus: $clearanceStatus, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class _$ClearanceRequestCopyWith<$Res> implements $ClearanceRequestCopyWith<$Res> {
  factory _$ClearanceRequestCopyWith(_ClearanceRequest value, $Res Function(_ClearanceRequest) _then) = __$ClearanceRequestCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String employeeId, ClearanceType type, DateTime requestDate, DateTime? targetCompletionDate, ClearanceStatus clearanceStatus, String? remarks
});




}
/// @nodoc
class __$ClearanceRequestCopyWithImpl<$Res>
    implements _$ClearanceRequestCopyWith<$Res> {
  __$ClearanceRequestCopyWithImpl(this._self, this._then);

  final _ClearanceRequest _self;
  final $Res Function(_ClearanceRequest) _then;

/// Create a copy of ClearanceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? employeeId = null,Object? type = null,Object? requestDate = null,Object? targetCompletionDate = freezed,Object? clearanceStatus = null,Object? remarks = freezed,}) {
  return _then(_ClearanceRequest(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClearanceType,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,targetCompletionDate: freezed == targetCompletionDate ? _self.targetCompletionDate : targetCompletionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,clearanceStatus: null == clearanceStatus ? _self.clearanceStatus : clearanceStatus // ignore: cast_nullable_to_non_nullable
as ClearanceStatus,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
