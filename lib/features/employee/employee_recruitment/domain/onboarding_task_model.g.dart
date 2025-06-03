// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingTaskModel _$OnboardingTaskModelFromJson(Map<String, dynamic> json) =>
    _OnboardingTaskModel(
      id: json['id'] as String,
      applicantId: json['applicantId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      status:
          $enumDecodeNullable(_$OnboardingTaskStatusEnumMap, json['status']) ??
          OnboardingTaskStatus.pending,
      dueDate:
          json['dueDate'] == null
              ? null
              : DateTime.parse(json['dueDate'] as String),
      completionDate:
          json['completionDate'] == null
              ? null
              : DateTime.parse(json['completionDate'] as String),
      assignedTo:
          $enumDecodeNullable(_$TaskAssigneeTypeEnumMap, json['assignedTo']) ??
          TaskAssigneeType.hr,
      notes: json['notes'] as String?,
      requiredDocumentName: json['requiredDocumentName'] as String?,
      uploadedDocumentPath: json['uploadedDocumentPath'] as String?,
      isChecklistItem: json['isChecklistItem'] as bool? ?? false,
      checkRemark: json['checkRemark'] as String?,
      createdBy: json['createdBy'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$OnboardingTaskModelToJson(
  _OnboardingTaskModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'applicantId': instance.applicantId,
  'title': instance.title,
  'description': instance.description,
  'status': _$OnboardingTaskStatusEnumMap[instance.status]!,
  'dueDate': instance.dueDate?.toIso8601String(),
  'completionDate': instance.completionDate?.toIso8601String(),
  'assignedTo': _$TaskAssigneeTypeEnumMap[instance.assignedTo]!,
  'notes': instance.notes,
  'requiredDocumentName': instance.requiredDocumentName,
  'uploadedDocumentPath': instance.uploadedDocumentPath,
  'isChecklistItem': instance.isChecklistItem,
  'checkRemark': instance.checkRemark,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$OnboardingTaskStatusEnumMap = {
  OnboardingTaskStatus.pending: 'pending',
  OnboardingTaskStatus.inProgress: 'inProgress',
  OnboardingTaskStatus.completed: 'completed',
  OnboardingTaskStatus.waived: 'waived',
  OnboardingTaskStatus.requiresAttention: 'requiresAttention',
};

const _$TaskAssigneeTypeEnumMap = {
  TaskAssigneeType.hr: 'hr',
  TaskAssigneeType.newHire: 'newHire',
  TaskAssigneeType.system: 'system',
  TaskAssigneeType.manager: 'manager',
};
