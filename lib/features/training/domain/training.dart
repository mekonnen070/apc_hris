import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/gender.dart';
import 'package:police_com/core/enums/general_status.dart';
import 'package:police_com/core/enums/qualification_type.dart';
import 'package:police_com/core/enums/training_modality.dart';
import 'package:police_com/core/enums/training_warranty.dart';
import 'package:police_com/features/training/domain/development_plan.dart';
import 'package:police_com/features/training/domain/training_applicant.dart';

part 'training.freezed.dart';
part 'training.g.dart';

@freezed
abstract class Training with _$Training {
  factory Training({
    required int trainingId,
    required String trainingName,
    required String trainingType,
    required TrainingModality trainingModality,
    required TrainingWarranty trainingWarranty,
    required QualificationType trainingQualification,
    required String trainingDescription,
    required String trainingLocation,
    required String trainingInstitution,
    required DateTime trainingStartDate,
    required DateTime trainingEndDate,
    required int traineeRequired,
    @Default(0) int traineeActual,
    required String requiredEducation,
    required int requiredExperience,
    required Gender requiredSex,
    required double trainingCost,
    required GeneralStatus trainingStatus,
    required String registrationLocation,
    required DateTime postEndDate,
    required String trainingEntryBy,
    required DateTime trainingEntryDate,
    required DevelopmentPlan developmentType,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<TrainingApplicant?> applicantList,
  }) = _Training;

  factory Training.fromJson(Map<String, dynamic> json) =>
      _$TrainingFromJson(json);
}
