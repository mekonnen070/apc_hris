// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_experience_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeExperienceModel {

 String? get experienceId; String get employeeId;// C# is nullable, likely required for admin adding
 String? get organization; OrganizationType get organizationType;// C# 'Organizations'
 String? get position; String get responsibilities; ProficiencyLevel get proficiencyLevel; DateTime get joinDate; DateTime? get separationDate;// C# is not nullable, but often can be for current job
 String? get separationNotes; String? get entryBy; DateTime? get entryDate;
/// Create a copy of EmployeeExperienceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeExperienceModelCopyWith<EmployeeExperienceModel> get copyWith => _$EmployeeExperienceModelCopyWithImpl<EmployeeExperienceModel>(this as EmployeeExperienceModel, _$identity);

  /// Serializes this EmployeeExperienceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeExperienceModel&&(identical(other.experienceId, experienceId) || other.experienceId == experienceId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.organizationType, organizationType) || other.organizationType == organizationType)&&(identical(other.position, position) || other.position == position)&&(identical(other.responsibilities, responsibilities) || other.responsibilities == responsibilities)&&(identical(other.proficiencyLevel, proficiencyLevel) || other.proficiencyLevel == proficiencyLevel)&&(identical(other.joinDate, joinDate) || other.joinDate == joinDate)&&(identical(other.separationDate, separationDate) || other.separationDate == separationDate)&&(identical(other.separationNotes, separationNotes) || other.separationNotes == separationNotes)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,experienceId,employeeId,organization,organizationType,position,responsibilities,proficiencyLevel,joinDate,separationDate,separationNotes,entryBy,entryDate);

@override
String toString() {
  return 'EmployeeExperienceModel(experienceId: $experienceId, employeeId: $employeeId, organization: $organization, organizationType: $organizationType, position: $position, responsibilities: $responsibilities, proficiencyLevel: $proficiencyLevel, joinDate: $joinDate, separationDate: $separationDate, separationNotes: $separationNotes, entryBy: $entryBy, entryDate: $entryDate)';
}


}

/// @nodoc
abstract mixin class $EmployeeExperienceModelCopyWith<$Res>  {
  factory $EmployeeExperienceModelCopyWith(EmployeeExperienceModel value, $Res Function(EmployeeExperienceModel) _then) = _$EmployeeExperienceModelCopyWithImpl;
@useResult
$Res call({
 String? experienceId, String employeeId, String? organization, OrganizationType organizationType, String? position, String responsibilities, ProficiencyLevel proficiencyLevel, DateTime joinDate, DateTime? separationDate, String? separationNotes, String? entryBy, DateTime? entryDate
});




}
/// @nodoc
class _$EmployeeExperienceModelCopyWithImpl<$Res>
    implements $EmployeeExperienceModelCopyWith<$Res> {
  _$EmployeeExperienceModelCopyWithImpl(this._self, this._then);

  final EmployeeExperienceModel _self;
  final $Res Function(EmployeeExperienceModel) _then;

/// Create a copy of EmployeeExperienceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? experienceId = freezed,Object? employeeId = null,Object? organization = freezed,Object? organizationType = null,Object? position = freezed,Object? responsibilities = null,Object? proficiencyLevel = null,Object? joinDate = null,Object? separationDate = freezed,Object? separationNotes = freezed,Object? entryBy = freezed,Object? entryDate = freezed,}) {
  return _then(_self.copyWith(
experienceId: freezed == experienceId ? _self.experienceId : experienceId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,organizationType: null == organizationType ? _self.organizationType : organizationType // ignore: cast_nullable_to_non_nullable
as OrganizationType,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,responsibilities: null == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as String,proficiencyLevel: null == proficiencyLevel ? _self.proficiencyLevel : proficiencyLevel // ignore: cast_nullable_to_non_nullable
as ProficiencyLevel,joinDate: null == joinDate ? _self.joinDate : joinDate // ignore: cast_nullable_to_non_nullable
as DateTime,separationDate: freezed == separationDate ? _self.separationDate : separationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,separationNotes: freezed == separationNotes ? _self.separationNotes : separationNotes // ignore: cast_nullable_to_non_nullable
as String?,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EmployeeExperienceModel implements EmployeeExperienceModel {
  const _EmployeeExperienceModel({this.experienceId, required this.employeeId, this.organization, required this.organizationType, this.position, this.responsibilities = '', this.proficiencyLevel = ProficiencyLevel.beginner, required this.joinDate, this.separationDate, this.separationNotes, this.entryBy, this.entryDate});
  factory _EmployeeExperienceModel.fromJson(Map<String, dynamic> json) => _$EmployeeExperienceModelFromJson(json);

@override final  String? experienceId;
@override final  String employeeId;
// C# is nullable, likely required for admin adding
@override final  String? organization;
@override final  OrganizationType organizationType;
// C# 'Organizations'
@override final  String? position;
@override@JsonKey() final  String responsibilities;
@override@JsonKey() final  ProficiencyLevel proficiencyLevel;
@override final  DateTime joinDate;
@override final  DateTime? separationDate;
// C# is not nullable, but often can be for current job
@override final  String? separationNotes;
@override final  String? entryBy;
@override final  DateTime? entryDate;

/// Create a copy of EmployeeExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeExperienceModelCopyWith<_EmployeeExperienceModel> get copyWith => __$EmployeeExperienceModelCopyWithImpl<_EmployeeExperienceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeExperienceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeExperienceModel&&(identical(other.experienceId, experienceId) || other.experienceId == experienceId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.organizationType, organizationType) || other.organizationType == organizationType)&&(identical(other.position, position) || other.position == position)&&(identical(other.responsibilities, responsibilities) || other.responsibilities == responsibilities)&&(identical(other.proficiencyLevel, proficiencyLevel) || other.proficiencyLevel == proficiencyLevel)&&(identical(other.joinDate, joinDate) || other.joinDate == joinDate)&&(identical(other.separationDate, separationDate) || other.separationDate == separationDate)&&(identical(other.separationNotes, separationNotes) || other.separationNotes == separationNotes)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,experienceId,employeeId,organization,organizationType,position,responsibilities,proficiencyLevel,joinDate,separationDate,separationNotes,entryBy,entryDate);

@override
String toString() {
  return 'EmployeeExperienceModel(experienceId: $experienceId, employeeId: $employeeId, organization: $organization, organizationType: $organizationType, position: $position, responsibilities: $responsibilities, proficiencyLevel: $proficiencyLevel, joinDate: $joinDate, separationDate: $separationDate, separationNotes: $separationNotes, entryBy: $entryBy, entryDate: $entryDate)';
}


}

/// @nodoc
abstract mixin class _$EmployeeExperienceModelCopyWith<$Res> implements $EmployeeExperienceModelCopyWith<$Res> {
  factory _$EmployeeExperienceModelCopyWith(_EmployeeExperienceModel value, $Res Function(_EmployeeExperienceModel) _then) = __$EmployeeExperienceModelCopyWithImpl;
@override @useResult
$Res call({
 String? experienceId, String employeeId, String? organization, OrganizationType organizationType, String? position, String responsibilities, ProficiencyLevel proficiencyLevel, DateTime joinDate, DateTime? separationDate, String? separationNotes, String? entryBy, DateTime? entryDate
});




}
/// @nodoc
class __$EmployeeExperienceModelCopyWithImpl<$Res>
    implements _$EmployeeExperienceModelCopyWith<$Res> {
  __$EmployeeExperienceModelCopyWithImpl(this._self, this._then);

  final _EmployeeExperienceModel _self;
  final $Res Function(_EmployeeExperienceModel) _then;

/// Create a copy of EmployeeExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? experienceId = freezed,Object? employeeId = null,Object? organization = freezed,Object? organizationType = null,Object? position = freezed,Object? responsibilities = null,Object? proficiencyLevel = null,Object? joinDate = null,Object? separationDate = freezed,Object? separationNotes = freezed,Object? entryBy = freezed,Object? entryDate = freezed,}) {
  return _then(_EmployeeExperienceModel(
experienceId: freezed == experienceId ? _self.experienceId : experienceId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,organizationType: null == organizationType ? _self.organizationType : organizationType // ignore: cast_nullable_to_non_nullable
as OrganizationType,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,responsibilities: null == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as String,proficiencyLevel: null == proficiencyLevel ? _self.proficiencyLevel : proficiencyLevel // ignore: cast_nullable_to_non_nullable
as ProficiencyLevel,joinDate: null == joinDate ? _self.joinDate : joinDate // ignore: cast_nullable_to_non_nullable
as DateTime,separationDate: freezed == separationDate ? _self.separationDate : separationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,separationNotes: freezed == separationNotes ? _self.separationNotes : separationNotes // ignore: cast_nullable_to_non_nullable
as String?,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
