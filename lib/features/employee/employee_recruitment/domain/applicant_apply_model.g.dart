// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_apply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApplicantApplyModel _$ApplicantApplyModelFromJson(Map<String, dynamic> json) =>
    _ApplicantApplyModel(
      applicantId: (json['applicantId'] as num?)?.toInt(),
      appliedToVacancyId: json['appliedTo'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String?,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      address: json['address'] as String,
      nationality: json['nationality'] as String,
      resumePath: json['resumePath'] as String?,
      identificationNumber: json['identificationNumber'] as String?,
      identificationType:
          $enumDecodeNullable(
            _$IdentificationTypeEnumMap,
            json['identificationType'],
          ) ??
          IdentificationType.nationalId,
      interviewScheduledTime:
          json['interviewScheduledTime'] == null
              ? null
              : DateTime.parse(json['interviewScheduledTime'] as String),
      interviewerName: json['interviewerName'] as String?,
      interviewerFeedback: json['interviewerFeedback'] as String?,
      interviewScore: (json['interviewScore'] as num?)?.toDouble(),
      examScheduledTime:
          json['examScheduledTime'] == null
              ? null
              : DateTime.parse(json['examScheduledTime'] as String),
      examinerName: json['examinerName'] as String?,
      examinerFeedback: json['examinerFeedback'] as String?,
      examScore: (json['examScore'] as num?)?.toDouble(),
      backgroundCheck: json['backgroundCheck'] as bool? ?? false,
      backgroundCheckRemark: json['backgroundCheckRemark'] as String?,
      referenceCheck: json['referenceCheck'] as bool? ?? false,
      referenceCheckRemark: json['referenceCheckRemark'] as String?,
      medicalCheck: json['medicalCheck'] as bool? ?? false,
      medicalCheckRemark: json['medicalCheckRemark'] as String?,
      finalCheck: json['finalCheck'] as bool? ?? false,
      finalCheckRemark: json['finalCheckRemark'] as String?,
      isOnBoarding: json['isOnBoarding'] as bool? ?? false,
      isOnBoardingRemark: json['isOnBoardingRemark'] as String?,
      status:
          $enumDecodeNullable(_$RecruitmentStatusEnumMap, json['status']) ??
          RecruitmentStatus.submitted,
      entryDate:
          json['entryDate'] == null
              ? null
              : DateTime.parse(json['entryDate'] as String),
      entryBy: json['entryBy'] as String?,
    );

Map<String, dynamic> _$ApplicantApplyModelToJson(
  _ApplicantApplyModel instance,
) => <String, dynamic>{
  'applicantId': instance.applicantId,
  'appliedTo': instance.appliedToVacancyId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'middleName': instance.middleName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'dateOfBirth': instance.dateOfBirth.toIso8601String(),
  'gender': _$GenderEnumMap[instance.gender]!,
  'address': instance.address,
  'nationality': instance.nationality,
  'resumePath': instance.resumePath,
  'identificationNumber': instance.identificationNumber,
  'identificationType':
      _$IdentificationTypeEnumMap[instance.identificationType]!,
  'interviewScheduledTime': instance.interviewScheduledTime?.toIso8601String(),
  'interviewerName': instance.interviewerName,
  'interviewerFeedback': instance.interviewerFeedback,
  'interviewScore': instance.interviewScore,
  'examScheduledTime': instance.examScheduledTime?.toIso8601String(),
  'examinerName': instance.examinerName,
  'examinerFeedback': instance.examinerFeedback,
  'examScore': instance.examScore,
  'backgroundCheck': instance.backgroundCheck,
  'backgroundCheckRemark': instance.backgroundCheckRemark,
  'referenceCheck': instance.referenceCheck,
  'referenceCheckRemark': instance.referenceCheckRemark,
  'medicalCheck': instance.medicalCheck,
  'medicalCheckRemark': instance.medicalCheckRemark,
  'finalCheck': instance.finalCheck,
  'finalCheckRemark': instance.finalCheckRemark,
  'isOnBoarding': instance.isOnBoarding,
  'isOnBoardingRemark': instance.isOnBoardingRemark,
  'status': _$RecruitmentStatusEnumMap[instance.status]!,
  'entryDate': instance.entryDate?.toIso8601String(),
  'entryBy': instance.entryBy,
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$IdentificationTypeEnumMap = {
  IdentificationType.nationalId: 'nationalId',
  IdentificationType.passport: 'passport',
  IdentificationType.driverLicense: 'driverLicense',
  IdentificationType.organizationId: 'organizationId',
};

const _$RecruitmentStatusEnumMap = {
  RecruitmentStatus.submitted: 'submitted',
  RecruitmentStatus.rejected: 'rejected',
  RecruitmentStatus.shortListed: 'shortListed',
  RecruitmentStatus.failed: 'failed',
  RecruitmentStatus.waitListed: 'waitListed',
  RecruitmentStatus.hired: 'hired',
  RecruitmentStatus.applicationViewed: 'applicationViewed',
  RecruitmentStatus.interviewScheduled: 'interviewScheduled',
  RecruitmentStatus.examScheduled: 'examScheduled',
  RecruitmentStatus.offerExtended: 'offerExtended',
  RecruitmentStatus.offerDeclined: 'offerDeclined',
  RecruitmentStatus.onboarding: 'onboarding',
};
