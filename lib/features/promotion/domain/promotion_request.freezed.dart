// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromotionRequest {

 int get id; String get employeeId; DateTime get requestDate; String get currentPositionId; String get promotedToPositionId; String get reason; String? get comments; PromotionStatus get status;
/// Create a copy of PromotionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromotionRequestCopyWith<PromotionRequest> get copyWith => _$PromotionRequestCopyWithImpl<PromotionRequest>(this as PromotionRequest, _$identity);

  /// Serializes this PromotionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromotionRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.currentPositionId, currentPositionId) || other.currentPositionId == currentPositionId)&&(identical(other.promotedToPositionId, promotedToPositionId) || other.promotedToPositionId == promotedToPositionId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,requestDate,currentPositionId,promotedToPositionId,reason,comments,status);

@override
String toString() {
  return 'PromotionRequest(id: $id, employeeId: $employeeId, requestDate: $requestDate, currentPositionId: $currentPositionId, promotedToPositionId: $promotedToPositionId, reason: $reason, comments: $comments, status: $status)';
}


}

/// @nodoc
abstract mixin class $PromotionRequestCopyWith<$Res>  {
  factory $PromotionRequestCopyWith(PromotionRequest value, $Res Function(PromotionRequest) _then) = _$PromotionRequestCopyWithImpl;
@useResult
$Res call({
 int id, String employeeId, DateTime requestDate, String currentPositionId, String promotedToPositionId, String reason, String? comments, PromotionStatus status
});




}
/// @nodoc
class _$PromotionRequestCopyWithImpl<$Res>
    implements $PromotionRequestCopyWith<$Res> {
  _$PromotionRequestCopyWithImpl(this._self, this._then);

  final PromotionRequest _self;
  final $Res Function(PromotionRequest) _then;

/// Create a copy of PromotionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? employeeId = null,Object? requestDate = null,Object? currentPositionId = null,Object? promotedToPositionId = null,Object? reason = null,Object? comments = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,currentPositionId: null == currentPositionId ? _self.currentPositionId : currentPositionId // ignore: cast_nullable_to_non_nullable
as String,promotedToPositionId: null == promotedToPositionId ? _self.promotedToPositionId : promotedToPositionId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PromotionStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [PromotionRequest].
extension PromotionRequestPatterns on PromotionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromotionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromotionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromotionRequest value)  $default,){
final _that = this;
switch (_that) {
case _PromotionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromotionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PromotionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String employeeId,  DateTime requestDate,  String currentPositionId,  String promotedToPositionId,  String reason,  String? comments,  PromotionStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromotionRequest() when $default != null:
return $default(_that.id,_that.employeeId,_that.requestDate,_that.currentPositionId,_that.promotedToPositionId,_that.reason,_that.comments,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String employeeId,  DateTime requestDate,  String currentPositionId,  String promotedToPositionId,  String reason,  String? comments,  PromotionStatus status)  $default,) {final _that = this;
switch (_that) {
case _PromotionRequest():
return $default(_that.id,_that.employeeId,_that.requestDate,_that.currentPositionId,_that.promotedToPositionId,_that.reason,_that.comments,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String employeeId,  DateTime requestDate,  String currentPositionId,  String promotedToPositionId,  String reason,  String? comments,  PromotionStatus status)?  $default,) {final _that = this;
switch (_that) {
case _PromotionRequest() when $default != null:
return $default(_that.id,_that.employeeId,_that.requestDate,_that.currentPositionId,_that.promotedToPositionId,_that.reason,_that.comments,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromotionRequest implements PromotionRequest {
  const _PromotionRequest({required this.id, required this.employeeId, required this.requestDate, required this.currentPositionId, required this.promotedToPositionId, required this.reason, this.comments, required this.status});
  factory _PromotionRequest.fromJson(Map<String, dynamic> json) => _$PromotionRequestFromJson(json);

@override final  int id;
@override final  String employeeId;
@override final  DateTime requestDate;
@override final  String currentPositionId;
@override final  String promotedToPositionId;
@override final  String reason;
@override final  String? comments;
@override final  PromotionStatus status;

/// Create a copy of PromotionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromotionRequestCopyWith<_PromotionRequest> get copyWith => __$PromotionRequestCopyWithImpl<_PromotionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromotionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromotionRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.currentPositionId, currentPositionId) || other.currentPositionId == currentPositionId)&&(identical(other.promotedToPositionId, promotedToPositionId) || other.promotedToPositionId == promotedToPositionId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,requestDate,currentPositionId,promotedToPositionId,reason,comments,status);

@override
String toString() {
  return 'PromotionRequest(id: $id, employeeId: $employeeId, requestDate: $requestDate, currentPositionId: $currentPositionId, promotedToPositionId: $promotedToPositionId, reason: $reason, comments: $comments, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PromotionRequestCopyWith<$Res> implements $PromotionRequestCopyWith<$Res> {
  factory _$PromotionRequestCopyWith(_PromotionRequest value, $Res Function(_PromotionRequest) _then) = __$PromotionRequestCopyWithImpl;
@override @useResult
$Res call({
 int id, String employeeId, DateTime requestDate, String currentPositionId, String promotedToPositionId, String reason, String? comments, PromotionStatus status
});




}
/// @nodoc
class __$PromotionRequestCopyWithImpl<$Res>
    implements _$PromotionRequestCopyWith<$Res> {
  __$PromotionRequestCopyWithImpl(this._self, this._then);

  final _PromotionRequest _self;
  final $Res Function(_PromotionRequest) _then;

/// Create a copy of PromotionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? employeeId = null,Object? requestDate = null,Object? currentPositionId = null,Object? promotedToPositionId = null,Object? reason = null,Object? comments = freezed,Object? status = null,}) {
  return _then(_PromotionRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,currentPositionId: null == currentPositionId ? _self.currentPositionId : currentPositionId // ignore: cast_nullable_to_non_nullable
as String,promotedToPositionId: null == promotedToPositionId ? _self.promotedToPositionId : promotedToPositionId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PromotionStatus,
  ));
}


}

// dart format on
