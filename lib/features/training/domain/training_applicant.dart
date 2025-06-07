import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';

part 'training_applicant.freezed.dart';
part 'training_applicant.g.dart';

@freezed
abstract class TrainingApplicant with _$TrainingApplicant {
  const factory TrainingApplicant({
    required int trainingApplicantId,
    required int trainingId,
    required String employeeId,
    String? employeeFullName, // For display purposes
    String? employeePhotoPath, // For display purposes
    required DateTime appliedDate,
    required ApplicantStatus status,
    String? reasonForRejection,
    String? appealReason,
    DateTime? appealDate,
  }) = _TrainingApplicant;

  factory TrainingApplicant.fromJson(Map<String, dynamic> json) =>
      _$TrainingApplicantFromJson(json);
}
