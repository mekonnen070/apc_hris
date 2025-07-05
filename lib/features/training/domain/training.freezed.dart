// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Training {

 int get trainingId; String get trainingName; String get trainingType; TrainingModality get trainingModality; TrainingWarranty get trainingWarranty; QualificationType get trainingQualification; String get trainingDescription; String get trainingLocation; String get trainingInstitution; DateTime get trainingStartDate; DateTime get trainingEndDate; int get traineeRequired; int get traineeActual; String get requiredEducation; int get requiredExperience; Gender get requiredSex; double get trainingCost; GeneralStatus get trainingStatus; String get registrationLocation; DateTime get postEndDate; String get trainingEntryBy; DateTime get trainingEntryDate; DevelopmentPlan get developmentType;@JsonKey(includeFromJson: false, includeToJson: false) List<TrainingApplicant?> get applicantList;
/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingCopyWith<Training> get copyWith => _$TrainingCopyWithImpl<Training>(this as Training, _$identity);

  /// Serializes this Training to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Training&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.trainingName, trainingName) || other.trainingName == trainingName)&&(identical(other.trainingType, trainingType) || other.trainingType == trainingType)&&(identical(other.trainingModality, trainingModality) || other.trainingModality == trainingModality)&&(identical(other.trainingWarranty, trainingWarranty) || other.trainingWarranty == trainingWarranty)&&(identical(other.trainingQualification, trainingQualification) || other.trainingQualification == trainingQualification)&&(identical(other.trainingDescription, trainingDescription) || other.trainingDescription == trainingDescription)&&(identical(other.trainingLocation, trainingLocation) || other.trainingLocation == trainingLocation)&&(identical(other.trainingInstitution, trainingInstitution) || other.trainingInstitution == trainingInstitution)&&(identical(other.trainingStartDate, trainingStartDate) || other.trainingStartDate == trainingStartDate)&&(identical(other.trainingEndDate, trainingEndDate) || other.trainingEndDate == trainingEndDate)&&(identical(other.traineeRequired, traineeRequired) || other.traineeRequired == traineeRequired)&&(identical(other.traineeActual, traineeActual) || other.traineeActual == traineeActual)&&(identical(other.requiredEducation, requiredEducation) || other.requiredEducation == requiredEducation)&&(identical(other.requiredExperience, requiredExperience) || other.requiredExperience == requiredExperience)&&(identical(other.requiredSex, requiredSex) || other.requiredSex == requiredSex)&&(identical(other.trainingCost, trainingCost) || other.trainingCost == trainingCost)&&(identical(other.trainingStatus, trainingStatus) || other.trainingStatus == trainingStatus)&&(identical(other.registrationLocation, registrationLocation) || other.registrationLocation == registrationLocation)&&(identical(other.postEndDate, postEndDate) || other.postEndDate == postEndDate)&&(identical(other.trainingEntryBy, trainingEntryBy) || other.trainingEntryBy == trainingEntryBy)&&(identical(other.trainingEntryDate, trainingEntryDate) || other.trainingEntryDate == trainingEntryDate)&&(identical(other.developmentType, developmentType) || other.developmentType == developmentType)&&const DeepCollectionEquality().equals(other.applicantList, applicantList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,trainingId,trainingName,trainingType,trainingModality,trainingWarranty,trainingQualification,trainingDescription,trainingLocation,trainingInstitution,trainingStartDate,trainingEndDate,traineeRequired,traineeActual,requiredEducation,requiredExperience,requiredSex,trainingCost,trainingStatus,registrationLocation,postEndDate,trainingEntryBy,trainingEntryDate,developmentType,const DeepCollectionEquality().hash(applicantList)]);

@override
String toString() {
  return 'Training(trainingId: $trainingId, trainingName: $trainingName, trainingType: $trainingType, trainingModality: $trainingModality, trainingWarranty: $trainingWarranty, trainingQualification: $trainingQualification, trainingDescription: $trainingDescription, trainingLocation: $trainingLocation, trainingInstitution: $trainingInstitution, trainingStartDate: $trainingStartDate, trainingEndDate: $trainingEndDate, traineeRequired: $traineeRequired, traineeActual: $traineeActual, requiredEducation: $requiredEducation, requiredExperience: $requiredExperience, requiredSex: $requiredSex, trainingCost: $trainingCost, trainingStatus: $trainingStatus, registrationLocation: $registrationLocation, postEndDate: $postEndDate, trainingEntryBy: $trainingEntryBy, trainingEntryDate: $trainingEntryDate, developmentType: $developmentType, applicantList: $applicantList)';
}


}

/// @nodoc
abstract mixin class $TrainingCopyWith<$Res>  {
  factory $TrainingCopyWith(Training value, $Res Function(Training) _then) = _$TrainingCopyWithImpl;
@useResult
$Res call({
 int trainingId, String trainingName, String trainingType, TrainingModality trainingModality, TrainingWarranty trainingWarranty, QualificationType trainingQualification, String trainingDescription, String trainingLocation, String trainingInstitution, DateTime trainingStartDate, DateTime trainingEndDate, int traineeRequired, int traineeActual, String requiredEducation, int requiredExperience, Gender requiredSex, double trainingCost, GeneralStatus trainingStatus, String registrationLocation, DateTime postEndDate, String trainingEntryBy, DateTime trainingEntryDate, DevelopmentPlan developmentType,@JsonKey(includeFromJson: false, includeToJson: false) List<TrainingApplicant?> applicantList
});


$DevelopmentPlanCopyWith<$Res> get developmentType;

}
/// @nodoc
class _$TrainingCopyWithImpl<$Res>
    implements $TrainingCopyWith<$Res> {
  _$TrainingCopyWithImpl(this._self, this._then);

  final Training _self;
  final $Res Function(Training) _then;

/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainingId = null,Object? trainingName = null,Object? trainingType = null,Object? trainingModality = null,Object? trainingWarranty = null,Object? trainingQualification = null,Object? trainingDescription = null,Object? trainingLocation = null,Object? trainingInstitution = null,Object? trainingStartDate = null,Object? trainingEndDate = null,Object? traineeRequired = null,Object? traineeActual = null,Object? requiredEducation = null,Object? requiredExperience = null,Object? requiredSex = null,Object? trainingCost = null,Object? trainingStatus = null,Object? registrationLocation = null,Object? postEndDate = null,Object? trainingEntryBy = null,Object? trainingEntryDate = null,Object? developmentType = null,Object? applicantList = null,}) {
  return _then(_self.copyWith(
trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as int,trainingName: null == trainingName ? _self.trainingName : trainingName // ignore: cast_nullable_to_non_nullable
as String,trainingType: null == trainingType ? _self.trainingType : trainingType // ignore: cast_nullable_to_non_nullable
as String,trainingModality: null == trainingModality ? _self.trainingModality : trainingModality // ignore: cast_nullable_to_non_nullable
as TrainingModality,trainingWarranty: null == trainingWarranty ? _self.trainingWarranty : trainingWarranty // ignore: cast_nullable_to_non_nullable
as TrainingWarranty,trainingQualification: null == trainingQualification ? _self.trainingQualification : trainingQualification // ignore: cast_nullable_to_non_nullable
as QualificationType,trainingDescription: null == trainingDescription ? _self.trainingDescription : trainingDescription // ignore: cast_nullable_to_non_nullable
as String,trainingLocation: null == trainingLocation ? _self.trainingLocation : trainingLocation // ignore: cast_nullable_to_non_nullable
as String,trainingInstitution: null == trainingInstitution ? _self.trainingInstitution : trainingInstitution // ignore: cast_nullable_to_non_nullable
as String,trainingStartDate: null == trainingStartDate ? _self.trainingStartDate : trainingStartDate // ignore: cast_nullable_to_non_nullable
as DateTime,trainingEndDate: null == trainingEndDate ? _self.trainingEndDate : trainingEndDate // ignore: cast_nullable_to_non_nullable
as DateTime,traineeRequired: null == traineeRequired ? _self.traineeRequired : traineeRequired // ignore: cast_nullable_to_non_nullable
as int,traineeActual: null == traineeActual ? _self.traineeActual : traineeActual // ignore: cast_nullable_to_non_nullable
as int,requiredEducation: null == requiredEducation ? _self.requiredEducation : requiredEducation // ignore: cast_nullable_to_non_nullable
as String,requiredExperience: null == requiredExperience ? _self.requiredExperience : requiredExperience // ignore: cast_nullable_to_non_nullable
as int,requiredSex: null == requiredSex ? _self.requiredSex : requiredSex // ignore: cast_nullable_to_non_nullable
as Gender,trainingCost: null == trainingCost ? _self.trainingCost : trainingCost // ignore: cast_nullable_to_non_nullable
as double,trainingStatus: null == trainingStatus ? _self.trainingStatus : trainingStatus // ignore: cast_nullable_to_non_nullable
as GeneralStatus,registrationLocation: null == registrationLocation ? _self.registrationLocation : registrationLocation // ignore: cast_nullable_to_non_nullable
as String,postEndDate: null == postEndDate ? _self.postEndDate : postEndDate // ignore: cast_nullable_to_non_nullable
as DateTime,trainingEntryBy: null == trainingEntryBy ? _self.trainingEntryBy : trainingEntryBy // ignore: cast_nullable_to_non_nullable
as String,trainingEntryDate: null == trainingEntryDate ? _self.trainingEntryDate : trainingEntryDate // ignore: cast_nullable_to_non_nullable
as DateTime,developmentType: null == developmentType ? _self.developmentType : developmentType // ignore: cast_nullable_to_non_nullable
as DevelopmentPlan,applicantList: null == applicantList ? _self.applicantList : applicantList // ignore: cast_nullable_to_non_nullable
as List<TrainingApplicant?>,
  ));
}
/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DevelopmentPlanCopyWith<$Res> get developmentType {
  
  return $DevelopmentPlanCopyWith<$Res>(_self.developmentType, (value) {
    return _then(_self.copyWith(developmentType: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Training implements Training {
   _Training({required this.trainingId, required this.trainingName, required this.trainingType, required this.trainingModality, required this.trainingWarranty, required this.trainingQualification, required this.trainingDescription, required this.trainingLocation, required this.trainingInstitution, required this.trainingStartDate, required this.trainingEndDate, required this.traineeRequired, this.traineeActual = 0, required this.requiredEducation, required this.requiredExperience, required this.requiredSex, required this.trainingCost, required this.trainingStatus, required this.registrationLocation, required this.postEndDate, required this.trainingEntryBy, required this.trainingEntryDate, required this.developmentType, @JsonKey(includeFromJson: false, includeToJson: false) final  List<TrainingApplicant?> applicantList = const []}): _applicantList = applicantList;
  factory _Training.fromJson(Map<String, dynamic> json) => _$TrainingFromJson(json);

@override final  int trainingId;
@override final  String trainingName;
@override final  String trainingType;
@override final  TrainingModality trainingModality;
@override final  TrainingWarranty trainingWarranty;
@override final  QualificationType trainingQualification;
@override final  String trainingDescription;
@override final  String trainingLocation;
@override final  String trainingInstitution;
@override final  DateTime trainingStartDate;
@override final  DateTime trainingEndDate;
@override final  int traineeRequired;
@override@JsonKey() final  int traineeActual;
@override final  String requiredEducation;
@override final  int requiredExperience;
@override final  Gender requiredSex;
@override final  double trainingCost;
@override final  GeneralStatus trainingStatus;
@override final  String registrationLocation;
@override final  DateTime postEndDate;
@override final  String trainingEntryBy;
@override final  DateTime trainingEntryDate;
@override final  DevelopmentPlan developmentType;
 final  List<TrainingApplicant?> _applicantList;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<TrainingApplicant?> get applicantList {
  if (_applicantList is EqualUnmodifiableListView) return _applicantList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applicantList);
}


/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingCopyWith<_Training> get copyWith => __$TrainingCopyWithImpl<_Training>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Training&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.trainingName, trainingName) || other.trainingName == trainingName)&&(identical(other.trainingType, trainingType) || other.trainingType == trainingType)&&(identical(other.trainingModality, trainingModality) || other.trainingModality == trainingModality)&&(identical(other.trainingWarranty, trainingWarranty) || other.trainingWarranty == trainingWarranty)&&(identical(other.trainingQualification, trainingQualification) || other.trainingQualification == trainingQualification)&&(identical(other.trainingDescription, trainingDescription) || other.trainingDescription == trainingDescription)&&(identical(other.trainingLocation, trainingLocation) || other.trainingLocation == trainingLocation)&&(identical(other.trainingInstitution, trainingInstitution) || other.trainingInstitution == trainingInstitution)&&(identical(other.trainingStartDate, trainingStartDate) || other.trainingStartDate == trainingStartDate)&&(identical(other.trainingEndDate, trainingEndDate) || other.trainingEndDate == trainingEndDate)&&(identical(other.traineeRequired, traineeRequired) || other.traineeRequired == traineeRequired)&&(identical(other.traineeActual, traineeActual) || other.traineeActual == traineeActual)&&(identical(other.requiredEducation, requiredEducation) || other.requiredEducation == requiredEducation)&&(identical(other.requiredExperience, requiredExperience) || other.requiredExperience == requiredExperience)&&(identical(other.requiredSex, requiredSex) || other.requiredSex == requiredSex)&&(identical(other.trainingCost, trainingCost) || other.trainingCost == trainingCost)&&(identical(other.trainingStatus, trainingStatus) || other.trainingStatus == trainingStatus)&&(identical(other.registrationLocation, registrationLocation) || other.registrationLocation == registrationLocation)&&(identical(other.postEndDate, postEndDate) || other.postEndDate == postEndDate)&&(identical(other.trainingEntryBy, trainingEntryBy) || other.trainingEntryBy == trainingEntryBy)&&(identical(other.trainingEntryDate, trainingEntryDate) || other.trainingEntryDate == trainingEntryDate)&&(identical(other.developmentType, developmentType) || other.developmentType == developmentType)&&const DeepCollectionEquality().equals(other._applicantList, _applicantList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,trainingId,trainingName,trainingType,trainingModality,trainingWarranty,trainingQualification,trainingDescription,trainingLocation,trainingInstitution,trainingStartDate,trainingEndDate,traineeRequired,traineeActual,requiredEducation,requiredExperience,requiredSex,trainingCost,trainingStatus,registrationLocation,postEndDate,trainingEntryBy,trainingEntryDate,developmentType,const DeepCollectionEquality().hash(_applicantList)]);

@override
String toString() {
  return 'Training(trainingId: $trainingId, trainingName: $trainingName, trainingType: $trainingType, trainingModality: $trainingModality, trainingWarranty: $trainingWarranty, trainingQualification: $trainingQualification, trainingDescription: $trainingDescription, trainingLocation: $trainingLocation, trainingInstitution: $trainingInstitution, trainingStartDate: $trainingStartDate, trainingEndDate: $trainingEndDate, traineeRequired: $traineeRequired, traineeActual: $traineeActual, requiredEducation: $requiredEducation, requiredExperience: $requiredExperience, requiredSex: $requiredSex, trainingCost: $trainingCost, trainingStatus: $trainingStatus, registrationLocation: $registrationLocation, postEndDate: $postEndDate, trainingEntryBy: $trainingEntryBy, trainingEntryDate: $trainingEntryDate, developmentType: $developmentType, applicantList: $applicantList)';
}


}

/// @nodoc
abstract mixin class _$TrainingCopyWith<$Res> implements $TrainingCopyWith<$Res> {
  factory _$TrainingCopyWith(_Training value, $Res Function(_Training) _then) = __$TrainingCopyWithImpl;
@override @useResult
$Res call({
 int trainingId, String trainingName, String trainingType, TrainingModality trainingModality, TrainingWarranty trainingWarranty, QualificationType trainingQualification, String trainingDescription, String trainingLocation, String trainingInstitution, DateTime trainingStartDate, DateTime trainingEndDate, int traineeRequired, int traineeActual, String requiredEducation, int requiredExperience, Gender requiredSex, double trainingCost, GeneralStatus trainingStatus, String registrationLocation, DateTime postEndDate, String trainingEntryBy, DateTime trainingEntryDate, DevelopmentPlan developmentType,@JsonKey(includeFromJson: false, includeToJson: false) List<TrainingApplicant?> applicantList
});


@override $DevelopmentPlanCopyWith<$Res> get developmentType;

}
/// @nodoc
class __$TrainingCopyWithImpl<$Res>
    implements _$TrainingCopyWith<$Res> {
  __$TrainingCopyWithImpl(this._self, this._then);

  final _Training _self;
  final $Res Function(_Training) _then;

/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainingId = null,Object? trainingName = null,Object? trainingType = null,Object? trainingModality = null,Object? trainingWarranty = null,Object? trainingQualification = null,Object? trainingDescription = null,Object? trainingLocation = null,Object? trainingInstitution = null,Object? trainingStartDate = null,Object? trainingEndDate = null,Object? traineeRequired = null,Object? traineeActual = null,Object? requiredEducation = null,Object? requiredExperience = null,Object? requiredSex = null,Object? trainingCost = null,Object? trainingStatus = null,Object? registrationLocation = null,Object? postEndDate = null,Object? trainingEntryBy = null,Object? trainingEntryDate = null,Object? developmentType = null,Object? applicantList = null,}) {
  return _then(_Training(
trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as int,trainingName: null == trainingName ? _self.trainingName : trainingName // ignore: cast_nullable_to_non_nullable
as String,trainingType: null == trainingType ? _self.trainingType : trainingType // ignore: cast_nullable_to_non_nullable
as String,trainingModality: null == trainingModality ? _self.trainingModality : trainingModality // ignore: cast_nullable_to_non_nullable
as TrainingModality,trainingWarranty: null == trainingWarranty ? _self.trainingWarranty : trainingWarranty // ignore: cast_nullable_to_non_nullable
as TrainingWarranty,trainingQualification: null == trainingQualification ? _self.trainingQualification : trainingQualification // ignore: cast_nullable_to_non_nullable
as QualificationType,trainingDescription: null == trainingDescription ? _self.trainingDescription : trainingDescription // ignore: cast_nullable_to_non_nullable
as String,trainingLocation: null == trainingLocation ? _self.trainingLocation : trainingLocation // ignore: cast_nullable_to_non_nullable
as String,trainingInstitution: null == trainingInstitution ? _self.trainingInstitution : trainingInstitution // ignore: cast_nullable_to_non_nullable
as String,trainingStartDate: null == trainingStartDate ? _self.trainingStartDate : trainingStartDate // ignore: cast_nullable_to_non_nullable
as DateTime,trainingEndDate: null == trainingEndDate ? _self.trainingEndDate : trainingEndDate // ignore: cast_nullable_to_non_nullable
as DateTime,traineeRequired: null == traineeRequired ? _self.traineeRequired : traineeRequired // ignore: cast_nullable_to_non_nullable
as int,traineeActual: null == traineeActual ? _self.traineeActual : traineeActual // ignore: cast_nullable_to_non_nullable
as int,requiredEducation: null == requiredEducation ? _self.requiredEducation : requiredEducation // ignore: cast_nullable_to_non_nullable
as String,requiredExperience: null == requiredExperience ? _self.requiredExperience : requiredExperience // ignore: cast_nullable_to_non_nullable
as int,requiredSex: null == requiredSex ? _self.requiredSex : requiredSex // ignore: cast_nullable_to_non_nullable
as Gender,trainingCost: null == trainingCost ? _self.trainingCost : trainingCost // ignore: cast_nullable_to_non_nullable
as double,trainingStatus: null == trainingStatus ? _self.trainingStatus : trainingStatus // ignore: cast_nullable_to_non_nullable
as GeneralStatus,registrationLocation: null == registrationLocation ? _self.registrationLocation : registrationLocation // ignore: cast_nullable_to_non_nullable
as String,postEndDate: null == postEndDate ? _self.postEndDate : postEndDate // ignore: cast_nullable_to_non_nullable
as DateTime,trainingEntryBy: null == trainingEntryBy ? _self.trainingEntryBy : trainingEntryBy // ignore: cast_nullable_to_non_nullable
as String,trainingEntryDate: null == trainingEntryDate ? _self.trainingEntryDate : trainingEntryDate // ignore: cast_nullable_to_non_nullable
as DateTime,developmentType: null == developmentType ? _self.developmentType : developmentType // ignore: cast_nullable_to_non_nullable
as DevelopmentPlan,applicantList: null == applicantList ? _self._applicantList : applicantList // ignore: cast_nullable_to_non_nullable
as List<TrainingApplicant?>,
  ));
}

/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DevelopmentPlanCopyWith<$Res> get developmentType {
  
  return $DevelopmentPlanCopyWith<$Res>(_self.developmentType, (value) {
    return _then(_self.copyWith(developmentType: value));
  });
}
}

// dart format on
