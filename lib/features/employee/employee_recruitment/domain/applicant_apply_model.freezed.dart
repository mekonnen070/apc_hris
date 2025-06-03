// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicant_apply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApplicantApplyModel {

 int? get applicantId;@JsonKey(name: 'appliedTo') String get appliedToVacancyId; String get firstName; String get lastName; String? get middleName; String get email; String get phoneNumber; DateTime get dateOfBirth; Gender get gender;// Using existing Gender enum
 String get address; String get nationality;@JsonKey(includeFromJson: false, includeToJson: false) File? get resumeFile;// For local file picking
 String? get resumePath;// To store URL/path from backend after upload
 String? get identificationNumber; IdentificationType get identificationType;// Fields related to recruitment process stages (populated by HR/System later)
 DateTime? get interviewScheduledTime; String? get interviewerName; String? get interviewerFeedback; double? get interviewScore;// Using double for decimal
 DateTime? get examScheduledTime; String? get examinerName; String? get examinerFeedback; double? get examScore;// Using double for decimal
 bool get backgroundCheck; String? get backgroundCheckRemark; bool get referenceCheck; String? get referenceCheckRemark; bool get medicalCheck; String? get medicalCheckRemark; bool get finalCheck;// e.g. final approval
 String? get finalCheckRemark; bool get isOnBoarding;// From C#
 String? get isOnBoardingRemark;// From C#
 RecruitmentStatus get status; DateTime? get entryDate;// Date of application submission
 String? get entryBy;
/// Create a copy of ApplicantApplyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicantApplyModelCopyWith<ApplicantApplyModel> get copyWith => _$ApplicantApplyModelCopyWithImpl<ApplicantApplyModel>(this as ApplicantApplyModel, _$identity);

  /// Serializes this ApplicantApplyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicantApplyModel&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.appliedToVacancyId, appliedToVacancyId) || other.appliedToVacancyId == appliedToVacancyId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.resumeFile, resumeFile) || other.resumeFile == resumeFile)&&(identical(other.resumePath, resumePath) || other.resumePath == resumePath)&&(identical(other.identificationNumber, identificationNumber) || other.identificationNumber == identificationNumber)&&(identical(other.identificationType, identificationType) || other.identificationType == identificationType)&&(identical(other.interviewScheduledTime, interviewScheduledTime) || other.interviewScheduledTime == interviewScheduledTime)&&(identical(other.interviewerName, interviewerName) || other.interviewerName == interviewerName)&&(identical(other.interviewerFeedback, interviewerFeedback) || other.interviewerFeedback == interviewerFeedback)&&(identical(other.interviewScore, interviewScore) || other.interviewScore == interviewScore)&&(identical(other.examScheduledTime, examScheduledTime) || other.examScheduledTime == examScheduledTime)&&(identical(other.examinerName, examinerName) || other.examinerName == examinerName)&&(identical(other.examinerFeedback, examinerFeedback) || other.examinerFeedback == examinerFeedback)&&(identical(other.examScore, examScore) || other.examScore == examScore)&&(identical(other.backgroundCheck, backgroundCheck) || other.backgroundCheck == backgroundCheck)&&(identical(other.backgroundCheckRemark, backgroundCheckRemark) || other.backgroundCheckRemark == backgroundCheckRemark)&&(identical(other.referenceCheck, referenceCheck) || other.referenceCheck == referenceCheck)&&(identical(other.referenceCheckRemark, referenceCheckRemark) || other.referenceCheckRemark == referenceCheckRemark)&&(identical(other.medicalCheck, medicalCheck) || other.medicalCheck == medicalCheck)&&(identical(other.medicalCheckRemark, medicalCheckRemark) || other.medicalCheckRemark == medicalCheckRemark)&&(identical(other.finalCheck, finalCheck) || other.finalCheck == finalCheck)&&(identical(other.finalCheckRemark, finalCheckRemark) || other.finalCheckRemark == finalCheckRemark)&&(identical(other.isOnBoarding, isOnBoarding) || other.isOnBoarding == isOnBoarding)&&(identical(other.isOnBoardingRemark, isOnBoardingRemark) || other.isOnBoardingRemark == isOnBoardingRemark)&&(identical(other.status, status) || other.status == status)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,applicantId,appliedToVacancyId,firstName,lastName,middleName,email,phoneNumber,dateOfBirth,gender,address,nationality,resumeFile,resumePath,identificationNumber,identificationType,interviewScheduledTime,interviewerName,interviewerFeedback,interviewScore,examScheduledTime,examinerName,examinerFeedback,examScore,backgroundCheck,backgroundCheckRemark,referenceCheck,referenceCheckRemark,medicalCheck,medicalCheckRemark,finalCheck,finalCheckRemark,isOnBoarding,isOnBoardingRemark,status,entryDate,entryBy]);

@override
String toString() {
  return 'ApplicantApplyModel(applicantId: $applicantId, appliedToVacancyId: $appliedToVacancyId, firstName: $firstName, lastName: $lastName, middleName: $middleName, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, gender: $gender, address: $address, nationality: $nationality, resumeFile: $resumeFile, resumePath: $resumePath, identificationNumber: $identificationNumber, identificationType: $identificationType, interviewScheduledTime: $interviewScheduledTime, interviewerName: $interviewerName, interviewerFeedback: $interviewerFeedback, interviewScore: $interviewScore, examScheduledTime: $examScheduledTime, examinerName: $examinerName, examinerFeedback: $examinerFeedback, examScore: $examScore, backgroundCheck: $backgroundCheck, backgroundCheckRemark: $backgroundCheckRemark, referenceCheck: $referenceCheck, referenceCheckRemark: $referenceCheckRemark, medicalCheck: $medicalCheck, medicalCheckRemark: $medicalCheckRemark, finalCheck: $finalCheck, finalCheckRemark: $finalCheckRemark, isOnBoarding: $isOnBoarding, isOnBoardingRemark: $isOnBoardingRemark, status: $status, entryDate: $entryDate, entryBy: $entryBy)';
}


}

/// @nodoc
abstract mixin class $ApplicantApplyModelCopyWith<$Res>  {
  factory $ApplicantApplyModelCopyWith(ApplicantApplyModel value, $Res Function(ApplicantApplyModel) _then) = _$ApplicantApplyModelCopyWithImpl;
@useResult
$Res call({
 int? applicantId,@JsonKey(name: 'appliedTo') String appliedToVacancyId, String firstName, String lastName, String? middleName, String email, String phoneNumber, DateTime dateOfBirth, Gender gender, String address, String nationality,@JsonKey(includeFromJson: false, includeToJson: false) File? resumeFile, String? resumePath, String? identificationNumber, IdentificationType identificationType, DateTime? interviewScheduledTime, String? interviewerName, String? interviewerFeedback, double? interviewScore, DateTime? examScheduledTime, String? examinerName, String? examinerFeedback, double? examScore, bool backgroundCheck, String? backgroundCheckRemark, bool referenceCheck, String? referenceCheckRemark, bool medicalCheck, String? medicalCheckRemark, bool finalCheck, String? finalCheckRemark, bool isOnBoarding, String? isOnBoardingRemark, RecruitmentStatus status, DateTime? entryDate, String? entryBy
});




}
/// @nodoc
class _$ApplicantApplyModelCopyWithImpl<$Res>
    implements $ApplicantApplyModelCopyWith<$Res> {
  _$ApplicantApplyModelCopyWithImpl(this._self, this._then);

  final ApplicantApplyModel _self;
  final $Res Function(ApplicantApplyModel) _then;

/// Create a copy of ApplicantApplyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicantId = freezed,Object? appliedToVacancyId = null,Object? firstName = null,Object? lastName = null,Object? middleName = freezed,Object? email = null,Object? phoneNumber = null,Object? dateOfBirth = null,Object? gender = null,Object? address = null,Object? nationality = null,Object? resumeFile = freezed,Object? resumePath = freezed,Object? identificationNumber = freezed,Object? identificationType = null,Object? interviewScheduledTime = freezed,Object? interviewerName = freezed,Object? interviewerFeedback = freezed,Object? interviewScore = freezed,Object? examScheduledTime = freezed,Object? examinerName = freezed,Object? examinerFeedback = freezed,Object? examScore = freezed,Object? backgroundCheck = null,Object? backgroundCheckRemark = freezed,Object? referenceCheck = null,Object? referenceCheckRemark = freezed,Object? medicalCheck = null,Object? medicalCheckRemark = freezed,Object? finalCheck = null,Object? finalCheckRemark = freezed,Object? isOnBoarding = null,Object? isOnBoardingRemark = freezed,Object? status = null,Object? entryDate = freezed,Object? entryBy = freezed,}) {
  return _then(_self.copyWith(
applicantId: freezed == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as int?,appliedToVacancyId: null == appliedToVacancyId ? _self.appliedToVacancyId : appliedToVacancyId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,resumeFile: freezed == resumeFile ? _self.resumeFile : resumeFile // ignore: cast_nullable_to_non_nullable
as File?,resumePath: freezed == resumePath ? _self.resumePath : resumePath // ignore: cast_nullable_to_non_nullable
as String?,identificationNumber: freezed == identificationNumber ? _self.identificationNumber : identificationNumber // ignore: cast_nullable_to_non_nullable
as String?,identificationType: null == identificationType ? _self.identificationType : identificationType // ignore: cast_nullable_to_non_nullable
as IdentificationType,interviewScheduledTime: freezed == interviewScheduledTime ? _self.interviewScheduledTime : interviewScheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime?,interviewerName: freezed == interviewerName ? _self.interviewerName : interviewerName // ignore: cast_nullable_to_non_nullable
as String?,interviewerFeedback: freezed == interviewerFeedback ? _self.interviewerFeedback : interviewerFeedback // ignore: cast_nullable_to_non_nullable
as String?,interviewScore: freezed == interviewScore ? _self.interviewScore : interviewScore // ignore: cast_nullable_to_non_nullable
as double?,examScheduledTime: freezed == examScheduledTime ? _self.examScheduledTime : examScheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime?,examinerName: freezed == examinerName ? _self.examinerName : examinerName // ignore: cast_nullable_to_non_nullable
as String?,examinerFeedback: freezed == examinerFeedback ? _self.examinerFeedback : examinerFeedback // ignore: cast_nullable_to_non_nullable
as String?,examScore: freezed == examScore ? _self.examScore : examScore // ignore: cast_nullable_to_non_nullable
as double?,backgroundCheck: null == backgroundCheck ? _self.backgroundCheck : backgroundCheck // ignore: cast_nullable_to_non_nullable
as bool,backgroundCheckRemark: freezed == backgroundCheckRemark ? _self.backgroundCheckRemark : backgroundCheckRemark // ignore: cast_nullable_to_non_nullable
as String?,referenceCheck: null == referenceCheck ? _self.referenceCheck : referenceCheck // ignore: cast_nullable_to_non_nullable
as bool,referenceCheckRemark: freezed == referenceCheckRemark ? _self.referenceCheckRemark : referenceCheckRemark // ignore: cast_nullable_to_non_nullable
as String?,medicalCheck: null == medicalCheck ? _self.medicalCheck : medicalCheck // ignore: cast_nullable_to_non_nullable
as bool,medicalCheckRemark: freezed == medicalCheckRemark ? _self.medicalCheckRemark : medicalCheckRemark // ignore: cast_nullable_to_non_nullable
as String?,finalCheck: null == finalCheck ? _self.finalCheck : finalCheck // ignore: cast_nullable_to_non_nullable
as bool,finalCheckRemark: freezed == finalCheckRemark ? _self.finalCheckRemark : finalCheckRemark // ignore: cast_nullable_to_non_nullable
as String?,isOnBoarding: null == isOnBoarding ? _self.isOnBoarding : isOnBoarding // ignore: cast_nullable_to_non_nullable
as bool,isOnBoardingRemark: freezed == isOnBoardingRemark ? _self.isOnBoardingRemark : isOnBoardingRemark // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecruitmentStatus,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ApplicantApplyModel implements ApplicantApplyModel {
  const _ApplicantApplyModel({this.applicantId, @JsonKey(name: 'appliedTo') required this.appliedToVacancyId, required this.firstName, required this.lastName, this.middleName, required this.email, required this.phoneNumber, required this.dateOfBirth, required this.gender, required this.address, required this.nationality, @JsonKey(includeFromJson: false, includeToJson: false) this.resumeFile, this.resumePath, this.identificationNumber, this.identificationType = IdentificationType.nationalId, this.interviewScheduledTime, this.interviewerName, this.interviewerFeedback, this.interviewScore, this.examScheduledTime, this.examinerName, this.examinerFeedback, this.examScore, this.backgroundCheck = false, this.backgroundCheckRemark, this.referenceCheck = false, this.referenceCheckRemark, this.medicalCheck = false, this.medicalCheckRemark, this.finalCheck = false, this.finalCheckRemark, this.isOnBoarding = false, this.isOnBoardingRemark, this.status = RecruitmentStatus.submitted, this.entryDate, this.entryBy});
  factory _ApplicantApplyModel.fromJson(Map<String, dynamic> json) => _$ApplicantApplyModelFromJson(json);

@override final  int? applicantId;
@override@JsonKey(name: 'appliedTo') final  String appliedToVacancyId;
@override final  String firstName;
@override final  String lastName;
@override final  String? middleName;
@override final  String email;
@override final  String phoneNumber;
@override final  DateTime dateOfBirth;
@override final  Gender gender;
// Using existing Gender enum
@override final  String address;
@override final  String nationality;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? resumeFile;
// For local file picking
@override final  String? resumePath;
// To store URL/path from backend after upload
@override final  String? identificationNumber;
@override@JsonKey() final  IdentificationType identificationType;
// Fields related to recruitment process stages (populated by HR/System later)
@override final  DateTime? interviewScheduledTime;
@override final  String? interviewerName;
@override final  String? interviewerFeedback;
@override final  double? interviewScore;
// Using double for decimal
@override final  DateTime? examScheduledTime;
@override final  String? examinerName;
@override final  String? examinerFeedback;
@override final  double? examScore;
// Using double for decimal
@override@JsonKey() final  bool backgroundCheck;
@override final  String? backgroundCheckRemark;
@override@JsonKey() final  bool referenceCheck;
@override final  String? referenceCheckRemark;
@override@JsonKey() final  bool medicalCheck;
@override final  String? medicalCheckRemark;
@override@JsonKey() final  bool finalCheck;
// e.g. final approval
@override final  String? finalCheckRemark;
@override@JsonKey() final  bool isOnBoarding;
// From C#
@override final  String? isOnBoardingRemark;
// From C#
@override@JsonKey() final  RecruitmentStatus status;
@override final  DateTime? entryDate;
// Date of application submission
@override final  String? entryBy;

/// Create a copy of ApplicantApplyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicantApplyModelCopyWith<_ApplicantApplyModel> get copyWith => __$ApplicantApplyModelCopyWithImpl<_ApplicantApplyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicantApplyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicantApplyModel&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.appliedToVacancyId, appliedToVacancyId) || other.appliedToVacancyId == appliedToVacancyId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.resumeFile, resumeFile) || other.resumeFile == resumeFile)&&(identical(other.resumePath, resumePath) || other.resumePath == resumePath)&&(identical(other.identificationNumber, identificationNumber) || other.identificationNumber == identificationNumber)&&(identical(other.identificationType, identificationType) || other.identificationType == identificationType)&&(identical(other.interviewScheduledTime, interviewScheduledTime) || other.interviewScheduledTime == interviewScheduledTime)&&(identical(other.interviewerName, interviewerName) || other.interviewerName == interviewerName)&&(identical(other.interviewerFeedback, interviewerFeedback) || other.interviewerFeedback == interviewerFeedback)&&(identical(other.interviewScore, interviewScore) || other.interviewScore == interviewScore)&&(identical(other.examScheduledTime, examScheduledTime) || other.examScheduledTime == examScheduledTime)&&(identical(other.examinerName, examinerName) || other.examinerName == examinerName)&&(identical(other.examinerFeedback, examinerFeedback) || other.examinerFeedback == examinerFeedback)&&(identical(other.examScore, examScore) || other.examScore == examScore)&&(identical(other.backgroundCheck, backgroundCheck) || other.backgroundCheck == backgroundCheck)&&(identical(other.backgroundCheckRemark, backgroundCheckRemark) || other.backgroundCheckRemark == backgroundCheckRemark)&&(identical(other.referenceCheck, referenceCheck) || other.referenceCheck == referenceCheck)&&(identical(other.referenceCheckRemark, referenceCheckRemark) || other.referenceCheckRemark == referenceCheckRemark)&&(identical(other.medicalCheck, medicalCheck) || other.medicalCheck == medicalCheck)&&(identical(other.medicalCheckRemark, medicalCheckRemark) || other.medicalCheckRemark == medicalCheckRemark)&&(identical(other.finalCheck, finalCheck) || other.finalCheck == finalCheck)&&(identical(other.finalCheckRemark, finalCheckRemark) || other.finalCheckRemark == finalCheckRemark)&&(identical(other.isOnBoarding, isOnBoarding) || other.isOnBoarding == isOnBoarding)&&(identical(other.isOnBoardingRemark, isOnBoardingRemark) || other.isOnBoardingRemark == isOnBoardingRemark)&&(identical(other.status, status) || other.status == status)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,applicantId,appliedToVacancyId,firstName,lastName,middleName,email,phoneNumber,dateOfBirth,gender,address,nationality,resumeFile,resumePath,identificationNumber,identificationType,interviewScheduledTime,interviewerName,interviewerFeedback,interviewScore,examScheduledTime,examinerName,examinerFeedback,examScore,backgroundCheck,backgroundCheckRemark,referenceCheck,referenceCheckRemark,medicalCheck,medicalCheckRemark,finalCheck,finalCheckRemark,isOnBoarding,isOnBoardingRemark,status,entryDate,entryBy]);

@override
String toString() {
  return 'ApplicantApplyModel(applicantId: $applicantId, appliedToVacancyId: $appliedToVacancyId, firstName: $firstName, lastName: $lastName, middleName: $middleName, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, gender: $gender, address: $address, nationality: $nationality, resumeFile: $resumeFile, resumePath: $resumePath, identificationNumber: $identificationNumber, identificationType: $identificationType, interviewScheduledTime: $interviewScheduledTime, interviewerName: $interviewerName, interviewerFeedback: $interviewerFeedback, interviewScore: $interviewScore, examScheduledTime: $examScheduledTime, examinerName: $examinerName, examinerFeedback: $examinerFeedback, examScore: $examScore, backgroundCheck: $backgroundCheck, backgroundCheckRemark: $backgroundCheckRemark, referenceCheck: $referenceCheck, referenceCheckRemark: $referenceCheckRemark, medicalCheck: $medicalCheck, medicalCheckRemark: $medicalCheckRemark, finalCheck: $finalCheck, finalCheckRemark: $finalCheckRemark, isOnBoarding: $isOnBoarding, isOnBoardingRemark: $isOnBoardingRemark, status: $status, entryDate: $entryDate, entryBy: $entryBy)';
}


}

/// @nodoc
abstract mixin class _$ApplicantApplyModelCopyWith<$Res> implements $ApplicantApplyModelCopyWith<$Res> {
  factory _$ApplicantApplyModelCopyWith(_ApplicantApplyModel value, $Res Function(_ApplicantApplyModel) _then) = __$ApplicantApplyModelCopyWithImpl;
@override @useResult
$Res call({
 int? applicantId,@JsonKey(name: 'appliedTo') String appliedToVacancyId, String firstName, String lastName, String? middleName, String email, String phoneNumber, DateTime dateOfBirth, Gender gender, String address, String nationality,@JsonKey(includeFromJson: false, includeToJson: false) File? resumeFile, String? resumePath, String? identificationNumber, IdentificationType identificationType, DateTime? interviewScheduledTime, String? interviewerName, String? interviewerFeedback, double? interviewScore, DateTime? examScheduledTime, String? examinerName, String? examinerFeedback, double? examScore, bool backgroundCheck, String? backgroundCheckRemark, bool referenceCheck, String? referenceCheckRemark, bool medicalCheck, String? medicalCheckRemark, bool finalCheck, String? finalCheckRemark, bool isOnBoarding, String? isOnBoardingRemark, RecruitmentStatus status, DateTime? entryDate, String? entryBy
});




}
/// @nodoc
class __$ApplicantApplyModelCopyWithImpl<$Res>
    implements _$ApplicantApplyModelCopyWith<$Res> {
  __$ApplicantApplyModelCopyWithImpl(this._self, this._then);

  final _ApplicantApplyModel _self;
  final $Res Function(_ApplicantApplyModel) _then;

/// Create a copy of ApplicantApplyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicantId = freezed,Object? appliedToVacancyId = null,Object? firstName = null,Object? lastName = null,Object? middleName = freezed,Object? email = null,Object? phoneNumber = null,Object? dateOfBirth = null,Object? gender = null,Object? address = null,Object? nationality = null,Object? resumeFile = freezed,Object? resumePath = freezed,Object? identificationNumber = freezed,Object? identificationType = null,Object? interviewScheduledTime = freezed,Object? interviewerName = freezed,Object? interviewerFeedback = freezed,Object? interviewScore = freezed,Object? examScheduledTime = freezed,Object? examinerName = freezed,Object? examinerFeedback = freezed,Object? examScore = freezed,Object? backgroundCheck = null,Object? backgroundCheckRemark = freezed,Object? referenceCheck = null,Object? referenceCheckRemark = freezed,Object? medicalCheck = null,Object? medicalCheckRemark = freezed,Object? finalCheck = null,Object? finalCheckRemark = freezed,Object? isOnBoarding = null,Object? isOnBoardingRemark = freezed,Object? status = null,Object? entryDate = freezed,Object? entryBy = freezed,}) {
  return _then(_ApplicantApplyModel(
applicantId: freezed == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as int?,appliedToVacancyId: null == appliedToVacancyId ? _self.appliedToVacancyId : appliedToVacancyId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,resumeFile: freezed == resumeFile ? _self.resumeFile : resumeFile // ignore: cast_nullable_to_non_nullable
as File?,resumePath: freezed == resumePath ? _self.resumePath : resumePath // ignore: cast_nullable_to_non_nullable
as String?,identificationNumber: freezed == identificationNumber ? _self.identificationNumber : identificationNumber // ignore: cast_nullable_to_non_nullable
as String?,identificationType: null == identificationType ? _self.identificationType : identificationType // ignore: cast_nullable_to_non_nullable
as IdentificationType,interviewScheduledTime: freezed == interviewScheduledTime ? _self.interviewScheduledTime : interviewScheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime?,interviewerName: freezed == interviewerName ? _self.interviewerName : interviewerName // ignore: cast_nullable_to_non_nullable
as String?,interviewerFeedback: freezed == interviewerFeedback ? _self.interviewerFeedback : interviewerFeedback // ignore: cast_nullable_to_non_nullable
as String?,interviewScore: freezed == interviewScore ? _self.interviewScore : interviewScore // ignore: cast_nullable_to_non_nullable
as double?,examScheduledTime: freezed == examScheduledTime ? _self.examScheduledTime : examScheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime?,examinerName: freezed == examinerName ? _self.examinerName : examinerName // ignore: cast_nullable_to_non_nullable
as String?,examinerFeedback: freezed == examinerFeedback ? _self.examinerFeedback : examinerFeedback // ignore: cast_nullable_to_non_nullable
as String?,examScore: freezed == examScore ? _self.examScore : examScore // ignore: cast_nullable_to_non_nullable
as double?,backgroundCheck: null == backgroundCheck ? _self.backgroundCheck : backgroundCheck // ignore: cast_nullable_to_non_nullable
as bool,backgroundCheckRemark: freezed == backgroundCheckRemark ? _self.backgroundCheckRemark : backgroundCheckRemark // ignore: cast_nullable_to_non_nullable
as String?,referenceCheck: null == referenceCheck ? _self.referenceCheck : referenceCheck // ignore: cast_nullable_to_non_nullable
as bool,referenceCheckRemark: freezed == referenceCheckRemark ? _self.referenceCheckRemark : referenceCheckRemark // ignore: cast_nullable_to_non_nullable
as String?,medicalCheck: null == medicalCheck ? _self.medicalCheck : medicalCheck // ignore: cast_nullable_to_non_nullable
as bool,medicalCheckRemark: freezed == medicalCheckRemark ? _self.medicalCheckRemark : medicalCheckRemark // ignore: cast_nullable_to_non_nullable
as String?,finalCheck: null == finalCheck ? _self.finalCheck : finalCheck // ignore: cast_nullable_to_non_nullable
as bool,finalCheckRemark: freezed == finalCheckRemark ? _self.finalCheckRemark : finalCheckRemark // ignore: cast_nullable_to_non_nullable
as String?,isOnBoarding: null == isOnBoarding ? _self.isOnBoarding : isOnBoarding // ignore: cast_nullable_to_non_nullable
as bool,isOnBoardingRemark: freezed == isOnBoardingRemark ? _self.isOnBoardingRemark : isOnBoardingRemark // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecruitmentStatus,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
