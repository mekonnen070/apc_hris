// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeInfoModel {

// Identifying Information
 String get employeeId;// Primary Key, C# [Required]
 String? get title; String get firstName; String? get fatherName; String? get grandName;// Personal Details
 Gender get gender; DateTime get birthDate;// C# [Required] & [AgeValidation]
@JsonKey(includeFromJson: false, includeToJson: false) File? get photoFile;// Local file for upload
 String? get photoUrl;// Corresponds to C# PhotoPath, stores URL from backend
 String? get motherName;// C# MotherFullName
// Positional & Reporting Structure
 String get positionId;// Foreign key to CommissionDesignation
 String? get managerId;// Foreign key to another EmployeeInfo (self-referential)
// Contact & Address Details
 String get address1; String? get address2; String? get houseNumber; String get phone; String get mobile; String get email;// C# [Required]
// Other Attributes
 Country get nationality;// C# [Required], has default
 BloodGroup get bloodGroup; Religion get religion;// Assuming Religion.other is a valid default
 MedicalStatus get medicalStatus;// C# [Required], has default
 String? get retirementNumber; String? get tin;// C# TIN
 MaritalStatus get maritalStatus;// C# [Required], has default
// Employment Specifics
 EmploymentStatus get employmentStatus; bool get isManager; EmployeeType get employeeType;// C# default
 DateTime get hiredDate;// C# has default, but likely required for new employee
 DateTime? get retirementEligibilityDate;// Backend calculated, optional on input
// Audit fields - typically set by the backend
 String? get entryBy; DateTime? get entryDate;// C# EmployeeInfo has non-nullable EntryDate with default
// Collections of related data.
 List<EmployeeContactModel> get employeeContacts; List<EmployeeDependantModel> get employeeDependants; List<EmployeeEducationModel> get employeeEducations; List<EmployeeExperienceModel> get employeeExperiences; List<EmployeePerformanceModel> get performances; List<EmployeeSpouseModel> get employeeSpouse; List<EmployeeUploadModel> get generalDocuments;
/// Create a copy of EmployeeInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeInfoModelCopyWith<EmployeeInfoModel> get copyWith => _$EmployeeInfoModelCopyWithImpl<EmployeeInfoModel>(this as EmployeeInfoModel, _$identity);

  /// Serializes this EmployeeInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeInfoModel&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.grandName, grandName) || other.grandName == grandName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.photoFile, photoFile) || other.photoFile == photoFile)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.positionId, positionId) || other.positionId == positionId)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.religion, religion) || other.religion == religion)&&(identical(other.medicalStatus, medicalStatus) || other.medicalStatus == medicalStatus)&&(identical(other.retirementNumber, retirementNumber) || other.retirementNumber == retirementNumber)&&(identical(other.tin, tin) || other.tin == tin)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus)&&(identical(other.employmentStatus, employmentStatus) || other.employmentStatus == employmentStatus)&&(identical(other.isManager, isManager) || other.isManager == isManager)&&(identical(other.employeeType, employeeType) || other.employeeType == employeeType)&&(identical(other.hiredDate, hiredDate) || other.hiredDate == hiredDate)&&(identical(other.retirementEligibilityDate, retirementEligibilityDate) || other.retirementEligibilityDate == retirementEligibilityDate)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&const DeepCollectionEquality().equals(other.employeeContacts, employeeContacts)&&const DeepCollectionEquality().equals(other.employeeDependants, employeeDependants)&&const DeepCollectionEquality().equals(other.employeeEducations, employeeEducations)&&const DeepCollectionEquality().equals(other.employeeExperiences, employeeExperiences)&&const DeepCollectionEquality().equals(other.performances, performances)&&const DeepCollectionEquality().equals(other.employeeSpouse, employeeSpouse)&&const DeepCollectionEquality().equals(other.generalDocuments, generalDocuments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,employeeId,title,firstName,fatherName,grandName,gender,birthDate,photoFile,photoUrl,motherName,positionId,managerId,address1,address2,houseNumber,phone,mobile,email,nationality,bloodGroup,religion,medicalStatus,retirementNumber,tin,maritalStatus,employmentStatus,isManager,employeeType,hiredDate,retirementEligibilityDate,entryBy,entryDate,const DeepCollectionEquality().hash(employeeContacts),const DeepCollectionEquality().hash(employeeDependants),const DeepCollectionEquality().hash(employeeEducations),const DeepCollectionEquality().hash(employeeExperiences),const DeepCollectionEquality().hash(performances),const DeepCollectionEquality().hash(employeeSpouse),const DeepCollectionEquality().hash(generalDocuments)]);

@override
String toString() {
  return 'EmployeeInfoModel(employeeId: $employeeId, title: $title, firstName: $firstName, fatherName: $fatherName, grandName: $grandName, gender: $gender, birthDate: $birthDate, photoFile: $photoFile, photoUrl: $photoUrl, motherName: $motherName, positionId: $positionId, managerId: $managerId, address1: $address1, address2: $address2, houseNumber: $houseNumber, phone: $phone, mobile: $mobile, email: $email, nationality: $nationality, bloodGroup: $bloodGroup, religion: $religion, medicalStatus: $medicalStatus, retirementNumber: $retirementNumber, tin: $tin, maritalStatus: $maritalStatus, employmentStatus: $employmentStatus, isManager: $isManager, employeeType: $employeeType, hiredDate: $hiredDate, retirementEligibilityDate: $retirementEligibilityDate, entryBy: $entryBy, entryDate: $entryDate, employeeContacts: $employeeContacts, employeeDependants: $employeeDependants, employeeEducations: $employeeEducations, employeeExperiences: $employeeExperiences, performances: $performances, employeeSpouse: $employeeSpouse, generalDocuments: $generalDocuments)';
}


}

/// @nodoc
abstract mixin class $EmployeeInfoModelCopyWith<$Res>  {
  factory $EmployeeInfoModelCopyWith(EmployeeInfoModel value, $Res Function(EmployeeInfoModel) _then) = _$EmployeeInfoModelCopyWithImpl;
@useResult
$Res call({
 String employeeId, String? title, String firstName, String? fatherName, String? grandName, Gender gender, DateTime birthDate,@JsonKey(includeFromJson: false, includeToJson: false) File? photoFile, String? photoUrl, String? motherName, String positionId, String? managerId, String address1, String? address2, String? houseNumber, String phone, String mobile, String email, Country nationality, BloodGroup bloodGroup, Religion religion, MedicalStatus medicalStatus, String? retirementNumber, String? tin, MaritalStatus maritalStatus, EmploymentStatus employmentStatus, bool isManager, EmployeeType employeeType, DateTime hiredDate, DateTime? retirementEligibilityDate, String? entryBy, DateTime? entryDate, List<EmployeeContactModel> employeeContacts, List<EmployeeDependantModel> employeeDependants, List<EmployeeEducationModel> employeeEducations, List<EmployeeExperienceModel> employeeExperiences, List<EmployeePerformanceModel> performances, List<EmployeeSpouseModel> employeeSpouse, List<EmployeeUploadModel> generalDocuments
});




}
/// @nodoc
class _$EmployeeInfoModelCopyWithImpl<$Res>
    implements $EmployeeInfoModelCopyWith<$Res> {
  _$EmployeeInfoModelCopyWithImpl(this._self, this._then);

  final EmployeeInfoModel _self;
  final $Res Function(EmployeeInfoModel) _then;

/// Create a copy of EmployeeInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? employeeId = null,Object? title = freezed,Object? firstName = null,Object? fatherName = freezed,Object? grandName = freezed,Object? gender = null,Object? birthDate = null,Object? photoFile = freezed,Object? photoUrl = freezed,Object? motherName = freezed,Object? positionId = null,Object? managerId = freezed,Object? address1 = null,Object? address2 = freezed,Object? houseNumber = freezed,Object? phone = null,Object? mobile = null,Object? email = null,Object? nationality = null,Object? bloodGroup = null,Object? religion = null,Object? medicalStatus = null,Object? retirementNumber = freezed,Object? tin = freezed,Object? maritalStatus = null,Object? employmentStatus = null,Object? isManager = null,Object? employeeType = null,Object? hiredDate = null,Object? retirementEligibilityDate = freezed,Object? entryBy = freezed,Object? entryDate = freezed,Object? employeeContacts = null,Object? employeeDependants = null,Object? employeeEducations = null,Object? employeeExperiences = null,Object? performances = null,Object? employeeSpouse = null,Object? generalDocuments = null,}) {
  return _then(_self.copyWith(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,grandName: freezed == grandName ? _self.grandName : grandName // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,photoFile: freezed == photoFile ? _self.photoFile : photoFile // ignore: cast_nullable_to_non_nullable
as File?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,positionId: null == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as String,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as String?,address1: null == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as Country,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as BloodGroup,religion: null == religion ? _self.religion : religion // ignore: cast_nullable_to_non_nullable
as Religion,medicalStatus: null == medicalStatus ? _self.medicalStatus : medicalStatus // ignore: cast_nullable_to_non_nullable
as MedicalStatus,retirementNumber: freezed == retirementNumber ? _self.retirementNumber : retirementNumber // ignore: cast_nullable_to_non_nullable
as String?,tin: freezed == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String?,maritalStatus: null == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as MaritalStatus,employmentStatus: null == employmentStatus ? _self.employmentStatus : employmentStatus // ignore: cast_nullable_to_non_nullable
as EmploymentStatus,isManager: null == isManager ? _self.isManager : isManager // ignore: cast_nullable_to_non_nullable
as bool,employeeType: null == employeeType ? _self.employeeType : employeeType // ignore: cast_nullable_to_non_nullable
as EmployeeType,hiredDate: null == hiredDate ? _self.hiredDate : hiredDate // ignore: cast_nullable_to_non_nullable
as DateTime,retirementEligibilityDate: freezed == retirementEligibilityDate ? _self.retirementEligibilityDate : retirementEligibilityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,employeeContacts: null == employeeContacts ? _self.employeeContacts : employeeContacts // ignore: cast_nullable_to_non_nullable
as List<EmployeeContactModel>,employeeDependants: null == employeeDependants ? _self.employeeDependants : employeeDependants // ignore: cast_nullable_to_non_nullable
as List<EmployeeDependantModel>,employeeEducations: null == employeeEducations ? _self.employeeEducations : employeeEducations // ignore: cast_nullable_to_non_nullable
as List<EmployeeEducationModel>,employeeExperiences: null == employeeExperiences ? _self.employeeExperiences : employeeExperiences // ignore: cast_nullable_to_non_nullable
as List<EmployeeExperienceModel>,performances: null == performances ? _self.performances : performances // ignore: cast_nullable_to_non_nullable
as List<EmployeePerformanceModel>,employeeSpouse: null == employeeSpouse ? _self.employeeSpouse : employeeSpouse // ignore: cast_nullable_to_non_nullable
as List<EmployeeSpouseModel>,generalDocuments: null == generalDocuments ? _self.generalDocuments : generalDocuments // ignore: cast_nullable_to_non_nullable
as List<EmployeeUploadModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EmployeeInfoModel extends EmployeeInfoModel {
  const _EmployeeInfoModel({required this.employeeId, this.title, required this.firstName, this.fatherName, this.grandName, required this.gender, required this.birthDate, @JsonKey(includeFromJson: false, includeToJson: false) this.photoFile, this.photoUrl, this.motherName, required this.positionId, this.managerId, required this.address1, this.address2, this.houseNumber, required this.phone, required this.mobile, required this.email, this.nationality = Country.ethiopia, this.bloodGroup = BloodGroup.unknown, this.religion = Religion.other, this.medicalStatus = MedicalStatus.pending, this.retirementNumber, this.tin, this.maritalStatus = MaritalStatus.single, this.employmentStatus = EmploymentStatus.active, this.isManager = false, this.employeeType = EmployeeType.military, required this.hiredDate, this.retirementEligibilityDate, this.entryBy, this.entryDate, final  List<EmployeeContactModel> employeeContacts = const [], final  List<EmployeeDependantModel> employeeDependants = const [], final  List<EmployeeEducationModel> employeeEducations = const [], final  List<EmployeeExperienceModel> employeeExperiences = const [], final  List<EmployeePerformanceModel> performances = const [], final  List<EmployeeSpouseModel> employeeSpouse = const [], final  List<EmployeeUploadModel> generalDocuments = const []}): _employeeContacts = employeeContacts,_employeeDependants = employeeDependants,_employeeEducations = employeeEducations,_employeeExperiences = employeeExperiences,_performances = performances,_employeeSpouse = employeeSpouse,_generalDocuments = generalDocuments,super._();
  factory _EmployeeInfoModel.fromJson(Map<String, dynamic> json) => _$EmployeeInfoModelFromJson(json);

// Identifying Information
@override final  String employeeId;
// Primary Key, C# [Required]
@override final  String? title;
@override final  String firstName;
@override final  String? fatherName;
@override final  String? grandName;
// Personal Details
@override final  Gender gender;
@override final  DateTime birthDate;
// C# [Required] & [AgeValidation]
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? photoFile;
// Local file for upload
@override final  String? photoUrl;
// Corresponds to C# PhotoPath, stores URL from backend
@override final  String? motherName;
// C# MotherFullName
// Positional & Reporting Structure
@override final  String positionId;
// Foreign key to CommissionDesignation
@override final  String? managerId;
// Foreign key to another EmployeeInfo (self-referential)
// Contact & Address Details
@override final  String address1;
@override final  String? address2;
@override final  String? houseNumber;
@override final  String phone;
@override final  String mobile;
@override final  String email;
// C# [Required]
// Other Attributes
@override@JsonKey() final  Country nationality;
// C# [Required], has default
@override@JsonKey() final  BloodGroup bloodGroup;
@override@JsonKey() final  Religion religion;
// Assuming Religion.other is a valid default
@override@JsonKey() final  MedicalStatus medicalStatus;
// C# [Required], has default
@override final  String? retirementNumber;
@override final  String? tin;
// C# TIN
@override@JsonKey() final  MaritalStatus maritalStatus;
// C# [Required], has default
// Employment Specifics
@override@JsonKey() final  EmploymentStatus employmentStatus;
@override@JsonKey() final  bool isManager;
@override@JsonKey() final  EmployeeType employeeType;
// C# default
@override final  DateTime hiredDate;
// C# has default, but likely required for new employee
@override final  DateTime? retirementEligibilityDate;
// Backend calculated, optional on input
// Audit fields - typically set by the backend
@override final  String? entryBy;
@override final  DateTime? entryDate;
// C# EmployeeInfo has non-nullable EntryDate with default
// Collections of related data.
 final  List<EmployeeContactModel> _employeeContacts;
// C# EmployeeInfo has non-nullable EntryDate with default
// Collections of related data.
@override@JsonKey() List<EmployeeContactModel> get employeeContacts {
  if (_employeeContacts is EqualUnmodifiableListView) return _employeeContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employeeContacts);
}

 final  List<EmployeeDependantModel> _employeeDependants;
@override@JsonKey() List<EmployeeDependantModel> get employeeDependants {
  if (_employeeDependants is EqualUnmodifiableListView) return _employeeDependants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employeeDependants);
}

 final  List<EmployeeEducationModel> _employeeEducations;
@override@JsonKey() List<EmployeeEducationModel> get employeeEducations {
  if (_employeeEducations is EqualUnmodifiableListView) return _employeeEducations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employeeEducations);
}

 final  List<EmployeeExperienceModel> _employeeExperiences;
@override@JsonKey() List<EmployeeExperienceModel> get employeeExperiences {
  if (_employeeExperiences is EqualUnmodifiableListView) return _employeeExperiences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employeeExperiences);
}

 final  List<EmployeePerformanceModel> _performances;
@override@JsonKey() List<EmployeePerformanceModel> get performances {
  if (_performances is EqualUnmodifiableListView) return _performances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_performances);
}

 final  List<EmployeeSpouseModel> _employeeSpouse;
@override@JsonKey() List<EmployeeSpouseModel> get employeeSpouse {
  if (_employeeSpouse is EqualUnmodifiableListView) return _employeeSpouse;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employeeSpouse);
}

 final  List<EmployeeUploadModel> _generalDocuments;
@override@JsonKey() List<EmployeeUploadModel> get generalDocuments {
  if (_generalDocuments is EqualUnmodifiableListView) return _generalDocuments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_generalDocuments);
}


/// Create a copy of EmployeeInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeInfoModelCopyWith<_EmployeeInfoModel> get copyWith => __$EmployeeInfoModelCopyWithImpl<_EmployeeInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeInfoModel&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.grandName, grandName) || other.grandName == grandName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.photoFile, photoFile) || other.photoFile == photoFile)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.positionId, positionId) || other.positionId == positionId)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.religion, religion) || other.religion == religion)&&(identical(other.medicalStatus, medicalStatus) || other.medicalStatus == medicalStatus)&&(identical(other.retirementNumber, retirementNumber) || other.retirementNumber == retirementNumber)&&(identical(other.tin, tin) || other.tin == tin)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus)&&(identical(other.employmentStatus, employmentStatus) || other.employmentStatus == employmentStatus)&&(identical(other.isManager, isManager) || other.isManager == isManager)&&(identical(other.employeeType, employeeType) || other.employeeType == employeeType)&&(identical(other.hiredDate, hiredDate) || other.hiredDate == hiredDate)&&(identical(other.retirementEligibilityDate, retirementEligibilityDate) || other.retirementEligibilityDate == retirementEligibilityDate)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&const DeepCollectionEquality().equals(other._employeeContacts, _employeeContacts)&&const DeepCollectionEquality().equals(other._employeeDependants, _employeeDependants)&&const DeepCollectionEquality().equals(other._employeeEducations, _employeeEducations)&&const DeepCollectionEquality().equals(other._employeeExperiences, _employeeExperiences)&&const DeepCollectionEquality().equals(other._performances, _performances)&&const DeepCollectionEquality().equals(other._employeeSpouse, _employeeSpouse)&&const DeepCollectionEquality().equals(other._generalDocuments, _generalDocuments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,employeeId,title,firstName,fatherName,grandName,gender,birthDate,photoFile,photoUrl,motherName,positionId,managerId,address1,address2,houseNumber,phone,mobile,email,nationality,bloodGroup,religion,medicalStatus,retirementNumber,tin,maritalStatus,employmentStatus,isManager,employeeType,hiredDate,retirementEligibilityDate,entryBy,entryDate,const DeepCollectionEquality().hash(_employeeContacts),const DeepCollectionEquality().hash(_employeeDependants),const DeepCollectionEquality().hash(_employeeEducations),const DeepCollectionEquality().hash(_employeeExperiences),const DeepCollectionEquality().hash(_performances),const DeepCollectionEquality().hash(_employeeSpouse),const DeepCollectionEquality().hash(_generalDocuments)]);

@override
String toString() {
  return 'EmployeeInfoModel(employeeId: $employeeId, title: $title, firstName: $firstName, fatherName: $fatherName, grandName: $grandName, gender: $gender, birthDate: $birthDate, photoFile: $photoFile, photoUrl: $photoUrl, motherName: $motherName, positionId: $positionId, managerId: $managerId, address1: $address1, address2: $address2, houseNumber: $houseNumber, phone: $phone, mobile: $mobile, email: $email, nationality: $nationality, bloodGroup: $bloodGroup, religion: $religion, medicalStatus: $medicalStatus, retirementNumber: $retirementNumber, tin: $tin, maritalStatus: $maritalStatus, employmentStatus: $employmentStatus, isManager: $isManager, employeeType: $employeeType, hiredDate: $hiredDate, retirementEligibilityDate: $retirementEligibilityDate, entryBy: $entryBy, entryDate: $entryDate, employeeContacts: $employeeContacts, employeeDependants: $employeeDependants, employeeEducations: $employeeEducations, employeeExperiences: $employeeExperiences, performances: $performances, employeeSpouse: $employeeSpouse, generalDocuments: $generalDocuments)';
}


}

/// @nodoc
abstract mixin class _$EmployeeInfoModelCopyWith<$Res> implements $EmployeeInfoModelCopyWith<$Res> {
  factory _$EmployeeInfoModelCopyWith(_EmployeeInfoModel value, $Res Function(_EmployeeInfoModel) _then) = __$EmployeeInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String employeeId, String? title, String firstName, String? fatherName, String? grandName, Gender gender, DateTime birthDate,@JsonKey(includeFromJson: false, includeToJson: false) File? photoFile, String? photoUrl, String? motherName, String positionId, String? managerId, String address1, String? address2, String? houseNumber, String phone, String mobile, String email, Country nationality, BloodGroup bloodGroup, Religion religion, MedicalStatus medicalStatus, String? retirementNumber, String? tin, MaritalStatus maritalStatus, EmploymentStatus employmentStatus, bool isManager, EmployeeType employeeType, DateTime hiredDate, DateTime? retirementEligibilityDate, String? entryBy, DateTime? entryDate, List<EmployeeContactModel> employeeContacts, List<EmployeeDependantModel> employeeDependants, List<EmployeeEducationModel> employeeEducations, List<EmployeeExperienceModel> employeeExperiences, List<EmployeePerformanceModel> performances, List<EmployeeSpouseModel> employeeSpouse, List<EmployeeUploadModel> generalDocuments
});




}
/// @nodoc
class __$EmployeeInfoModelCopyWithImpl<$Res>
    implements _$EmployeeInfoModelCopyWith<$Res> {
  __$EmployeeInfoModelCopyWithImpl(this._self, this._then);

  final _EmployeeInfoModel _self;
  final $Res Function(_EmployeeInfoModel) _then;

/// Create a copy of EmployeeInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? employeeId = null,Object? title = freezed,Object? firstName = null,Object? fatherName = freezed,Object? grandName = freezed,Object? gender = null,Object? birthDate = null,Object? photoFile = freezed,Object? photoUrl = freezed,Object? motherName = freezed,Object? positionId = null,Object? managerId = freezed,Object? address1 = null,Object? address2 = freezed,Object? houseNumber = freezed,Object? phone = null,Object? mobile = null,Object? email = null,Object? nationality = null,Object? bloodGroup = null,Object? religion = null,Object? medicalStatus = null,Object? retirementNumber = freezed,Object? tin = freezed,Object? maritalStatus = null,Object? employmentStatus = null,Object? isManager = null,Object? employeeType = null,Object? hiredDate = null,Object? retirementEligibilityDate = freezed,Object? entryBy = freezed,Object? entryDate = freezed,Object? employeeContacts = null,Object? employeeDependants = null,Object? employeeEducations = null,Object? employeeExperiences = null,Object? performances = null,Object? employeeSpouse = null,Object? generalDocuments = null,}) {
  return _then(_EmployeeInfoModel(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,grandName: freezed == grandName ? _self.grandName : grandName // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,photoFile: freezed == photoFile ? _self.photoFile : photoFile // ignore: cast_nullable_to_non_nullable
as File?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,positionId: null == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as String,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as String?,address1: null == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as Country,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as BloodGroup,religion: null == religion ? _self.religion : religion // ignore: cast_nullable_to_non_nullable
as Religion,medicalStatus: null == medicalStatus ? _self.medicalStatus : medicalStatus // ignore: cast_nullable_to_non_nullable
as MedicalStatus,retirementNumber: freezed == retirementNumber ? _self.retirementNumber : retirementNumber // ignore: cast_nullable_to_non_nullable
as String?,tin: freezed == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String?,maritalStatus: null == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as MaritalStatus,employmentStatus: null == employmentStatus ? _self.employmentStatus : employmentStatus // ignore: cast_nullable_to_non_nullable
as EmploymentStatus,isManager: null == isManager ? _self.isManager : isManager // ignore: cast_nullable_to_non_nullable
as bool,employeeType: null == employeeType ? _self.employeeType : employeeType // ignore: cast_nullable_to_non_nullable
as EmployeeType,hiredDate: null == hiredDate ? _self.hiredDate : hiredDate // ignore: cast_nullable_to_non_nullable
as DateTime,retirementEligibilityDate: freezed == retirementEligibilityDate ? _self.retirementEligibilityDate : retirementEligibilityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,employeeContacts: null == employeeContacts ? _self._employeeContacts : employeeContacts // ignore: cast_nullable_to_non_nullable
as List<EmployeeContactModel>,employeeDependants: null == employeeDependants ? _self._employeeDependants : employeeDependants // ignore: cast_nullable_to_non_nullable
as List<EmployeeDependantModel>,employeeEducations: null == employeeEducations ? _self._employeeEducations : employeeEducations // ignore: cast_nullable_to_non_nullable
as List<EmployeeEducationModel>,employeeExperiences: null == employeeExperiences ? _self._employeeExperiences : employeeExperiences // ignore: cast_nullable_to_non_nullable
as List<EmployeeExperienceModel>,performances: null == performances ? _self._performances : performances // ignore: cast_nullable_to_non_nullable
as List<EmployeePerformanceModel>,employeeSpouse: null == employeeSpouse ? _self._employeeSpouse : employeeSpouse // ignore: cast_nullable_to_non_nullable
as List<EmployeeSpouseModel>,generalDocuments: null == generalDocuments ? _self._generalDocuments : generalDocuments // ignore: cast_nullable_to_non_nullable
as List<EmployeeUploadModel>,
  ));
}


}

// dart format on
