// lib/features/training/domain/training_application_request.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';

part 'training_application_request.freezed.dart';
part 'training_application_request.g.dart';

@freezed
abstract class TrainingApplicationRequest with _$TrainingApplicationRequest {
  factory TrainingApplicationRequest({
    // id can be omitted if the backend generates it
    required String applicantId,
    required int appliedFor,
    required ApplicantStatus applicantStatus,
    double? cgpa,
    required int age,
    String? applicantEntryBy,
    DateTime? applicantEntryDate,
  }) = _TrainingApplicationRequest;

  factory TrainingApplicationRequest.fromJson(Map<String, dynamic> json) =>
      _$TrainingApplicationRequestFromJson(json);
}