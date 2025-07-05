import 'dart:io'; // For File type (photoFile)

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/blood_group.dart';
import 'package:police_com/core/enums/country.dart';
import 'package:police_com/core/enums/employee_type.dart';
import 'package:police_com/core/enums/employment_status.dart';
import 'package:police_com/core/enums/gender.dart';
import 'package:police_com/core/enums/marital_status.dart';
import 'package:police_com/core/enums/medical_status.dart';
import 'package:police_com/core/enums/religion.dart';
import 'package:police_com/core/enums/staff_title.dart';

// Import models for collections if you intend to use them directly within this model.
// For initial creation, these might be handled separately.
import 'employee_contact_model.dart';
import 'employee_dependant_model.dart';
import 'employee_education_model.dart';
import 'employee_experience_model.dart';
import 'employee_performance_model.dart';
import 'employee_spouse_model.dart';
import 'employee_upload_model.dart'; // For a list of general documents

// Other models like EmploymentHistory, EmployeeLeave, RetirementInfo, TrainingApplicant would also be imported if used.

part 'employee_info_model.freezed.dart';
part 'employee_info_model.g.dart';

@freezed
abstract class EmployeeInfoModel with _$EmployeeInfoModel {
  // This private constructor is necessary for adding custom getters like [computedFullName].
  // The lint warning about it being unreferenced can be safely ignored.
  const EmployeeInfoModel._();

  // Represents the core information for an employee.
  const factory EmployeeInfoModel({
    // Identifying Information
    required String employeeId, // Primary Key, C# [Required]
    StaffTitle? title,
    required String firstName,
    String? fatherName,
    String? grandName,

    // Personal Details
    required Gender gender,
    required DateTime birthDate, // C# [Required] & [AgeValidation]
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? photoFile, // Local file for upload
    String? photoUrl, // Corresponds to C# PhotoPath, stores URL from backend
    String? motherName, // C# MotherFullName
    // Positional & Reporting Structure
    required String positionId, // Foreign key to CommissionDesignation
    String? managerId, // Foreign key to another EmployeeInfo (self-referential)
    // Contact & Address Details
    required String address1,
    String? address2,
    String? houseNumber,
    required String phone,
    required String mobile,
    required String email, // C# [Required]
    // Other Attributes
    @Default(Country.ethiopia)
    Country nationality, // C# [Required], has default
    @Default(BloodGroup.unknown) BloodGroup bloodGroup,
    @Default(Religion.other)
    Religion religion, // Assuming Religion.other is a valid default
    @Default(MedicalStatus.pending)
    MedicalStatus medicalStatus, // C# [Required], has default
    String? retirementNumber,
    String? tin, // C# TIN
    @Default(MaritalStatus.single)
    MaritalStatus maritalStatus, // C# [Required], has default
    // Employment Specifics
    @Default(EmploymentStatus.active) EmploymentStatus employmentStatus,
    @Default(false) bool isManager,
    @Default(EmployeeType.military) EmployeeType employeeType, // C# default
    required DateTime
    hiredDate, // C# has default, but likely required for new employee
    DateTime?
    retirementEligibilityDate, // Backend calculated, optional on input
    // Audit fields - typically set by the backend
    String? entryBy,
    DateTime?
    entryDate, // C# EmployeeInfo has non-nullable EntryDate with default
    // Collections of related data.
    @Default([]) List<EmployeeContactModel> employeeContacts,
    @Default([]) List<EmployeeDependantModel> employeeDependants,
    @Default([]) List<EmployeeEducationModel> employeeEducations,
    @Default([]) List<EmployeeExperienceModel> employeeExperiences,
    @Default([]) List<EmployeePerformanceModel> performances,
    @Default([]) List<EmployeeSpouseModel> employeeSpouse,
    @Default([]) List<EmployeeUploadModel> generalDocuments,
  }) = _EmployeeInfoModel;

  factory EmployeeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoModelFromJson(json);

  String get computedFullName {
    final parts = [firstName, fatherName, grandName];
    return parts  
        .where((part) => part != null && part.isNotEmpty)
        .join(' ')
        .trim();
  }
}
