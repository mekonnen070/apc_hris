// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_request_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveRequestCreate {

 String get leaveTypeId; String get employeeId; DateTime get startDate; DateTime get endDate; int get numOfDays; String get requestReason; DateTime get requestDate;
/// Create a copy of LeaveRequestCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveRequestCreateCopyWith<LeaveRequestCreate> get copyWith => _$LeaveRequestCreateCopyWithImpl<LeaveRequestCreate>(this as LeaveRequestCreate, _$identity);

  /// Serializes this LeaveRequestCreate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveRequestCreate&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.numOfDays, numOfDays) || other.numOfDays == numOfDays)&&(identical(other.requestReason, requestReason) || other.requestReason == requestReason)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveTypeId,employeeId,startDate,endDate,numOfDays,requestReason,requestDate);

@override
String toString() {
  return 'LeaveRequestCreate(leaveTypeId: $leaveTypeId, employeeId: $employeeId, startDate: $startDate, endDate: $endDate, numOfDays: $numOfDays, requestReason: $requestReason, requestDate: $requestDate)';
}


}

/// @nodoc
abstract mixin class $LeaveRequestCreateCopyWith<$Res>  {
  factory $LeaveRequestCreateCopyWith(LeaveRequestCreate value, $Res Function(LeaveRequestCreate) _then) = _$LeaveRequestCreateCopyWithImpl;
@useResult
$Res call({
 String leaveTypeId, String employeeId, DateTime startDate, DateTime endDate, int numOfDays, String requestReason, DateTime requestDate
});




}
/// @nodoc
class _$LeaveRequestCreateCopyWithImpl<$Res>
    implements $LeaveRequestCreateCopyWith<$Res> {
  _$LeaveRequestCreateCopyWithImpl(this._self, this._then);

  final LeaveRequestCreate _self;
  final $Res Function(LeaveRequestCreate) _then;

/// Create a copy of LeaveRequestCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveTypeId = null,Object? employeeId = null,Object? startDate = null,Object? endDate = null,Object? numOfDays = null,Object? requestReason = null,Object? requestDate = null,}) {
  return _then(_self.copyWith(
leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,numOfDays: null == numOfDays ? _self.numOfDays : numOfDays // ignore: cast_nullable_to_non_nullable
as int,requestReason: null == requestReason ? _self.requestReason : requestReason // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LeaveRequestCreate implements LeaveRequestCreate {
   _LeaveRequestCreate({required this.leaveTypeId, required this.employeeId, required this.startDate, required this.endDate, required this.numOfDays, required this.requestReason, required this.requestDate});
  factory _LeaveRequestCreate.fromJson(Map<String, dynamic> json) => _$LeaveRequestCreateFromJson(json);

@override final  String leaveTypeId;
@override final  String employeeId;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  int numOfDays;
@override final  String requestReason;
@override final  DateTime requestDate;

/// Create a copy of LeaveRequestCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveRequestCreateCopyWith<_LeaveRequestCreate> get copyWith => __$LeaveRequestCreateCopyWithImpl<_LeaveRequestCreate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveRequestCreateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveRequestCreate&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.numOfDays, numOfDays) || other.numOfDays == numOfDays)&&(identical(other.requestReason, requestReason) || other.requestReason == requestReason)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveTypeId,employeeId,startDate,endDate,numOfDays,requestReason,requestDate);

@override
String toString() {
  return 'LeaveRequestCreate(leaveTypeId: $leaveTypeId, employeeId: $employeeId, startDate: $startDate, endDate: $endDate, numOfDays: $numOfDays, requestReason: $requestReason, requestDate: $requestDate)';
}


}

/// @nodoc
abstract mixin class _$LeaveRequestCreateCopyWith<$Res> implements $LeaveRequestCreateCopyWith<$Res> {
  factory _$LeaveRequestCreateCopyWith(_LeaveRequestCreate value, $Res Function(_LeaveRequestCreate) _then) = __$LeaveRequestCreateCopyWithImpl;
@override @useResult
$Res call({
 String leaveTypeId, String employeeId, DateTime startDate, DateTime endDate, int numOfDays, String requestReason, DateTime requestDate
});




}
/// @nodoc
class __$LeaveRequestCreateCopyWithImpl<$Res>
    implements _$LeaveRequestCreateCopyWith<$Res> {
  __$LeaveRequestCreateCopyWithImpl(this._self, this._then);

  final _LeaveRequestCreate _self;
  final $Res Function(_LeaveRequestCreate) _then;

/// Create a copy of LeaveRequestCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveTypeId = null,Object? employeeId = null,Object? startDate = null,Object? endDate = null,Object? numOfDays = null,Object? requestReason = null,Object? requestDate = null,}) {
  return _then(_LeaveRequestCreate(
leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,numOfDays: null == numOfDays ? _self.numOfDays : numOfDays // ignore: cast_nullable_to_non_nullable
as int,requestReason: null == requestReason ? _self.requestReason : requestReason // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
