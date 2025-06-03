import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/employee/employee_profile/domain/academic_qualification.dart';
import 'package:police_com/features/employee/employee_profile/domain/general_document.dart';
import 'package:police_com/features/employee/employee_profile/domain/personal_info.dart';
import 'package:police_com/features/employee/employee_profile/domain/work_experience.dart';

part 'registration_form_data.freezed.dart';

@freezed
abstract class RegistrationFormData with _$RegistrationFormData {
  const factory RegistrationFormData({
    // Personal Information (mandatory after its step)
    PersonalInfo? personalInfo,

    // Academic Qualifications (list, can be empty)
    @Default([]) List<AcademicQualification> academicQualifications,

    // Work Experiences (list, can be empty)
    @Default([]) List<WorkExperience> workExperiences,

    // Specific mandatory document files (local representation)
    @JsonKey(includeFromJson: false, includeToJson: false) File? cvFile,
    @JsonKey(includeFromJson: false, includeToJson: false) File? nationalIdFile,

    // Other supporting documents (list, can be empty)
    @Default([]) List<GeneralDocument> otherDocuments,
  }) = _RegistrationFormData;
}
