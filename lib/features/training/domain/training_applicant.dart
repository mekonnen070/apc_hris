import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/training/domain/applicant_selection.dart';
import 'package:police_com/features/training/domain/training.dart';

part 'training_applicant.freezed.dart';
part 'training_applicant.g.dart';

@freezed
abstract class TrainingApplicant with _$TrainingApplicant {
  factory TrainingApplicant({
    int? id,
    required String applicantId,
    required int appliedFor,
    ApplicantStatus? applicantStatus,
    double? cgpa,
    required int age,
    String? applicantEntryBy,
    DateTime? applicantEntryDate,
    EmployeeInfoModel? employee,
    Training? training,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<ApplicantSelection?> applicantSelections,
  }) = _TrainingApplicant;

  factory TrainingApplicant.fromJson(Map<String, dynamic> json) =>
      _$TrainingApplicantFromJson(json);
}
