// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkExperience {

 String get id;// Unique identifier
 String get companyName; String get jobTitle; String? get responsibilities;// Could be a longer text
 DateTime get startDate; DateTime? get endDate;// Nullable if current job
@JsonKey(includeFromJson: false, includeToJson: false) File? get experienceLetterFile;// Local file before upload
 String? get experienceLetterUrl;
/// Create a copy of WorkExperience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkExperienceCopyWith<WorkExperience> get copyWith => _$WorkExperienceCopyWithImpl<WorkExperience>(this as WorkExperience, _$identity);

  /// Serializes this WorkExperience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkExperience&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.responsibilities, responsibilities) || other.responsibilities == responsibilities)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.experienceLetterFile, experienceLetterFile) || other.experienceLetterFile == experienceLetterFile)&&(identical(other.experienceLetterUrl, experienceLetterUrl) || other.experienceLetterUrl == experienceLetterUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,jobTitle,responsibilities,startDate,endDate,experienceLetterFile,experienceLetterUrl);

@override
String toString() {
  return 'WorkExperience(id: $id, companyName: $companyName, jobTitle: $jobTitle, responsibilities: $responsibilities, startDate: $startDate, endDate: $endDate, experienceLetterFile: $experienceLetterFile, experienceLetterUrl: $experienceLetterUrl)';
}


}

/// @nodoc
abstract mixin class $WorkExperienceCopyWith<$Res>  {
  factory $WorkExperienceCopyWith(WorkExperience value, $Res Function(WorkExperience) _then) = _$WorkExperienceCopyWithImpl;
@useResult
$Res call({
 String id, String companyName, String jobTitle, String? responsibilities, DateTime startDate, DateTime? endDate,@JsonKey(includeFromJson: false, includeToJson: false) File? experienceLetterFile, String? experienceLetterUrl
});




}
/// @nodoc
class _$WorkExperienceCopyWithImpl<$Res>
    implements $WorkExperienceCopyWith<$Res> {
  _$WorkExperienceCopyWithImpl(this._self, this._then);

  final WorkExperience _self;
  final $Res Function(WorkExperience) _then;

/// Create a copy of WorkExperience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyName = null,Object? jobTitle = null,Object? responsibilities = freezed,Object? startDate = null,Object? endDate = freezed,Object? experienceLetterFile = freezed,Object? experienceLetterUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,responsibilities: freezed == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,experienceLetterFile: freezed == experienceLetterFile ? _self.experienceLetterFile : experienceLetterFile // ignore: cast_nullable_to_non_nullable
as File?,experienceLetterUrl: freezed == experienceLetterUrl ? _self.experienceLetterUrl : experienceLetterUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WorkExperience implements WorkExperience {
   _WorkExperience({required this.id, required this.companyName, required this.jobTitle, this.responsibilities, required this.startDate, this.endDate, @JsonKey(includeFromJson: false, includeToJson: false) this.experienceLetterFile, this.experienceLetterUrl});
  factory _WorkExperience.fromJson(Map<String, dynamic> json) => _$WorkExperienceFromJson(json);

@override final  String id;
// Unique identifier
@override final  String companyName;
@override final  String jobTitle;
@override final  String? responsibilities;
// Could be a longer text
@override final  DateTime startDate;
@override final  DateTime? endDate;
// Nullable if current job
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? experienceLetterFile;
// Local file before upload
@override final  String? experienceLetterUrl;

/// Create a copy of WorkExperience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkExperienceCopyWith<_WorkExperience> get copyWith => __$WorkExperienceCopyWithImpl<_WorkExperience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkExperience&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.responsibilities, responsibilities) || other.responsibilities == responsibilities)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.experienceLetterFile, experienceLetterFile) || other.experienceLetterFile == experienceLetterFile)&&(identical(other.experienceLetterUrl, experienceLetterUrl) || other.experienceLetterUrl == experienceLetterUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,jobTitle,responsibilities,startDate,endDate,experienceLetterFile,experienceLetterUrl);

@override
String toString() {
  return 'WorkExperience(id: $id, companyName: $companyName, jobTitle: $jobTitle, responsibilities: $responsibilities, startDate: $startDate, endDate: $endDate, experienceLetterFile: $experienceLetterFile, experienceLetterUrl: $experienceLetterUrl)';
}


}

/// @nodoc
abstract mixin class _$WorkExperienceCopyWith<$Res> implements $WorkExperienceCopyWith<$Res> {
  factory _$WorkExperienceCopyWith(_WorkExperience value, $Res Function(_WorkExperience) _then) = __$WorkExperienceCopyWithImpl;
@override @useResult
$Res call({
 String id, String companyName, String jobTitle, String? responsibilities, DateTime startDate, DateTime? endDate,@JsonKey(includeFromJson: false, includeToJson: false) File? experienceLetterFile, String? experienceLetterUrl
});




}
/// @nodoc
class __$WorkExperienceCopyWithImpl<$Res>
    implements _$WorkExperienceCopyWith<$Res> {
  __$WorkExperienceCopyWithImpl(this._self, this._then);

  final _WorkExperience _self;
  final $Res Function(_WorkExperience) _then;

/// Create a copy of WorkExperience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyName = null,Object? jobTitle = null,Object? responsibilities = freezed,Object? startDate = null,Object? endDate = freezed,Object? experienceLetterFile = freezed,Object? experienceLetterUrl = freezed,}) {
  return _then(_WorkExperience(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,responsibilities: freezed == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,experienceLetterFile: freezed == experienceLetterFile ? _self.experienceLetterFile : experienceLetterFile // ignore: cast_nullable_to_non_nullable
as File?,experienceLetterUrl: freezed == experienceLetterUrl ? _self.experienceLetterUrl : experienceLetterUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
