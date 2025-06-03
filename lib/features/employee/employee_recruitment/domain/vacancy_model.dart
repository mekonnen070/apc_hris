import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/employment_type_vacancy.dart';
import 'package:police_com/core/enums/vacancy_status.dart';

part 'vacancy_model.freezed.dart';
part 'vacancy_model.g.dart';

@freezed
abstract class VacancyModel with _$VacancyModel {
  const factory VacancyModel({
    required String id, // Unique ID for the vacancy (maps to RefNo)
    required String positionTitle, // e.g., "Sergeant - Patrol Division"
    required String department, // e.g., "Patrol Division", "CID"
    String? sectionOrUnit, // More specific unit
    required String location, // e.g., "Bahir Dar Central Station"
    required String description, // Detailed job description
    required List<String> responsibilities,
    required List<String> qualifications, // Required skills, education, experience
    List<String>? preferredQualifications,
    required EmploymentTypeVacancy employmentType,
    @Default(1) int numberOfOpenings,
    required DateTime postingDate,
    required DateTime closingDate,
    @Default(VacancyStatus.open) VacancyStatus status, // Default to Open for display
    String? positionGrade, // New: e.g., "PSG-5" (Police Sergeant Grade 5)
    double? gradeSalary, // New: Specific salary if available, otherwise use salaryRange
    String? salaryRange, // e.g., "ETB 15,000 - 20,000" or "As per commission scale"
    required String applicationProcedure, // New: How to apply
    String? contactEmail, // New: Direct contact email for inquiries
    String? contactPhone, // New: Direct contact phone for inquiries
    String? reportingToPositionId, // ID of the position this role reports to
    String? contactPersonEmployeeId, // Employee ID of HR contact (if internal)
    List<String>? keywords, // For searchability
    String? internalNotes, // For HR use only
  }) = _VacancyModel;

  factory VacancyModel.fromJson(Map<String, dynamic> json) =>
      _$VacancyModelFromJson(json);
}

// To generate the .freezed.dart and .g.dart files, you would run:
// flutter pub run build_runner build --delete-conflicting-outputs
