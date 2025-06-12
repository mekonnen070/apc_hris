// ignore_for_file: invalid_annotation_target

import 'dart:io'; // For File

import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_experience.freezed.dart';
part 'work_experience.g.dart';

@freezed
abstract class WorkExperience with _$WorkExperience {
  factory WorkExperience({
    required String id, // Unique identifier
    required String companyName,
    required String jobTitle,
    String? responsibilities, // Could be a longer text
    required DateTime startDate,
    DateTime? endDate, // Nullable if current job
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? experienceLetterFile, // Local file before upload
    String? experienceLetterUrl, // URL after upload
  }) = _WorkExperience;

  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceFromJson(json);
}
