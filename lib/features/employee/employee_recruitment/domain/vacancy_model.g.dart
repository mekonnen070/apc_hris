// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VacancyModel _$VacancyModelFromJson(Map<String, dynamic> json) =>
    _VacancyModel(
      id: json['id'] as String,
      positionTitle: json['positionTitle'] as String,
      department: json['department'] as String,
      sectionOrUnit: json['sectionOrUnit'] as String?,
      location: json['location'] as String,
      description: json['description'] as String,
      responsibilities:
          (json['responsibilities'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      qualifications:
          (json['qualifications'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      preferredQualifications:
          (json['preferredQualifications'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      employmentType: $enumDecode(
        _$EmploymentTypeVacancyEnumMap,
        json['employmentType'],
      ),
      numberOfOpenings: (json['numberOfOpenings'] as num?)?.toInt() ?? 1,
      postingDate: DateTime.parse(json['postingDate'] as String),
      closingDate: DateTime.parse(json['closingDate'] as String),
      status:
          $enumDecodeNullable(_$VacancyStatusEnumMap, json['status']) ??
          VacancyStatus.open,
      positionGrade: json['positionGrade'] as String?,
      gradeSalary: (json['gradeSalary'] as num?)?.toDouble(),
      salaryRange: json['salaryRange'] as String?,
      applicationProcedure: json['applicationProcedure'] as String,
      contactEmail: json['contactEmail'] as String?,
      contactPhone: json['contactPhone'] as String?,
      reportingToPositionId: json['reportingToPositionId'] as String?,
      contactPersonEmployeeId: json['contactPersonEmployeeId'] as String?,
      keywords:
          (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      internalNotes: json['internalNotes'] as String?,
    );

Map<String, dynamic> _$VacancyModelToJson(
  _VacancyModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'positionTitle': instance.positionTitle,
  'department': instance.department,
  'sectionOrUnit': instance.sectionOrUnit,
  'location': instance.location,
  'description': instance.description,
  'responsibilities': instance.responsibilities,
  'qualifications': instance.qualifications,
  'preferredQualifications': instance.preferredQualifications,
  'employmentType': _$EmploymentTypeVacancyEnumMap[instance.employmentType]!,
  'numberOfOpenings': instance.numberOfOpenings,
  'postingDate': instance.postingDate.toIso8601String(),
  'closingDate': instance.closingDate.toIso8601String(),
  'status': _$VacancyStatusEnumMap[instance.status]!,
  'positionGrade': instance.positionGrade,
  'gradeSalary': instance.gradeSalary,
  'salaryRange': instance.salaryRange,
  'applicationProcedure': instance.applicationProcedure,
  'contactEmail': instance.contactEmail,
  'contactPhone': instance.contactPhone,
  'reportingToPositionId': instance.reportingToPositionId,
  'contactPersonEmployeeId': instance.contactPersonEmployeeId,
  'keywords': instance.keywords,
  'internalNotes': instance.internalNotes,
};

const _$EmploymentTypeVacancyEnumMap = {
  EmploymentTypeVacancy.fullTime: 'fullTime',
  EmploymentTypeVacancy.partTime: 'partTime',
  EmploymentTypeVacancy.contractual: 'contractual',
  EmploymentTypeVacancy.temporaryAssignment: 'temporaryAssignment',
  EmploymentTypeVacancy.internship: 'internship',
};

const _$VacancyStatusEnumMap = {
  VacancyStatus.open: 'open',
  VacancyStatus.closed: 'closed',
  VacancyStatus.filled: 'filled',
  VacancyStatus.pendingApproval: 'pendingApproval',
  VacancyStatus.draft: 'draft',
};
