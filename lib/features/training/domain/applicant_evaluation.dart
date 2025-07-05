import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/core/enums/gender.dart';
import 'package:police_com/features/training/domain/applicant_selection.dart';

part 'applicant_evaluation.freezed.dart';
part 'applicant_evaluation.g.dart';

@freezed
abstract class ApplicantEvaluation with _$ApplicantEvaluation {
  factory ApplicantEvaluation({
    required int selectionId,
    required String employeeId,
    double? performanceScore,
    double? performanceExpectation,
    double? serviceScore,
    double? serviceExpectation,
    double? educationScore,
    double? educationExpectation,
    double? trainingRelevanceScore,
    double? trainingRelevanceExpectation,
    double? ageScore,
    double? ageExpectation,
    double? profileQualityScore,
    double? profileQualityExpectation,
    double? affirmativeScore,
    Gender? affirmativeExpectation,
    @Default(false) bool hasPriority,
    @Default(0.0) double totalScore,
    @Default('') String comments,
    ApplicantStatus? evaluationStatus,
    required String enteredBy,
    required DateTime entryDate,
    ApplicantSelection? selectedApplicant,
    @Default(false) bool meetsMinimumRequirements,
    @Default(0.0) double calculateWeightedTotal,
  }) = _ApplicantEvaluation;

  factory ApplicantEvaluation.fromJson(Map<String, dynamic> json) =>
      _$ApplicantEvaluationFromJson(json);
}
