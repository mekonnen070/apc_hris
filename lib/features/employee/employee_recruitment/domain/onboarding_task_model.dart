import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/onboarding_task_status.dart';
import 'package:police_com/core/enums/task_assignee_type.dart';

part 'onboarding_task_model.freezed.dart';
part 'onboarding_task_model.g.dart';

@freezed
abstract class OnboardingTaskModel with _$OnboardingTaskModel {
  const factory OnboardingTaskModel({
    required String id, // Unique ID for the onboarding task
    required String applicantId, // ID of the applicant/new hire being onboarded
    required String title,
    String? description,
    @Default(OnboardingTaskStatus.pending) OnboardingTaskStatus status,
    DateTime? dueDate,
    DateTime? completionDate,
    @Default(TaskAssigneeType.hr)
    TaskAssigneeType assignedTo, // Who is primarily responsible
    String? notes, // For HR or new hire to add comments
    // For tasks that require document upload by the new hire
    String? requiredDocumentName,
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? uploadedDocumentFile, // Local file
    String? uploadedDocumentPath, // Path/URL after backend upload
    // For checklist items from ApplicantCheckListVm.cs
    @Default(false)
    bool isChecklistItem, // To identify tasks that are simple checks
    String? checkRemark,

    String? createdBy, // User ID of who created the task (if manually added)
    DateTime? createdAt,
  }) = _OnboardingTaskModel;

  factory OnboardingTaskModel.fromJson(Map<String, dynamic> json) =>
      _$OnboardingTaskModelFromJson(json);
}
