// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_evaluation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApplicantEvaluation _$ApplicantEvaluationFromJson(
  Map<String, dynamic> json,
) => _ApplicantEvaluation(
  selectionId: (json['selectionId'] as num).toInt(),
  employeeId: json['employeeId'] as String,
  performanceScore: (json['performanceScore'] as num?)?.toDouble(),
  performanceExpectation: (json['performanceExpectation'] as num?)?.toDouble(),
  serviceScore: (json['serviceScore'] as num?)?.toDouble(),
  serviceExpectation: (json['serviceExpectation'] as num?)?.toDouble(),
  educationScore: (json['educationScore'] as num?)?.toDouble(),
  educationExpectation: (json['educationExpectation'] as num?)?.toDouble(),
  trainingRelevanceScore: (json['trainingRelevanceScore'] as num?)?.toDouble(),
  trainingRelevanceExpectation:
      (json['trainingRelevanceExpectation'] as num?)?.toDouble(),
  ageScore: (json['ageScore'] as num?)?.toDouble(),
  ageExpectation: (json['ageExpectation'] as num?)?.toDouble(),
  profileQualityScore: (json['profileQualityScore'] as num?)?.toDouble(),
  profileQualityExpectation:
      (json['profileQualityExpectation'] as num?)?.toDouble(),
  affirmativeScore: (json['affirmativeScore'] as num?)?.toDouble(),
  affirmativeExpectation: $enumDecodeNullable(
    _$GenderEnumMap,
    json['affirmativeExpectation'],
  ),
  hasPriority: json['hasPriority'] as bool? ?? false,
  totalScore: (json['totalScore'] as num?)?.toDouble() ?? 0.0,
  comments: json['comments'] as String? ?? '',
  evaluationStatus: $enumDecodeNullable(
    _$ApplicantStatusEnumMap,
    json['evaluationStatus'],
  ),
  enteredBy: json['enteredBy'] as String,
  entryDate: DateTime.parse(json['entryDate'] as String),
  selectedApplicant:
      json['selectedApplicant'] == null
          ? null
          : ApplicantSelection.fromJson(
            json['selectedApplicant'] as Map<String, dynamic>,
          ),
  meetsMinimumRequirements: json['meetsMinimumRequirements'] as bool? ?? false,
  calculateWeightedTotal:
      (json['calculateWeightedTotal'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$ApplicantEvaluationToJson(
  _ApplicantEvaluation instance,
) => <String, dynamic>{
  'selectionId': instance.selectionId,
  'employeeId': instance.employeeId,
  'performanceScore': instance.performanceScore,
  'performanceExpectation': instance.performanceExpectation,
  'serviceScore': instance.serviceScore,
  'serviceExpectation': instance.serviceExpectation,
  'educationScore': instance.educationScore,
  'educationExpectation': instance.educationExpectation,
  'trainingRelevanceScore': instance.trainingRelevanceScore,
  'trainingRelevanceExpectation': instance.trainingRelevanceExpectation,
  'ageScore': instance.ageScore,
  'ageExpectation': instance.ageExpectation,
  'profileQualityScore': instance.profileQualityScore,
  'profileQualityExpectation': instance.profileQualityExpectation,
  'affirmativeScore': instance.affirmativeScore,
  'affirmativeExpectation': _$GenderEnumMap[instance.affirmativeExpectation],
  'hasPriority': instance.hasPriority,
  'totalScore': instance.totalScore,
  'comments': instance.comments,
  'evaluationStatus': _$ApplicantStatusEnumMap[instance.evaluationStatus],
  'enteredBy': instance.enteredBy,
  'entryDate': instance.entryDate.toIso8601String(),
  'selectedApplicant': instance.selectedApplicant,
  'meetsMinimumRequirements': instance.meetsMinimumRequirements,
  'calculateWeightedTotal': instance.calculateWeightedTotal,
};

const _$GenderEnumMap = {Gender.male: 0, Gender.female: 1, Gender.other: 2};

const _$ApplicantStatusEnumMap = {
  ApplicantStatus.pending: 0,
  ApplicantStatus.submitted: 1,
  ApplicantStatus.selected: 2,
  ApplicantStatus.rejected: 3,
  ApplicantStatus.underReview: 4,
  ApplicantStatus.offered: 5,
  ApplicantStatus.completed: 6,
  ApplicantStatus.progress: 7,
  ApplicantStatus.withdrawn: 8,
};
