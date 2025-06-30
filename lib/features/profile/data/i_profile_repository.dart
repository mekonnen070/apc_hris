// lib/features/profile/data/i_profile_repository.dart

import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';

abstract class IProfileRepository {
  Future<EmployeeInfoModel> getEmployeeProfile({required String employeeId});

  // The Architect's Note: ADDED - This is the missing contract method.
  // It is used for updating the top-level personal information fields.
  Future<void> updateEmployeeProfile(EmployeeInfoModel employeeInfo);

  // Education
  Future<void> addEducation(String employeeId, EmployeeEducationModel education);
  Future<void> updateEducation(String employeeId, EmployeeEducationModel education);
  Future<void> deleteEducation(String employeeId, String educationId);

  // Experience
  Future<void> addExperience(String employeeId, EmployeeExperienceModel experience);
  Future<void> updateExperience(String employeeId, EmployeeExperienceModel experience);
  Future<void> deleteExperience(String employeeId, String experienceId);

  // Dependant
  Future<void> addDependant(String employeeId, EmployeeDependantModel dependant);
  Future<void> updateDependant(String employeeId, EmployeeDependantModel dependant);
  Future<void> deleteDependant(String employeeId, String dependantId);

  // Contact
  Future<void> addContact(String employeeId, EmployeeContactModel contact);
  Future<void> updateContact(String employeeId, EmployeeContactModel contact);
  Future<void> deleteContact(String employeeId, String contactId);

  // Spouse
  Future<void> addSpouse(String employeeId, EmployeeSpouseModel spouse);
  Future<void> updateSpouse(String employeeId, EmployeeSpouseModel spouse);
  Future<void> deleteSpouse(String employeeId, String spouseId);
}