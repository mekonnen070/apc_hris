// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recruit_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecruitInfo {

 String get recruitId; String get announcementId; String get firstName; String get fatherName; String? get grandName; Gender get gender; DateTime get birthDate; String? get motherName; String get mobile; String? get email; Country? get nationality;
/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecruitInfoCopyWith<RecruitInfo> get copyWith => _$RecruitInfoCopyWithImpl<RecruitInfo>(this as RecruitInfo, _$identity);

  /// Serializes this RecruitInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecruitInfo&&(identical(other.recruitId, recruitId) || other.recruitId == recruitId)&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.grandName, grandName) || other.grandName == grandName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationality, nationality) || other.nationality == nationality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recruitId,announcementId,firstName,fatherName,grandName,gender,birthDate,motherName,mobile,email,nationality);

@override
String toString() {
  return 'RecruitInfo(recruitId: $recruitId, announcementId: $announcementId, firstName: $firstName, fatherName: $fatherName, grandName: $grandName, gender: $gender, birthDate: $birthDate, motherName: $motherName, mobile: $mobile, email: $email, nationality: $nationality)';
}


}

/// @nodoc
abstract mixin class $RecruitInfoCopyWith<$Res>  {
  factory $RecruitInfoCopyWith(RecruitInfo value, $Res Function(RecruitInfo) _then) = _$RecruitInfoCopyWithImpl;
@useResult
$Res call({
 String recruitId, String announcementId, String firstName, String fatherName, String? grandName, Gender gender, DateTime birthDate, String? motherName, String mobile, String? email, Country? nationality
});




}
/// @nodoc
class _$RecruitInfoCopyWithImpl<$Res>
    implements $RecruitInfoCopyWith<$Res> {
  _$RecruitInfoCopyWithImpl(this._self, this._then);

  final RecruitInfo _self;
  final $Res Function(RecruitInfo) _then;

/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recruitId = null,Object? announcementId = null,Object? firstName = null,Object? fatherName = null,Object? grandName = freezed,Object? gender = null,Object? birthDate = null,Object? motherName = freezed,Object? mobile = null,Object? email = freezed,Object? nationality = freezed,}) {
  return _then(_self.copyWith(
recruitId: null == recruitId ? _self.recruitId : recruitId // ignore: cast_nullable_to_non_nullable
as String,announcementId: null == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,grandName: freezed == grandName ? _self.grandName : grandName // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as Country?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecruitInfo implements RecruitInfo {
  const _RecruitInfo({required this.recruitId, required this.announcementId, required this.firstName, required this.fatherName, this.grandName, required this.gender, required this.birthDate, this.motherName, required this.mobile, this.email, this.nationality});
  factory _RecruitInfo.fromJson(Map<String, dynamic> json) => _$RecruitInfoFromJson(json);

@override final  String recruitId;
@override final  String announcementId;
@override final  String firstName;
@override final  String fatherName;
@override final  String? grandName;
@override final  Gender gender;
@override final  DateTime birthDate;
@override final  String? motherName;
@override final  String mobile;
@override final  String? email;
@override final  Country? nationality;

/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecruitInfoCopyWith<_RecruitInfo> get copyWith => __$RecruitInfoCopyWithImpl<_RecruitInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecruitInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecruitInfo&&(identical(other.recruitId, recruitId) || other.recruitId == recruitId)&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.grandName, grandName) || other.grandName == grandName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationality, nationality) || other.nationality == nationality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recruitId,announcementId,firstName,fatherName,grandName,gender,birthDate,motherName,mobile,email,nationality);

@override
String toString() {
  return 'RecruitInfo(recruitId: $recruitId, announcementId: $announcementId, firstName: $firstName, fatherName: $fatherName, grandName: $grandName, gender: $gender, birthDate: $birthDate, motherName: $motherName, mobile: $mobile, email: $email, nationality: $nationality)';
}


}

/// @nodoc
abstract mixin class _$RecruitInfoCopyWith<$Res> implements $RecruitInfoCopyWith<$Res> {
  factory _$RecruitInfoCopyWith(_RecruitInfo value, $Res Function(_RecruitInfo) _then) = __$RecruitInfoCopyWithImpl;
@override @useResult
$Res call({
 String recruitId, String announcementId, String firstName, String fatherName, String? grandName, Gender gender, DateTime birthDate, String? motherName, String mobile, String? email, Country? nationality
});




}
/// @nodoc
class __$RecruitInfoCopyWithImpl<$Res>
    implements _$RecruitInfoCopyWith<$Res> {
  __$RecruitInfoCopyWithImpl(this._self, this._then);

  final _RecruitInfo _self;
  final $Res Function(_RecruitInfo) _then;

/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recruitId = null,Object? announcementId = null,Object? firstName = null,Object? fatherName = null,Object? grandName = freezed,Object? gender = null,Object? birthDate = null,Object? motherName = freezed,Object? mobile = null,Object? email = freezed,Object? nationality = freezed,}) {
  return _then(_RecruitInfo(
recruitId: null == recruitId ? _self.recruitId : recruitId // ignore: cast_nullable_to_non_nullable
as String,announcementId: null == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,grandName: freezed == grandName ? _self.grandName : grandName // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as Country?,
  ));
}


}

// dart format on
