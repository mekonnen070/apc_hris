// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_performance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeePerformanceModel _$EmployeePerformanceModelFromJson(
  Map<String, dynamic> json,
) => _EmployeePerformanceModel(
  performanceId: (json['performanceId'] as num?)?.toInt() ?? 0,
  employeeId: json['employeeId'] as String,
  scorePoint: (json['scorePoint'] as num).toInt(),
  rating: (json['rating'] as num?)?.toInt() ?? 1,
  comments: json['comments'] as String?,
  evaluationDate: DateTime.parse(json['evaluationDate'] as String),
  evaluatorName: json['evaluatorName'] as String,
  keyAchievements: json['keyAchievements'] as String?,
  areasForImprovement: json['areasForImprovement'] as String?,
  fromDate:
      json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
  toDate:
      json['toDate'] == null ? null : DateTime.parse(json['toDate'] as String),
  nextEvaluationDate:
      json['nextEvaluationDate'] == null
          ? null
          : DateTime.parse(json['nextEvaluationDate'] as String),
  updateBy: json['updateBy'] as String?,
  updateDate:
      json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
);

Map<String, dynamic> _$EmployeePerformanceModelToJson(
  _EmployeePerformanceModel instance,
) => <String, dynamic>{
  'performanceId': instance.performanceId,
  'employeeId': instance.employeeId,
  'scorePoint': instance.scorePoint,
  'rating': instance.rating,
  'comments': instance.comments,
  'evaluationDate': instance.evaluationDate.toIso8601String(),
  'evaluatorName': instance.evaluatorName,
  'keyAchievements': instance.keyAchievements,
  'areasForImprovement': instance.areasForImprovement,
  'fromDate': instance.fromDate?.toIso8601String(),
  'toDate': instance.toDate?.toIso8601String(),
  'nextEvaluationDate': instance.nextEvaluationDate?.toIso8601String(),
  'updateBy': instance.updateBy,
  'updateDate': instance.updateDate?.toIso8601String(),
};
