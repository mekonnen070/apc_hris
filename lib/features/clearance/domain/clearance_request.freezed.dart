// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 int get id; String get employeeId; ClearanceReason get reason; DateTime get requestDate; DateTime get lastDayOfWork; String? get comments; ClearanceStatus get status; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ClearanceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClearanceRequestCopyWith<ClearanceRequest> get copyWith => _$ClearanceRequestCopyWithImpl<ClearanceRequest>(this as ClearanceRequest, _$identity);

  /// Serializes this ClearanceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearanceRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.lastDayOfWork, lastDayOfWork) || other.lastDayOfWork == lastDayOfWork)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,reason,requestDate,lastDayOfWork,comments,status,createdAt,updatedAt);

@override
String toString() {
  return 'ClearanceRequest(id: $id, employeeId: $employeeId, reason: $reason, requestDate: $requestDate, lastDayOfWork: $lastDayOfWork, comments: $comments, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ClearanceRequestCopyWith<$Res>  {
  factory $ClearanceRequestCopyWith(ClearanceRequest value, $Res Function(ClearanceRequest) _then) = _$ClearanceRequestCopyWithImpl;
@useResult
$Res call({
 int id, String employeeId, ClearanceReason reason, DateTime requestDate, DateTime lastDayOfWork, String? comments, ClearanceStatus status, DateTime createdAt, DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? employeeId = null,Object? reason = null,Object? requestDate = null,Object? lastDayOfWork = null,Object? comments = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ClearanceReason,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastDayOfWork: null == lastDayOfWork ? _self.lastDayOfWork : lastDayOfWork // ignore: cast_nullable_to_non_nullable
as DateTime,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClearanceStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ClearanceRequest implements ClearanceRequest {
  const _ClearanceRequest({required this.id, required this.employeeId, required this.reason, required this.requestDate, required this.lastDayOfWork, this.comments, required this.status, required this.createdAt, required this.updatedAt});
  factory _ClearanceRequest.fromJson(Map<String, dynamic> json) => _$ClearanceRequestFromJson(json);

@override final  int id;
@override final  String employeeId;
@override final  ClearanceReason reason;
@override final  DateTime requestDate;
@override final  DateTime lastDayOfWork;
@override final  String? comments;
@override final  ClearanceStatus status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearanceRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.lastDayOfWork, lastDayOfWork) || other.lastDayOfWork == lastDayOfWork)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,reason,requestDate,lastDayOfWork,comments,status,createdAt,updatedAt);

@override
String toString() {
  return 'ClearanceRequest(id: $id, employeeId: $employeeId, reason: $reason, requestDate: $requestDate, lastDayOfWork: $lastDayOfWork, comments: $comments, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ClearanceRequestCopyWith<$Res> implements $ClearanceRequestCopyWith<$Res> {
  factory _$ClearanceRequestCopyWith(_ClearanceRequest value, $Res Function(_ClearanceRequest) _then) = __$ClearanceRequestCopyWithImpl;
@override @useResult
$Res call({
 int id, String employeeId, ClearanceReason reason, DateTime requestDate, DateTime lastDayOfWork, String? comments, ClearanceStatus status, DateTime createdAt, DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? employeeId = null,Object? reason = null,Object? requestDate = null,Object? lastDayOfWork = null,Object? comments = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ClearanceRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ClearanceReason,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastDayOfWork: null == lastDayOfWork ? _self.lastDayOfWork : lastDayOfWork // ignore: cast_nullable_to_non_nullable
as DateTime,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClearanceStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
