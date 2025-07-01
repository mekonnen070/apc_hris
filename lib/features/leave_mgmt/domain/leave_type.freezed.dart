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

 String get typeId; String get typeName; int get minimumLeave; int get increment; int get incrementingByYear; int get maximumLeave; bool get enabled; String get entryBy; DateTime get entryDate; List<dynamic> get leaves;
/// Create a copy of LeaveType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveTypeCopyWith<LeaveType> get copyWith => _$LeaveTypeCopyWithImpl<LeaveType>(this as LeaveType, _$identity);

  /// Serializes this LeaveType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveType&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.minimumLeave, minimumLeave) || other.minimumLeave == minimumLeave)&&(identical(other.increment, increment) || other.increment == increment)&&(identical(other.incrementingByYear, incrementingByYear) || other.incrementingByYear == incrementingByYear)&&(identical(other.maximumLeave, maximumLeave) || other.maximumLeave == maximumLeave)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&const DeepCollectionEquality().equals(other.leaves, leaves));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,typeId,typeName,minimumLeave,increment,incrementingByYear,maximumLeave,enabled,entryBy,entryDate,const DeepCollectionEquality().hash(leaves));

@override
String toString() {
  return 'LeaveType(typeId: $typeId, typeName: $typeName, minimumLeave: $minimumLeave, increment: $increment, incrementingByYear: $incrementingByYear, maximumLeave: $maximumLeave, enabled: $enabled, entryBy: $entryBy, entryDate: $entryDate, leaves: $leaves)';
}


}

/// @nodoc
abstract mixin class $LeaveTypeCopyWith<$Res>  {
  factory $LeaveTypeCopyWith(LeaveType value, $Res Function(LeaveType) _then) = _$LeaveTypeCopyWithImpl;
@useResult
$Res call({
 String typeId, String typeName, int minimumLeave, int increment, int incrementingByYear, int maximumLeave, bool enabled, String entryBy, DateTime entryDate, List<dynamic> leaves
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
@pragma('vm:prefer-inline') @override $Res call({Object? typeId = null,Object? typeName = null,Object? minimumLeave = null,Object? increment = null,Object? incrementingByYear = null,Object? maximumLeave = null,Object? enabled = null,Object? entryBy = null,Object? entryDate = null,Object? leaves = null,}) {
  return _then(_self.copyWith(
typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as String,typeName: null == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String,minimumLeave: null == minimumLeave ? _self.minimumLeave : minimumLeave // ignore: cast_nullable_to_non_nullable
as int,increment: null == increment ? _self.increment : increment // ignore: cast_nullable_to_non_nullable
as int,incrementingByYear: null == incrementingByYear ? _self.incrementingByYear : incrementingByYear // ignore: cast_nullable_to_non_nullable
as int,maximumLeave: null == maximumLeave ? _self.maximumLeave : maximumLeave // ignore: cast_nullable_to_non_nullable
as int,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,entryBy: null == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String,entryDate: null == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime,leaves: null == leaves ? _self.leaves : leaves // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LeaveType implements LeaveType {
   _LeaveType({required this.typeId, required this.typeName, required this.minimumLeave, required this.increment, required this.incrementingByYear, required this.maximumLeave, required this.enabled, required this.entryBy, required this.entryDate, required final  List<dynamic> leaves}): _leaves = leaves;
  factory _LeaveType.fromJson(Map<String, dynamic> json) => _$LeaveTypeFromJson(json);

@override final  String typeId;
@override final  String typeName;
@override final  int minimumLeave;
@override final  int increment;
@override final  int incrementingByYear;
@override final  int maximumLeave;
@override final  bool enabled;
@override final  String entryBy;
@override final  DateTime entryDate;
 final  List<dynamic> _leaves;
@override List<dynamic> get leaves {
  if (_leaves is EqualUnmodifiableListView) return _leaves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leaves);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveType&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.minimumLeave, minimumLeave) || other.minimumLeave == minimumLeave)&&(identical(other.increment, increment) || other.increment == increment)&&(identical(other.incrementingByYear, incrementingByYear) || other.incrementingByYear == incrementingByYear)&&(identical(other.maximumLeave, maximumLeave) || other.maximumLeave == maximumLeave)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&const DeepCollectionEquality().equals(other._leaves, _leaves));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,typeId,typeName,minimumLeave,increment,incrementingByYear,maximumLeave,enabled,entryBy,entryDate,const DeepCollectionEquality().hash(_leaves));

@override
String toString() {
  return 'LeaveType(typeId: $typeId, typeName: $typeName, minimumLeave: $minimumLeave, increment: $increment, incrementingByYear: $incrementingByYear, maximumLeave: $maximumLeave, enabled: $enabled, entryBy: $entryBy, entryDate: $entryDate, leaves: $leaves)';
}


}

/// @nodoc
abstract mixin class _$LeaveTypeCopyWith<$Res> implements $LeaveTypeCopyWith<$Res> {
  factory _$LeaveTypeCopyWith(_LeaveType value, $Res Function(_LeaveType) _then) = __$LeaveTypeCopyWithImpl;
@override @useResult
$Res call({
 String typeId, String typeName, int minimumLeave, int increment, int incrementingByYear, int maximumLeave, bool enabled, String entryBy, DateTime entryDate, List<dynamic> leaves
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
@override @pragma('vm:prefer-inline') $Res call({Object? typeId = null,Object? typeName = null,Object? minimumLeave = null,Object? increment = null,Object? incrementingByYear = null,Object? maximumLeave = null,Object? enabled = null,Object? entryBy = null,Object? entryDate = null,Object? leaves = null,}) {
  return _then(_LeaveType(
typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as String,typeName: null == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String,minimumLeave: null == minimumLeave ? _self.minimumLeave : minimumLeave // ignore: cast_nullable_to_non_nullable
as int,increment: null == increment ? _self.increment : increment // ignore: cast_nullable_to_non_nullable
as int,incrementingByYear: null == incrementingByYear ? _self.incrementingByYear : incrementingByYear // ignore: cast_nullable_to_non_nullable
as int,maximumLeave: null == maximumLeave ? _self.maximumLeave : maximumLeave // ignore: cast_nullable_to_non_nullable
as int,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,entryBy: null == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String,entryDate: null == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime,leaves: null == leaves ? _self._leaves : leaves // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

// dart format on
