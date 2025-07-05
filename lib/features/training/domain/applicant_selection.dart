import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/training/domain/training_applicant.dart';

part 'applicant_selection.freezed.dart';
part 'applicant_selection.g.dart';

@freezed
abstract class ApplicantSelection with _$ApplicantSelection {
  factory ApplicantSelection({
    int? id,
    int? applicationId,
    String? applicantId,
    int? trainingId,
    bool? disciplineStatus,
    String? disciplineDescription,
    bool? trainingStatus,
    String? trainingDescription,
    bool? experience,
    String? experienceDescription,
    bool? retirementStatus,
    String? retirementDescription,
    bool? medicalStatus,
    String? medicalDescription,
    ApplicantStatus? selectedStatus,
    String? entryBy,
    DateTime? entryDate,
    TrainingApplicant? applicant,
  }) = _ApplicantSelection;

  factory ApplicantSelection.fromJson(Map<String, dynamic> json) =>
      _$ApplicantSelectionFromJson(json);
}
