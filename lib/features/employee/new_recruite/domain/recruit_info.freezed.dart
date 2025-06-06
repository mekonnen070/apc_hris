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

 int? get id; int get announcementId; String get firstName; String get middleName; String get lastName; DateTime get dateOfBirth; int get age; Gender get gender; MaritalStatus get maritalStatus; int get numberOfChildren; String get nationality; Religion get religion; BloodGroup get bloodGroup; String get photoPath; String get woreda; String get kebele; String get houseNumber; String get phoneNumber; String? get signature;
/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecruitInfoCopyWith<RecruitInfo> get copyWith => _$RecruitInfoCopyWithImpl<RecruitInfo>(this as RecruitInfo, _$identity);

  /// Serializes this RecruitInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecruitInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus)&&(identical(other.numberOfChildren, numberOfChildren) || other.numberOfChildren == numberOfChildren)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.religion, religion) || other.religion == religion)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.woreda, woreda) || other.woreda == woreda)&&(identical(other.kebele, kebele) || other.kebele == kebele)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.signature, signature) || other.signature == signature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,announcementId,firstName,middleName,lastName,dateOfBirth,age,gender,maritalStatus,numberOfChildren,nationality,religion,bloodGroup,photoPath,woreda,kebele,houseNumber,phoneNumber,signature]);

@override
String toString() {
  return 'RecruitInfo(id: $id, announcementId: $announcementId, firstName: $firstName, middleName: $middleName, lastName: $lastName, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, maritalStatus: $maritalStatus, numberOfChildren: $numberOfChildren, nationality: $nationality, religion: $religion, bloodGroup: $bloodGroup, photoPath: $photoPath, woreda: $woreda, kebele: $kebele, houseNumber: $houseNumber, phoneNumber: $phoneNumber, signature: $signature)';
}


}

/// @nodoc
abstract mixin class $RecruitInfoCopyWith<$Res>  {
  factory $RecruitInfoCopyWith(RecruitInfo value, $Res Function(RecruitInfo) _then) = _$RecruitInfoCopyWithImpl;
@useResult
$Res call({
 int? id, int announcementId, String firstName, String middleName, String lastName, DateTime dateOfBirth, int age, Gender gender, MaritalStatus maritalStatus, int numberOfChildren, String nationality, Religion religion, BloodGroup bloodGroup, String photoPath, String woreda, String kebele, String houseNumber, String phoneNumber, String? signature
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? announcementId = null,Object? firstName = null,Object? middleName = null,Object? lastName = null,Object? dateOfBirth = null,Object? age = null,Object? gender = null,Object? maritalStatus = null,Object? numberOfChildren = null,Object? nationality = null,Object? religion = null,Object? bloodGroup = null,Object? photoPath = null,Object? woreda = null,Object? kebele = null,Object? houseNumber = null,Object? phoneNumber = null,Object? signature = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,announcementId: null == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,middleName: null == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,maritalStatus: null == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as MaritalStatus,numberOfChildren: null == numberOfChildren ? _self.numberOfChildren : numberOfChildren // ignore: cast_nullable_to_non_nullable
as int,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,religion: null == religion ? _self.religion : religion // ignore: cast_nullable_to_non_nullable
as Religion,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as BloodGroup,photoPath: null == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String,woreda: null == woreda ? _self.woreda : woreda // ignore: cast_nullable_to_non_nullable
as String,kebele: null == kebele ? _self.kebele : kebele // ignore: cast_nullable_to_non_nullable
as String,houseNumber: null == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecruitInfo implements RecruitInfo {
  const _RecruitInfo({this.id, required this.announcementId, required this.firstName, required this.middleName, required this.lastName, required this.dateOfBirth, required this.age, required this.gender, required this.maritalStatus, required this.numberOfChildren, required this.nationality, required this.religion, required this.bloodGroup, required this.photoPath, required this.woreda, required this.kebele, required this.houseNumber, required this.phoneNumber, this.signature});
  factory _RecruitInfo.fromJson(Map<String, dynamic> json) => _$RecruitInfoFromJson(json);

@override final  int? id;
@override final  int announcementId;
@override final  String firstName;
@override final  String middleName;
@override final  String lastName;
@override final  DateTime dateOfBirth;
@override final  int age;
@override final  Gender gender;
@override final  MaritalStatus maritalStatus;
@override final  int numberOfChildren;
@override final  String nationality;
@override final  Religion religion;
@override final  BloodGroup bloodGroup;
@override final  String photoPath;
@override final  String woreda;
@override final  String kebele;
@override final  String houseNumber;
@override final  String phoneNumber;
@override final  String? signature;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecruitInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus)&&(identical(other.numberOfChildren, numberOfChildren) || other.numberOfChildren == numberOfChildren)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.religion, religion) || other.religion == religion)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.woreda, woreda) || other.woreda == woreda)&&(identical(other.kebele, kebele) || other.kebele == kebele)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.signature, signature) || other.signature == signature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,announcementId,firstName,middleName,lastName,dateOfBirth,age,gender,maritalStatus,numberOfChildren,nationality,religion,bloodGroup,photoPath,woreda,kebele,houseNumber,phoneNumber,signature]);

@override
String toString() {
  return 'RecruitInfo(id: $id, announcementId: $announcementId, firstName: $firstName, middleName: $middleName, lastName: $lastName, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, maritalStatus: $maritalStatus, numberOfChildren: $numberOfChildren, nationality: $nationality, religion: $religion, bloodGroup: $bloodGroup, photoPath: $photoPath, woreda: $woreda, kebele: $kebele, houseNumber: $houseNumber, phoneNumber: $phoneNumber, signature: $signature)';
}


}

/// @nodoc
abstract mixin class _$RecruitInfoCopyWith<$Res> implements $RecruitInfoCopyWith<$Res> {
  factory _$RecruitInfoCopyWith(_RecruitInfo value, $Res Function(_RecruitInfo) _then) = __$RecruitInfoCopyWithImpl;
@override @useResult
$Res call({
 int? id, int announcementId, String firstName, String middleName, String lastName, DateTime dateOfBirth, int age, Gender gender, MaritalStatus maritalStatus, int numberOfChildren, String nationality, Religion religion, BloodGroup bloodGroup, String photoPath, String woreda, String kebele, String houseNumber, String phoneNumber, String? signature
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? announcementId = null,Object? firstName = null,Object? middleName = null,Object? lastName = null,Object? dateOfBirth = null,Object? age = null,Object? gender = null,Object? maritalStatus = null,Object? numberOfChildren = null,Object? nationality = null,Object? religion = null,Object? bloodGroup = null,Object? photoPath = null,Object? woreda = null,Object? kebele = null,Object? houseNumber = null,Object? phoneNumber = null,Object? signature = freezed,}) {
  return _then(_RecruitInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,announcementId: null == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,middleName: null == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,maritalStatus: null == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as MaritalStatus,numberOfChildren: null == numberOfChildren ? _self.numberOfChildren : numberOfChildren // ignore: cast_nullable_to_non_nullable
as int,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,religion: null == religion ? _self.religion : religion // ignore: cast_nullable_to_non_nullable
as Religion,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as BloodGroup,photoPath: null == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String,woreda: null == woreda ? _self.woreda : woreda // ignore: cast_nullable_to_non_nullable
as String,kebele: null == kebele ? _self.kebele : kebele // ignore: cast_nullable_to_non_nullable
as String,houseNumber: null == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
