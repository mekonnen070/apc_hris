// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clearance_request_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClearanceRequestCreate {

 String get requestId; String get employeeId; ClearanceType get type; DateTime get requestDate; DateTime? get targetCompletionDate; ClearanceStatus get clearanceStatus; String? get remarks;
/// Create a copy of ClearanceRequestCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClearanceRequestCreateCopyWith<ClearanceRequestCreate> get copyWith => _$ClearanceRequestCreateCopyWithImpl<ClearanceRequestCreate>(this as ClearanceRequestCreate, _$identity);

  /// Serializes this ClearanceRequestCreate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearanceRequestCreate&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.targetCompletionDate, targetCompletionDate) || other.targetCompletionDate == targetCompletionDate)&&(identical(other.clearanceStatus, clearanceStatus) || other.clearanceStatus == clearanceStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,employeeId,type,requestDate,targetCompletionDate,clearanceStatus,remarks);

@override
String toString() {
  return 'ClearanceRequestCreate(requestId: $requestId, employeeId: $employeeId, type: $type, requestDate: $requestDate, targetCompletionDate: $targetCompletionDate, clearanceStatus: $clearanceStatus, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class $ClearanceRequestCreateCopyWith<$Res>  {
  factory $ClearanceRequestCreateCopyWith(ClearanceRequestCreate value, $Res Function(ClearanceRequestCreate) _then) = _$ClearanceRequestCreateCopyWithImpl;
@useResult
$Res call({
 String requestId, String employeeId, ClearanceType type, DateTime requestDate, DateTime? targetCompletionDate, ClearanceStatus clearanceStatus, String? remarks
});




}
/// @nodoc
class _$ClearanceRequestCreateCopyWithImpl<$Res>
    implements $ClearanceRequestCreateCopyWith<$Res> {
  _$ClearanceRequestCreateCopyWithImpl(this._self, this._then);

  final ClearanceRequestCreate _self;
  final $Res Function(ClearanceRequestCreate) _then;

/// Create a copy of ClearanceRequestCreate
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


/// @nodoc
@JsonSerializable()

class _ClearanceRequestCreate implements ClearanceRequestCreate {
  const _ClearanceRequestCreate({required this.requestId, required this.employeeId, required this.type, required this.requestDate, this.targetCompletionDate, this.clearanceStatus = ClearanceStatus.pending, this.remarks});
  factory _ClearanceRequestCreate.fromJson(Map<String, dynamic> json) => _$ClearanceRequestCreateFromJson(json);

@override final  String requestId;
@override final  String employeeId;
@override final  ClearanceType type;
@override final  DateTime requestDate;
@override final  DateTime? targetCompletionDate;
@override@JsonKey() final  ClearanceStatus clearanceStatus;
@override final  String? remarks;

/// Create a copy of ClearanceRequestCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClearanceRequestCreateCopyWith<_ClearanceRequestCreate> get copyWith => __$ClearanceRequestCreateCopyWithImpl<_ClearanceRequestCreate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClearanceRequestCreateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearanceRequestCreate&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.targetCompletionDate, targetCompletionDate) || other.targetCompletionDate == targetCompletionDate)&&(identical(other.clearanceStatus, clearanceStatus) || other.clearanceStatus == clearanceStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,employeeId,type,requestDate,targetCompletionDate,clearanceStatus,remarks);

@override
String toString() {
  return 'ClearanceRequestCreate(requestId: $requestId, employeeId: $employeeId, type: $type, requestDate: $requestDate, targetCompletionDate: $targetCompletionDate, clearanceStatus: $clearanceStatus, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class _$ClearanceRequestCreateCopyWith<$Res> implements $ClearanceRequestCreateCopyWith<$Res> {
  factory _$ClearanceRequestCreateCopyWith(_ClearanceRequestCreate value, $Res Function(_ClearanceRequestCreate) _then) = __$ClearanceRequestCreateCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String employeeId, ClearanceType type, DateTime requestDate, DateTime? targetCompletionDate, ClearanceStatus clearanceStatus, String? remarks
});




}
/// @nodoc
class __$ClearanceRequestCreateCopyWithImpl<$Res>
    implements _$ClearanceRequestCreateCopyWith<$Res> {
  __$ClearanceRequestCreateCopyWithImpl(this._self, this._then);

  final _ClearanceRequestCreate _self;
  final $Res Function(_ClearanceRequestCreate) _then;

/// Create a copy of ClearanceRequestCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? employeeId = null,Object? type = null,Object? requestDate = null,Object? targetCompletionDate = freezed,Object? clearanceStatus = null,Object? remarks = freezed,}) {
  return _then(_ClearanceRequestCreate(
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
