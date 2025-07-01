// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveRequest {

 int get leaveRequestId; String get leaveTypeId; String get employeeId; DateTime get startDate; DateTime get endDate; int get numOfDays; String? get requestReason; LeaveRequestStatus get requestStatus; String? get comment; DateTime? get actionedDate;
/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveRequestCopyWith<LeaveRequest> get copyWith => _$LeaveRequestCopyWithImpl<LeaveRequest>(this as LeaveRequest, _$identity);

  /// Serializes this LeaveRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveRequest&&(identical(other.leaveRequestId, leaveRequestId) || other.leaveRequestId == leaveRequestId)&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.numOfDays, numOfDays) || other.numOfDays == numOfDays)&&(identical(other.requestReason, requestReason) || other.requestReason == requestReason)&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.actionedDate, actionedDate) || other.actionedDate == actionedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveRequestId,leaveTypeId,employeeId,startDate,endDate,numOfDays,requestReason,requestStatus,comment,actionedDate);

@override
String toString() {
  return 'LeaveRequest(leaveRequestId: $leaveRequestId, leaveTypeId: $leaveTypeId, employeeId: $employeeId, startDate: $startDate, endDate: $endDate, numOfDays: $numOfDays, requestReason: $requestReason, requestStatus: $requestStatus, comment: $comment, actionedDate: $actionedDate)';
}


}

/// @nodoc
abstract mixin class $LeaveRequestCopyWith<$Res>  {
  factory $LeaveRequestCopyWith(LeaveRequest value, $Res Function(LeaveRequest) _then) = _$LeaveRequestCopyWithImpl;
@useResult
$Res call({
 int leaveRequestId, String leaveTypeId, String employeeId, DateTime startDate, DateTime endDate, int numOfDays, String? requestReason, LeaveRequestStatus requestStatus, String? comment, DateTime? actionedDate
});




}
/// @nodoc
class _$LeaveRequestCopyWithImpl<$Res>
    implements $LeaveRequestCopyWith<$Res> {
  _$LeaveRequestCopyWithImpl(this._self, this._then);

  final LeaveRequest _self;
  final $Res Function(LeaveRequest) _then;

/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveRequestId = null,Object? leaveTypeId = null,Object? employeeId = null,Object? startDate = null,Object? endDate = null,Object? numOfDays = null,Object? requestReason = freezed,Object? requestStatus = null,Object? comment = freezed,Object? actionedDate = freezed,}) {
  return _then(_self.copyWith(
leaveRequestId: null == leaveRequestId ? _self.leaveRequestId : leaveRequestId // ignore: cast_nullable_to_non_nullable
as int,leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,numOfDays: null == numOfDays ? _self.numOfDays : numOfDays // ignore: cast_nullable_to_non_nullable
as int,requestReason: freezed == requestReason ? _self.requestReason : requestReason // ignore: cast_nullable_to_non_nullable
as String?,requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as LeaveRequestStatus,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,actionedDate: freezed == actionedDate ? _self.actionedDate : actionedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LeaveRequest implements LeaveRequest {
   _LeaveRequest({required this.leaveRequestId, required this.leaveTypeId, required this.employeeId, required this.startDate, required this.endDate, required this.numOfDays, this.requestReason, this.requestStatus = LeaveRequestStatus.pending, this.comment, this.actionedDate});
  factory _LeaveRequest.fromJson(Map<String, dynamic> json) => _$LeaveRequestFromJson(json);

@override final  int leaveRequestId;
@override final  String leaveTypeId;
@override final  String employeeId;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  int numOfDays;
@override final  String? requestReason;
@override@JsonKey() final  LeaveRequestStatus requestStatus;
@override final  String? comment;
@override final  DateTime? actionedDate;

/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveRequestCopyWith<_LeaveRequest> get copyWith => __$LeaveRequestCopyWithImpl<_LeaveRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveRequest&&(identical(other.leaveRequestId, leaveRequestId) || other.leaveRequestId == leaveRequestId)&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.numOfDays, numOfDays) || other.numOfDays == numOfDays)&&(identical(other.requestReason, requestReason) || other.requestReason == requestReason)&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.actionedDate, actionedDate) || other.actionedDate == actionedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveRequestId,leaveTypeId,employeeId,startDate,endDate,numOfDays,requestReason,requestStatus,comment,actionedDate);

@override
String toString() {
  return 'LeaveRequest(leaveRequestId: $leaveRequestId, leaveTypeId: $leaveTypeId, employeeId: $employeeId, startDate: $startDate, endDate: $endDate, numOfDays: $numOfDays, requestReason: $requestReason, requestStatus: $requestStatus, comment: $comment, actionedDate: $actionedDate)';
}


}

/// @nodoc
abstract mixin class _$LeaveRequestCopyWith<$Res> implements $LeaveRequestCopyWith<$Res> {
  factory _$LeaveRequestCopyWith(_LeaveRequest value, $Res Function(_LeaveRequest) _then) = __$LeaveRequestCopyWithImpl;
@override @useResult
$Res call({
 int leaveRequestId, String leaveTypeId, String employeeId, DateTime startDate, DateTime endDate, int numOfDays, String? requestReason, LeaveRequestStatus requestStatus, String? comment, DateTime? actionedDate
});




}
/// @nodoc
class __$LeaveRequestCopyWithImpl<$Res>
    implements _$LeaveRequestCopyWith<$Res> {
  __$LeaveRequestCopyWithImpl(this._self, this._then);

  final _LeaveRequest _self;
  final $Res Function(_LeaveRequest) _then;

/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveRequestId = null,Object? leaveTypeId = null,Object? employeeId = null,Object? startDate = null,Object? endDate = null,Object? numOfDays = null,Object? requestReason = freezed,Object? requestStatus = null,Object? comment = freezed,Object? actionedDate = freezed,}) {
  return _then(_LeaveRequest(
leaveRequestId: null == leaveRequestId ? _self.leaveRequestId : leaveRequestId // ignore: cast_nullable_to_non_nullable
as int,leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,numOfDays: null == numOfDays ? _self.numOfDays : numOfDays // ignore: cast_nullable_to_non_nullable
as int,requestReason: freezed == requestReason ? _self.requestReason : requestReason // ignore: cast_nullable_to_non_nullable
as String?,requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as LeaveRequestStatus,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,actionedDate: freezed == actionedDate ? _self.actionedDate : actionedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
