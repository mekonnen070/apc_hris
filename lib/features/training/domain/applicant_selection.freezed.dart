// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicant_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApplicantSelection {

 int? get id; int? get applicationId; String? get applicantId; int? get trainingId; bool? get disciplineStatus; String? get disciplineDescription; bool? get trainingStatus; String? get trainingDescription; bool? get experience; String? get experienceDescription; bool? get retirementStatus; String? get retirementDescription; bool? get medicalStatus; String? get medicalDescription; ApplicantStatus? get selectedStatus; String? get entryBy; DateTime? get entryDate; TrainingApplicant? get applicant;
/// Create a copy of ApplicantSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicantSelectionCopyWith<ApplicantSelection> get copyWith => _$ApplicantSelectionCopyWithImpl<ApplicantSelection>(this as ApplicantSelection, _$identity);

  /// Serializes this ApplicantSelection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicantSelection&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.disciplineStatus, disciplineStatus) || other.disciplineStatus == disciplineStatus)&&(identical(other.disciplineDescription, disciplineDescription) || other.disciplineDescription == disciplineDescription)&&(identical(other.trainingStatus, trainingStatus) || other.trainingStatus == trainingStatus)&&(identical(other.trainingDescription, trainingDescription) || other.trainingDescription == trainingDescription)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.experienceDescription, experienceDescription) || other.experienceDescription == experienceDescription)&&(identical(other.retirementStatus, retirementStatus) || other.retirementStatus == retirementStatus)&&(identical(other.retirementDescription, retirementDescription) || other.retirementDescription == retirementDescription)&&(identical(other.medicalStatus, medicalStatus) || other.medicalStatus == medicalStatus)&&(identical(other.medicalDescription, medicalDescription) || other.medicalDescription == medicalDescription)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.applicant, applicant) || other.applicant == applicant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,applicantId,trainingId,disciplineStatus,disciplineDescription,trainingStatus,trainingDescription,experience,experienceDescription,retirementStatus,retirementDescription,medicalStatus,medicalDescription,selectedStatus,entryBy,entryDate,applicant);

@override
String toString() {
  return 'ApplicantSelection(id: $id, applicationId: $applicationId, applicantId: $applicantId, trainingId: $trainingId, disciplineStatus: $disciplineStatus, disciplineDescription: $disciplineDescription, trainingStatus: $trainingStatus, trainingDescription: $trainingDescription, experience: $experience, experienceDescription: $experienceDescription, retirementStatus: $retirementStatus, retirementDescription: $retirementDescription, medicalStatus: $medicalStatus, medicalDescription: $medicalDescription, selectedStatus: $selectedStatus, entryBy: $entryBy, entryDate: $entryDate, applicant: $applicant)';
}


}

/// @nodoc
abstract mixin class $ApplicantSelectionCopyWith<$Res>  {
  factory $ApplicantSelectionCopyWith(ApplicantSelection value, $Res Function(ApplicantSelection) _then) = _$ApplicantSelectionCopyWithImpl;
@useResult
$Res call({
 int? id, int? applicationId, String? applicantId, int? trainingId, bool? disciplineStatus, String? disciplineDescription, bool? trainingStatus, String? trainingDescription, bool? experience, String? experienceDescription, bool? retirementStatus, String? retirementDescription, bool? medicalStatus, String? medicalDescription, ApplicantStatus? selectedStatus, String? entryBy, DateTime? entryDate, TrainingApplicant? applicant
});


$TrainingApplicantCopyWith<$Res>? get applicant;

}
/// @nodoc
class _$ApplicantSelectionCopyWithImpl<$Res>
    implements $ApplicantSelectionCopyWith<$Res> {
  _$ApplicantSelectionCopyWithImpl(this._self, this._then);

  final ApplicantSelection _self;
  final $Res Function(ApplicantSelection) _then;

/// Create a copy of ApplicantSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? applicationId = freezed,Object? applicantId = freezed,Object? trainingId = freezed,Object? disciplineStatus = freezed,Object? disciplineDescription = freezed,Object? trainingStatus = freezed,Object? trainingDescription = freezed,Object? experience = freezed,Object? experienceDescription = freezed,Object? retirementStatus = freezed,Object? retirementDescription = freezed,Object? medicalStatus = freezed,Object? medicalDescription = freezed,Object? selectedStatus = freezed,Object? entryBy = freezed,Object? entryDate = freezed,Object? applicant = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as int?,applicantId: freezed == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String?,trainingId: freezed == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as int?,disciplineStatus: freezed == disciplineStatus ? _self.disciplineStatus : disciplineStatus // ignore: cast_nullable_to_non_nullable
as bool?,disciplineDescription: freezed == disciplineDescription ? _self.disciplineDescription : disciplineDescription // ignore: cast_nullable_to_non_nullable
as String?,trainingStatus: freezed == trainingStatus ? _self.trainingStatus : trainingStatus // ignore: cast_nullable_to_non_nullable
as bool?,trainingDescription: freezed == trainingDescription ? _self.trainingDescription : trainingDescription // ignore: cast_nullable_to_non_nullable
as String?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as bool?,experienceDescription: freezed == experienceDescription ? _self.experienceDescription : experienceDescription // ignore: cast_nullable_to_non_nullable
as String?,retirementStatus: freezed == retirementStatus ? _self.retirementStatus : retirementStatus // ignore: cast_nullable_to_non_nullable
as bool?,retirementDescription: freezed == retirementDescription ? _self.retirementDescription : retirementDescription // ignore: cast_nullable_to_non_nullable
as String?,medicalStatus: freezed == medicalStatus ? _self.medicalStatus : medicalStatus // ignore: cast_nullable_to_non_nullable
as bool?,medicalDescription: freezed == medicalDescription ? _self.medicalDescription : medicalDescription // ignore: cast_nullable_to_non_nullable
as String?,selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as TrainingApplicant?,
  ));
}
/// Create a copy of ApplicantSelection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingApplicantCopyWith<$Res>? get applicant {
    if (_self.applicant == null) {
    return null;
  }

  return $TrainingApplicantCopyWith<$Res>(_self.applicant!, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ApplicantSelection implements ApplicantSelection {
   _ApplicantSelection({this.id, this.applicationId, this.applicantId, this.trainingId, this.disciplineStatus, this.disciplineDescription, this.trainingStatus, this.trainingDescription, this.experience, this.experienceDescription, this.retirementStatus, this.retirementDescription, this.medicalStatus, this.medicalDescription, this.selectedStatus, this.entryBy, this.entryDate, this.applicant});
  factory _ApplicantSelection.fromJson(Map<String, dynamic> json) => _$ApplicantSelectionFromJson(json);

@override final  int? id;
@override final  int? applicationId;
@override final  String? applicantId;
@override final  int? trainingId;
@override final  bool? disciplineStatus;
@override final  String? disciplineDescription;
@override final  bool? trainingStatus;
@override final  String? trainingDescription;
@override final  bool? experience;
@override final  String? experienceDescription;
@override final  bool? retirementStatus;
@override final  String? retirementDescription;
@override final  bool? medicalStatus;
@override final  String? medicalDescription;
@override final  ApplicantStatus? selectedStatus;
@override final  String? entryBy;
@override final  DateTime? entryDate;
@override final  TrainingApplicant? applicant;

/// Create a copy of ApplicantSelection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicantSelectionCopyWith<_ApplicantSelection> get copyWith => __$ApplicantSelectionCopyWithImpl<_ApplicantSelection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicantSelectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicantSelection&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.disciplineStatus, disciplineStatus) || other.disciplineStatus == disciplineStatus)&&(identical(other.disciplineDescription, disciplineDescription) || other.disciplineDescription == disciplineDescription)&&(identical(other.trainingStatus, trainingStatus) || other.trainingStatus == trainingStatus)&&(identical(other.trainingDescription, trainingDescription) || other.trainingDescription == trainingDescription)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.experienceDescription, experienceDescription) || other.experienceDescription == experienceDescription)&&(identical(other.retirementStatus, retirementStatus) || other.retirementStatus == retirementStatus)&&(identical(other.retirementDescription, retirementDescription) || other.retirementDescription == retirementDescription)&&(identical(other.medicalStatus, medicalStatus) || other.medicalStatus == medicalStatus)&&(identical(other.medicalDescription, medicalDescription) || other.medicalDescription == medicalDescription)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.applicant, applicant) || other.applicant == applicant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,applicantId,trainingId,disciplineStatus,disciplineDescription,trainingStatus,trainingDescription,experience,experienceDescription,retirementStatus,retirementDescription,medicalStatus,medicalDescription,selectedStatus,entryBy,entryDate,applicant);

@override
String toString() {
  return 'ApplicantSelection(id: $id, applicationId: $applicationId, applicantId: $applicantId, trainingId: $trainingId, disciplineStatus: $disciplineStatus, disciplineDescription: $disciplineDescription, trainingStatus: $trainingStatus, trainingDescription: $trainingDescription, experience: $experience, experienceDescription: $experienceDescription, retirementStatus: $retirementStatus, retirementDescription: $retirementDescription, medicalStatus: $medicalStatus, medicalDescription: $medicalDescription, selectedStatus: $selectedStatus, entryBy: $entryBy, entryDate: $entryDate, applicant: $applicant)';
}


}

/// @nodoc
abstract mixin class _$ApplicantSelectionCopyWith<$Res> implements $ApplicantSelectionCopyWith<$Res> {
  factory _$ApplicantSelectionCopyWith(_ApplicantSelection value, $Res Function(_ApplicantSelection) _then) = __$ApplicantSelectionCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? applicationId, String? applicantId, int? trainingId, bool? disciplineStatus, String? disciplineDescription, bool? trainingStatus, String? trainingDescription, bool? experience, String? experienceDescription, bool? retirementStatus, String? retirementDescription, bool? medicalStatus, String? medicalDescription, ApplicantStatus? selectedStatus, String? entryBy, DateTime? entryDate, TrainingApplicant? applicant
});


@override $TrainingApplicantCopyWith<$Res>? get applicant;

}
/// @nodoc
class __$ApplicantSelectionCopyWithImpl<$Res>
    implements _$ApplicantSelectionCopyWith<$Res> {
  __$ApplicantSelectionCopyWithImpl(this._self, this._then);

  final _ApplicantSelection _self;
  final $Res Function(_ApplicantSelection) _then;

/// Create a copy of ApplicantSelection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? applicationId = freezed,Object? applicantId = freezed,Object? trainingId = freezed,Object? disciplineStatus = freezed,Object? disciplineDescription = freezed,Object? trainingStatus = freezed,Object? trainingDescription = freezed,Object? experience = freezed,Object? experienceDescription = freezed,Object? retirementStatus = freezed,Object? retirementDescription = freezed,Object? medicalStatus = freezed,Object? medicalDescription = freezed,Object? selectedStatus = freezed,Object? entryBy = freezed,Object? entryDate = freezed,Object? applicant = freezed,}) {
  return _then(_ApplicantSelection(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as int?,applicantId: freezed == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String?,trainingId: freezed == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as int?,disciplineStatus: freezed == disciplineStatus ? _self.disciplineStatus : disciplineStatus // ignore: cast_nullable_to_non_nullable
as bool?,disciplineDescription: freezed == disciplineDescription ? _self.disciplineDescription : disciplineDescription // ignore: cast_nullable_to_non_nullable
as String?,trainingStatus: freezed == trainingStatus ? _self.trainingStatus : trainingStatus // ignore: cast_nullable_to_non_nullable
as bool?,trainingDescription: freezed == trainingDescription ? _self.trainingDescription : trainingDescription // ignore: cast_nullable_to_non_nullable
as String?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as bool?,experienceDescription: freezed == experienceDescription ? _self.experienceDescription : experienceDescription // ignore: cast_nullable_to_non_nullable
as String?,retirementStatus: freezed == retirementStatus ? _self.retirementStatus : retirementStatus // ignore: cast_nullable_to_non_nullable
as bool?,retirementDescription: freezed == retirementDescription ? _self.retirementDescription : retirementDescription // ignore: cast_nullable_to_non_nullable
as String?,medicalStatus: freezed == medicalStatus ? _self.medicalStatus : medicalStatus // ignore: cast_nullable_to_non_nullable
as bool?,medicalDescription: freezed == medicalDescription ? _self.medicalDescription : medicalDescription // ignore: cast_nullable_to_non_nullable
as String?,selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as TrainingApplicant?,
  ));
}

/// Create a copy of ApplicantSelection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingApplicantCopyWith<$Res>? get applicant {
    if (_self.applicant == null) {
    return null;
  }

  return $TrainingApplicantCopyWith<$Res>(_self.applicant!, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}
}

// dart format on
