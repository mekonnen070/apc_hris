// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveType {

 int get leaveTypeId; String get leaveTypeName; bool get isPaid; int get maximumDays;
/// Create a copy of LeaveType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveTypeCopyWith<LeaveType> get copyWith => _$LeaveTypeCopyWithImpl<LeaveType>(this as LeaveType, _$identity);

  /// Serializes this LeaveType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveType&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.leaveTypeName, leaveTypeName) || other.leaveTypeName == leaveTypeName)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.maximumDays, maximumDays) || other.maximumDays == maximumDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveTypeId,leaveTypeName,isPaid,maximumDays);

@override
String toString() {
  return 'LeaveType(leaveTypeId: $leaveTypeId, leaveTypeName: $leaveTypeName, isPaid: $isPaid, maximumDays: $maximumDays)';
}


}

/// @nodoc
abstract mixin class $LeaveTypeCopyWith<$Res>  {
  factory $LeaveTypeCopyWith(LeaveType value, $Res Function(LeaveType) _then) = _$LeaveTypeCopyWithImpl;
@useResult
$Res call({
 int leaveTypeId, String leaveTypeName, bool isPaid, int maximumDays
});




}
/// @nodoc
class _$LeaveTypeCopyWithImpl<$Res>
    implements $LeaveTypeCopyWith<$Res> {
  _$LeaveTypeCopyWithImpl(this._self, this._then);

  final LeaveType _self;
  final $Res Function(LeaveType) _then;

/// Create a copy of LeaveType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveTypeId = null,Object? leaveTypeName = null,Object? isPaid = null,Object? maximumDays = null,}) {
  return _then(_self.copyWith(
leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as int,leaveTypeName: null == leaveTypeName ? _self.leaveTypeName : leaveTypeName // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,maximumDays: null == maximumDays ? _self.maximumDays : maximumDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LeaveType implements LeaveType {
  const _LeaveType({required this.leaveTypeId, required this.leaveTypeName, required this.isPaid, required this.maximumDays});
  factory _LeaveType.fromJson(Map<String, dynamic> json) => _$LeaveTypeFromJson(json);

@override final  int leaveTypeId;
@override final  String leaveTypeName;
@override final  bool isPaid;
@override final  int maximumDays;

/// Create a copy of LeaveType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveTypeCopyWith<_LeaveType> get copyWith => __$LeaveTypeCopyWithImpl<_LeaveType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveType&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.leaveTypeName, leaveTypeName) || other.leaveTypeName == leaveTypeName)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.maximumDays, maximumDays) || other.maximumDays == maximumDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveTypeId,leaveTypeName,isPaid,maximumDays);

@override
String toString() {
  return 'LeaveType(leaveTypeId: $leaveTypeId, leaveTypeName: $leaveTypeName, isPaid: $isPaid, maximumDays: $maximumDays)';
}


}

/// @nodoc
abstract mixin class _$LeaveTypeCopyWith<$Res> implements $LeaveTypeCopyWith<$Res> {
  factory _$LeaveTypeCopyWith(_LeaveType value, $Res Function(_LeaveType) _then) = __$LeaveTypeCopyWithImpl;
@override @useResult
$Res call({
 int leaveTypeId, String leaveTypeName, bool isPaid, int maximumDays
});




}
/// @nodoc
class __$LeaveTypeCopyWithImpl<$Res>
    implements _$LeaveTypeCopyWith<$Res> {
  __$LeaveTypeCopyWithImpl(this._self, this._then);

  final _LeaveType _self;
  final $Res Function(_LeaveType) _then;

/// Create a copy of LeaveType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveTypeId = null,Object? leaveTypeName = null,Object? isPaid = null,Object? maximumDays = null,}) {
  return _then(_LeaveType(
leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as int,leaveTypeName: null == leaveTypeName ? _self.leaveTypeName : leaveTypeName // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,maximumDays: null == maximumDays ? _self.maximumDays : maximumDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
