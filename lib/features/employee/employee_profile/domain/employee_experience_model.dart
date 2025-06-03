import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/organization_type.dart';
import 'package:police_com/core/enums/proficiency_level.dart';

part 'employee_experience_model.freezed.dart';
part 'employee_experience_model.g.dart';

@freezed
abstract class EmployeeExperienceModel with _$EmployeeExperienceModel {
  const factory EmployeeExperienceModel({
    String? experienceId,
    required String employeeId, // C# is nullable, likely required for admin adding
    String? organization,
    required OrganizationType organizationType, // C# 'Organizations'
    String? position,
    @Default('') String responsibilities,
    @Default(ProficiencyLevel.beginner) ProficiencyLevel proficiencyLevel,
    required DateTime joinDate,
    DateTime? separationDate, // C# is not nullable, but often can be for current job
    String? separationNotes,
    String? entryBy,
    DateTime? entryDate, // C# is not nullable, made nullable
  }) = _EmployeeExperienceModel;

  factory EmployeeExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeExperienceModelFromJson(json);
}