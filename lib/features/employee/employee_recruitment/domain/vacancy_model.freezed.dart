// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacancy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VacancyModel {

 String get id;// Unique ID for the vacancy (maps to RefNo)
 String get positionTitle;// e.g., "Sergeant - Patrol Division"
 String get department;// e.g., "Patrol Division", "CID"
 String? get sectionOrUnit;// More specific unit
 String get location;// e.g., "Bahir Dar Central Station"
 String get description;// Detailed job description
 List<String> get responsibilities; List<String> get qualifications;// Required skills, education, experience
 List<String>? get preferredQualifications; EmploymentTypeVacancy get employmentType; int get numberOfOpenings; DateTime get postingDate; DateTime get closingDate; VacancyStatus get status;// Default to Open for display
 String? get positionGrade;// New: e.g., "PSG-5" (Police Sergeant Grade 5)
 double? get gradeSalary;// New: Specific salary if available, otherwise use salaryRange
 String? get salaryRange;// e.g., "ETB 15,000 - 20,000" or "As per commission scale"
 String get applicationProcedure;// New: How to apply
 String? get contactEmail;// New: Direct contact email for inquiries
 String? get contactPhone;// New: Direct contact phone for inquiries
 String? get reportingToPositionId;// ID of the position this role reports to
 String? get contactPersonEmployeeId;// Employee ID of HR contact (if internal)
 List<String>? get keywords;// For searchability
 String? get internalNotes;
/// Create a copy of VacancyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacancyModelCopyWith<VacancyModel> get copyWith => _$VacancyModelCopyWithImpl<VacancyModel>(this as VacancyModel, _$identity);

  /// Serializes this VacancyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacancyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.positionTitle, positionTitle) || other.positionTitle == positionTitle)&&(identical(other.department, department) || other.department == department)&&(identical(other.sectionOrUnit, sectionOrUnit) || other.sectionOrUnit == sectionOrUnit)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.responsibilities, responsibilities)&&const DeepCollectionEquality().equals(other.qualifications, qualifications)&&const DeepCollectionEquality().equals(other.preferredQualifications, preferredQualifications)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.postingDate, postingDate) || other.postingDate == postingDate)&&(identical(other.closingDate, closingDate) || other.closingDate == closingDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.positionGrade, positionGrade) || other.positionGrade == positionGrade)&&(identical(other.gradeSalary, gradeSalary) || other.gradeSalary == gradeSalary)&&(identical(other.salaryRange, salaryRange) || other.salaryRange == salaryRange)&&(identical(other.applicationProcedure, applicationProcedure) || other.applicationProcedure == applicationProcedure)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.reportingToPositionId, reportingToPositionId) || other.reportingToPositionId == reportingToPositionId)&&(identical(other.contactPersonEmployeeId, contactPersonEmployeeId) || other.contactPersonEmployeeId == contactPersonEmployeeId)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&(identical(other.internalNotes, internalNotes) || other.internalNotes == internalNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,positionTitle,department,sectionOrUnit,location,description,const DeepCollectionEquality().hash(responsibilities),const DeepCollectionEquality().hash(qualifications),const DeepCollectionEquality().hash(preferredQualifications),employmentType,numberOfOpenings,postingDate,closingDate,status,positionGrade,gradeSalary,salaryRange,applicationProcedure,contactEmail,contactPhone,reportingToPositionId,contactPersonEmployeeId,const DeepCollectionEquality().hash(keywords),internalNotes]);

@override
String toString() {
  return 'VacancyModel(id: $id, positionTitle: $positionTitle, department: $department, sectionOrUnit: $sectionOrUnit, location: $location, description: $description, responsibilities: $responsibilities, qualifications: $qualifications, preferredQualifications: $preferredQualifications, employmentType: $employmentType, numberOfOpenings: $numberOfOpenings, postingDate: $postingDate, closingDate: $closingDate, status: $status, positionGrade: $positionGrade, gradeSalary: $gradeSalary, salaryRange: $salaryRange, applicationProcedure: $applicationProcedure, contactEmail: $contactEmail, contactPhone: $contactPhone, reportingToPositionId: $reportingToPositionId, contactPersonEmployeeId: $contactPersonEmployeeId, keywords: $keywords, internalNotes: $internalNotes)';
}


}

/// @nodoc
abstract mixin class $VacancyModelCopyWith<$Res>  {
  factory $VacancyModelCopyWith(VacancyModel value, $Res Function(VacancyModel) _then) = _$VacancyModelCopyWithImpl;
@useResult
$Res call({
 String id, String positionTitle, String department, String? sectionOrUnit, String location, String description, List<String> responsibilities, List<String> qualifications, List<String>? preferredQualifications, EmploymentTypeVacancy employmentType, int numberOfOpenings, DateTime postingDate, DateTime closingDate, VacancyStatus status, String? positionGrade, double? gradeSalary, String? salaryRange, String applicationProcedure, String? contactEmail, String? contactPhone, String? reportingToPositionId, String? contactPersonEmployeeId, List<String>? keywords, String? internalNotes
});




}
/// @nodoc
class _$VacancyModelCopyWithImpl<$Res>
    implements $VacancyModelCopyWith<$Res> {
  _$VacancyModelCopyWithImpl(this._self, this._then);

  final VacancyModel _self;
  final $Res Function(VacancyModel) _then;

/// Create a copy of VacancyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? positionTitle = null,Object? department = null,Object? sectionOrUnit = freezed,Object? location = null,Object? description = null,Object? responsibilities = null,Object? qualifications = null,Object? preferredQualifications = freezed,Object? employmentType = null,Object? numberOfOpenings = null,Object? postingDate = null,Object? closingDate = null,Object? status = null,Object? positionGrade = freezed,Object? gradeSalary = freezed,Object? salaryRange = freezed,Object? applicationProcedure = null,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? reportingToPositionId = freezed,Object? contactPersonEmployeeId = freezed,Object? keywords = freezed,Object? internalNotes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,positionTitle: null == positionTitle ? _self.positionTitle : positionTitle // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,sectionOrUnit: freezed == sectionOrUnit ? _self.sectionOrUnit : sectionOrUnit // ignore: cast_nullable_to_non_nullable
as String?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,responsibilities: null == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as List<String>,qualifications: null == qualifications ? _self.qualifications : qualifications // ignore: cast_nullable_to_non_nullable
as List<String>,preferredQualifications: freezed == preferredQualifications ? _self.preferredQualifications : preferredQualifications // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: null == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as EmploymentTypeVacancy,numberOfOpenings: null == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int,postingDate: null == postingDate ? _self.postingDate : postingDate // ignore: cast_nullable_to_non_nullable
as DateTime,closingDate: null == closingDate ? _self.closingDate : closingDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VacancyStatus,positionGrade: freezed == positionGrade ? _self.positionGrade : positionGrade // ignore: cast_nullable_to_non_nullable
as String?,gradeSalary: freezed == gradeSalary ? _self.gradeSalary : gradeSalary // ignore: cast_nullable_to_non_nullable
as double?,salaryRange: freezed == salaryRange ? _self.salaryRange : salaryRange // ignore: cast_nullable_to_non_nullable
as String?,applicationProcedure: null == applicationProcedure ? _self.applicationProcedure : applicationProcedure // ignore: cast_nullable_to_non_nullable
as String,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,reportingToPositionId: freezed == reportingToPositionId ? _self.reportingToPositionId : reportingToPositionId // ignore: cast_nullable_to_non_nullable
as String?,contactPersonEmployeeId: freezed == contactPersonEmployeeId ? _self.contactPersonEmployeeId : contactPersonEmployeeId // ignore: cast_nullable_to_non_nullable
as String?,keywords: freezed == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,internalNotes: freezed == internalNotes ? _self.internalNotes : internalNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VacancyModel implements VacancyModel {
  const _VacancyModel({required this.id, required this.positionTitle, required this.department, this.sectionOrUnit, required this.location, required this.description, required final  List<String> responsibilities, required final  List<String> qualifications, final  List<String>? preferredQualifications, required this.employmentType, this.numberOfOpenings = 1, required this.postingDate, required this.closingDate, this.status = VacancyStatus.open, this.positionGrade, this.gradeSalary, this.salaryRange, required this.applicationProcedure, this.contactEmail, this.contactPhone, this.reportingToPositionId, this.contactPersonEmployeeId, final  List<String>? keywords, this.internalNotes}): _responsibilities = responsibilities,_qualifications = qualifications,_preferredQualifications = preferredQualifications,_keywords = keywords;
  factory _VacancyModel.fromJson(Map<String, dynamic> json) => _$VacancyModelFromJson(json);

@override final  String id;
// Unique ID for the vacancy (maps to RefNo)
@override final  String positionTitle;
// e.g., "Sergeant - Patrol Division"
@override final  String department;
// e.g., "Patrol Division", "CID"
@override final  String? sectionOrUnit;
// More specific unit
@override final  String location;
// e.g., "Bahir Dar Central Station"
@override final  String description;
// Detailed job description
 final  List<String> _responsibilities;
// Detailed job description
@override List<String> get responsibilities {
  if (_responsibilities is EqualUnmodifiableListView) return _responsibilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responsibilities);
}

 final  List<String> _qualifications;
@override List<String> get qualifications {
  if (_qualifications is EqualUnmodifiableListView) return _qualifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_qualifications);
}

// Required skills, education, experience
 final  List<String>? _preferredQualifications;
// Required skills, education, experience
@override List<String>? get preferredQualifications {
  final value = _preferredQualifications;
  if (value == null) return null;
  if (_preferredQualifications is EqualUnmodifiableListView) return _preferredQualifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  EmploymentTypeVacancy employmentType;
@override@JsonKey() final  int numberOfOpenings;
@override final  DateTime postingDate;
@override final  DateTime closingDate;
@override@JsonKey() final  VacancyStatus status;
// Default to Open for display
@override final  String? positionGrade;
// New: e.g., "PSG-5" (Police Sergeant Grade 5)
@override final  double? gradeSalary;
// New: Specific salary if available, otherwise use salaryRange
@override final  String? salaryRange;
// e.g., "ETB 15,000 - 20,000" or "As per commission scale"
@override final  String applicationProcedure;
// New: How to apply
@override final  String? contactEmail;
// New: Direct contact email for inquiries
@override final  String? contactPhone;
// New: Direct contact phone for inquiries
@override final  String? reportingToPositionId;
// ID of the position this role reports to
@override final  String? contactPersonEmployeeId;
// Employee ID of HR contact (if internal)
 final  List<String>? _keywords;
// Employee ID of HR contact (if internal)
@override List<String>? get keywords {
  final value = _keywords;
  if (value == null) return null;
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// For searchability
@override final  String? internalNotes;

/// Create a copy of VacancyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacancyModelCopyWith<_VacancyModel> get copyWith => __$VacancyModelCopyWithImpl<_VacancyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacancyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacancyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.positionTitle, positionTitle) || other.positionTitle == positionTitle)&&(identical(other.department, department) || other.department == department)&&(identical(other.sectionOrUnit, sectionOrUnit) || other.sectionOrUnit == sectionOrUnit)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._responsibilities, _responsibilities)&&const DeepCollectionEquality().equals(other._qualifications, _qualifications)&&const DeepCollectionEquality().equals(other._preferredQualifications, _preferredQualifications)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.postingDate, postingDate) || other.postingDate == postingDate)&&(identical(other.closingDate, closingDate) || other.closingDate == closingDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.positionGrade, positionGrade) || other.positionGrade == positionGrade)&&(identical(other.gradeSalary, gradeSalary) || other.gradeSalary == gradeSalary)&&(identical(other.salaryRange, salaryRange) || other.salaryRange == salaryRange)&&(identical(other.applicationProcedure, applicationProcedure) || other.applicationProcedure == applicationProcedure)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.reportingToPositionId, reportingToPositionId) || other.reportingToPositionId == reportingToPositionId)&&(identical(other.contactPersonEmployeeId, contactPersonEmployeeId) || other.contactPersonEmployeeId == contactPersonEmployeeId)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&(identical(other.internalNotes, internalNotes) || other.internalNotes == internalNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,positionTitle,department,sectionOrUnit,location,description,const DeepCollectionEquality().hash(_responsibilities),const DeepCollectionEquality().hash(_qualifications),const DeepCollectionEquality().hash(_preferredQualifications),employmentType,numberOfOpenings,postingDate,closingDate,status,positionGrade,gradeSalary,salaryRange,applicationProcedure,contactEmail,contactPhone,reportingToPositionId,contactPersonEmployeeId,const DeepCollectionEquality().hash(_keywords),internalNotes]);

@override
String toString() {
  return 'VacancyModel(id: $id, positionTitle: $positionTitle, department: $department, sectionOrUnit: $sectionOrUnit, location: $location, description: $description, responsibilities: $responsibilities, qualifications: $qualifications, preferredQualifications: $preferredQualifications, employmentType: $employmentType, numberOfOpenings: $numberOfOpenings, postingDate: $postingDate, closingDate: $closingDate, status: $status, positionGrade: $positionGrade, gradeSalary: $gradeSalary, salaryRange: $salaryRange, applicationProcedure: $applicationProcedure, contactEmail: $contactEmail, contactPhone: $contactPhone, reportingToPositionId: $reportingToPositionId, contactPersonEmployeeId: $contactPersonEmployeeId, keywords: $keywords, internalNotes: $internalNotes)';
}


}

/// @nodoc
abstract mixin class _$VacancyModelCopyWith<$Res> implements $VacancyModelCopyWith<$Res> {
  factory _$VacancyModelCopyWith(_VacancyModel value, $Res Function(_VacancyModel) _then) = __$VacancyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String positionTitle, String department, String? sectionOrUnit, String location, String description, List<String> responsibilities, List<String> qualifications, List<String>? preferredQualifications, EmploymentTypeVacancy employmentType, int numberOfOpenings, DateTime postingDate, DateTime closingDate, VacancyStatus status, String? positionGrade, double? gradeSalary, String? salaryRange, String applicationProcedure, String? contactEmail, String? contactPhone, String? reportingToPositionId, String? contactPersonEmployeeId, List<String>? keywords, String? internalNotes
});




}
/// @nodoc
class __$VacancyModelCopyWithImpl<$Res>
    implements _$VacancyModelCopyWith<$Res> {
  __$VacancyModelCopyWithImpl(this._self, this._then);

  final _VacancyModel _self;
  final $Res Function(_VacancyModel) _then;

/// Create a copy of VacancyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? positionTitle = null,Object? department = null,Object? sectionOrUnit = freezed,Object? location = null,Object? description = null,Object? responsibilities = null,Object? qualifications = null,Object? preferredQualifications = freezed,Object? employmentType = null,Object? numberOfOpenings = null,Object? postingDate = null,Object? closingDate = null,Object? status = null,Object? positionGrade = freezed,Object? gradeSalary = freezed,Object? salaryRange = freezed,Object? applicationProcedure = null,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? reportingToPositionId = freezed,Object? contactPersonEmployeeId = freezed,Object? keywords = freezed,Object? internalNotes = freezed,}) {
  return _then(_VacancyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,positionTitle: null == positionTitle ? _self.positionTitle : positionTitle // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,sectionOrUnit: freezed == sectionOrUnit ? _self.sectionOrUnit : sectionOrUnit // ignore: cast_nullable_to_non_nullable
as String?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,responsibilities: null == responsibilities ? _self._responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as List<String>,qualifications: null == qualifications ? _self._qualifications : qualifications // ignore: cast_nullable_to_non_nullable
as List<String>,preferredQualifications: freezed == preferredQualifications ? _self._preferredQualifications : preferredQualifications // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: null == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as EmploymentTypeVacancy,numberOfOpenings: null == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int,postingDate: null == postingDate ? _self.postingDate : postingDate // ignore: cast_nullable_to_non_nullable
as DateTime,closingDate: null == closingDate ? _self.closingDate : closingDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VacancyStatus,positionGrade: freezed == positionGrade ? _self.positionGrade : positionGrade // ignore: cast_nullable_to_non_nullable
as String?,gradeSalary: freezed == gradeSalary ? _self.gradeSalary : gradeSalary // ignore: cast_nullable_to_non_nullable
as double?,salaryRange: freezed == salaryRange ? _self.salaryRange : salaryRange // ignore: cast_nullable_to_non_nullable
as String?,applicationProcedure: null == applicationProcedure ? _self.applicationProcedure : applicationProcedure // ignore: cast_nullable_to_non_nullable
as String,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,reportingToPositionId: freezed == reportingToPositionId ? _self.reportingToPositionId : reportingToPositionId // ignore: cast_nullable_to_non_nullable
as String?,contactPersonEmployeeId: freezed == contactPersonEmployeeId ? _self.contactPersonEmployeeId : contactPersonEmployeeId // ignore: cast_nullable_to_non_nullable
as String?,keywords: freezed == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,internalNotes: freezed == internalNotes ? _self.internalNotes : internalNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
