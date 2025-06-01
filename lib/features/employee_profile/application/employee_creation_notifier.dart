import 'dart:io'; // For File type

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/blood_group.dart';
import 'package:police_com/core/enums/country.dart';
import 'package:police_com/core/enums/education_level.dart';
import 'package:police_com/core/enums/education_status.dart';
import 'package:police_com/core/enums/employee_type.dart';
import 'package:police_com/core/enums/employment_status.dart';
import 'package:police_com/core/enums/ethiopian_university.dart';
import 'package:police_com/core/enums/field_of_study.dart';
import 'package:police_com/core/enums/gender.dart';
import 'package:police_com/core/enums/marital_status.dart';
import 'package:police_com/core/enums/medical_status.dart';
import 'package:police_com/core/enums/relation_types.dart';
import 'package:police_com/core/enums/religion.dart';
import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_performance_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_upload_model.dart';

import 'employee_creation_state.dart';

class EmployeeCreationNotifier extends StateNotifier<EmployeeCreationState> {
  EmployeeCreationNotifier()
    : super(EmployeeCreationState(employeeData: _initialEmptyEmployeeData()));

  static EmployeeInfoModel _initialEmptyEmployeeData([String? employeeId]) {
    return EmployeeInfoModel(
      employeeId:
          employeeId ??
          UniqueKey().toString(), // Temporary client-side ID if not provided
      firstName: '',
      gender: Gender.other,
      birthDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
      positionId: '',
      address1: '',
      phone: '',
      mobile: '',
      email: '',
      hiredDate: DateTime.now(),
      employeeContacts: [],
      employeeDependants: [],
      employeeEducations: [],
      employeeExperiences: [],
      performances: [],
      employeeSpouse: [],
      generalDocuments: [],
    );
  }

  // --- Initialize or Reset for a new employee ---
  void prepareNewEmployee({
    String? prefilledEmployeeId,
    EmployeeInfoModel? template,
  }) {
    if (template != null) {
      state = EmployeeCreationState(employeeData: template);
    } else {
      state = EmployeeCreationState(
        employeeData: _initialEmptyEmployeeData(prefilledEmployeeId),
      );
    }
  }

  // This method is called when an admin wants to view/edit an existing employee.
  // It fetches the full employee details from the backend.
  Future<void> loadEmployeeForEditing(String employeeId) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      // TODO: Call your actual API service here.
      // final fetchedEmployeeData = await _apiService.getEmployeeDetails(employeeId);

      // MOCK IMPLEMENTATION with fixes
      debugPrint('Fetching full details for employee ID: $employeeId...');
      await Future.delayed(const Duration(seconds: 1));

      final mockLoadedEmployee = EmployeeInfoModel(
        employeeId: employeeId,
        firstName: 'Loaded',
        fatherName: 'User',
        grandName: 'For-Edit', // Fixed: No longer causes RangeError
        gender: Gender.female,
        birthDate: DateTime(1985, 5, 20),
        positionId: 'Senior Officer',
        address1: '123 Main St, Addis Ababa',
        phone: '0911123456',
        mobile: '0911123456',
        email: 'existing.user@example.com',
        hiredDate: DateTime(2010, 1, 15),
        employeeContacts: [
          EmployeeContactModel(
            contactId: 'c1',
            employeeId: employeeId,
            fullName: 'Jane Doe',
            relationship: RelationTypes.spouse,
            phone: '0911654321',
          ),
        ],
        employeeEducations: [
          EmployeeEducationModel(
            educationId: 'e1',
            employeeId: employeeId,
            educationLevel: EducationLevel.bachelorsDegree,
            university: EthiopianUniversity.addisAbabaUniversity,
            fieldOfStudy: FieldOfStudy.computerScience,
            startDate: DateTime(2006),
            endDate: DateTime(2010),
            educationStatus: EducationStatus.completed,
          ),
        ],
      );

      // --- FIX: Check if mounted before updating state after an await ---
      if (mounted) {
        state = EmployeeCreationState(employeeData: mockLoadedEmployee);
      }
    } catch (e) {
      debugPrint('Error loading employee for editing: $e');
      // --- FIX: Check if mounted before updating state in the catch block ---
      if (mounted) {
        state = state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to load employee data: ${e.toString()}',
        );
      }
    }
  }

  // --- Methods to update direct fields of EmployeeInfoModel ---
  // This method allows updating any subset of the core EmployeeInfoModel fields.
  void updateCoreInfo({
    String? employeeId,
    String? title,
    String? firstName,
    String? fatherName,
    String? grandName,
    Gender? gender,
    DateTime? birthDate,
    File? photoFile,
    String? photoUrl,
    String? motherName,
    String? positionId,
    String? managerId,
    String? address1,
    String? address2,
    String? houseNumber,
    String? phone,
    String? mobile,
    String? email,
    Country? nationality,
    BloodGroup? bloodGroup,
    Religion? religion,
    MedicalStatus? medicalStatus,
    String? retirementNumber,
    String? tin,
    MaritalStatus? maritalStatus,
    EmploymentStatus? employmentStatus,
    bool? isManager,
    EmployeeType? employeeType,
    DateTime? hiredDate,
    DateTime? retirementEligibilityDate,
  }) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeId: employeeId ?? state.employeeData.employeeId,
        title: title ?? state.employeeData.title,
        firstName: firstName ?? state.employeeData.firstName,
        fatherName: fatherName ?? state.employeeData.fatherName,
        grandName: grandName ?? state.employeeData.grandName,
        gender: gender ?? state.employeeData.gender,
        birthDate: birthDate ?? state.employeeData.birthDate,
        photoFile: photoFile,
        photoUrl: photoUrl ?? state.employeeData.photoUrl,
        motherName: motherName ?? state.employeeData.motherName,
        positionId: positionId ?? state.employeeData.positionId,
        managerId: managerId ?? state.employeeData.managerId,
        address1: address1 ?? state.employeeData.address1,
        address2: address2 ?? state.employeeData.address2,
        houseNumber: houseNumber ?? state.employeeData.houseNumber,
        phone: phone ?? state.employeeData.phone,
        mobile: mobile ?? state.employeeData.mobile,
        email: email ?? state.employeeData.email,
        nationality: nationality ?? state.employeeData.nationality,
        bloodGroup: bloodGroup ?? state.employeeData.bloodGroup,
        religion: religion ?? state.employeeData.religion,
        medicalStatus: medicalStatus ?? state.employeeData.medicalStatus,
        retirementNumber:
            retirementNumber ?? state.employeeData.retirementNumber,
        tin: tin ?? state.employeeData.tin,
        maritalStatus: maritalStatus ?? state.employeeData.maritalStatus,
        employmentStatus:
            employmentStatus ?? state.employeeData.employmentStatus,
        isManager: isManager ?? state.employeeData.isManager,
        employeeType: employeeType ?? state.employeeData.employeeType,
        hiredDate: hiredDate ?? state.employeeData.hiredDate,
        retirementEligibilityDate:
            retirementEligibilityDate ??
            state.employeeData.retirementEligibilityDate,
      ),
    );
  }

  // Method specifically for updating the local photo file
  void updatePhotoFile(File? file) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(photoFile: file),
    );
  }

  // --- Methods for Employee Contacts ---
  void addEmployeeContact(EmployeeContactModel contact) {
    // Ensure the contact has a client-side ID if backend doesn't assign one pre-submission
    final contactWithId =
        contact.contactId == null || contact.contactId!.isEmpty
            ? contact.copyWith(contactId: UniqueKey().toString())
            : contact;
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeContacts: [
          ...state.employeeData.employeeContacts,
          contactWithId,
        ],
      ),
    );
  }

  void updateEmployeeContact(EmployeeContactModel updatedContact) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeContacts:
            state.employeeData.employeeContacts
                .map(
                  (c) =>
                      c.contactId == updatedContact.contactId
                          ? updatedContact
                          : c,
                )
                .toList(),
      ),
    );
  }

  void deleteEmployeeContact(String contactId) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeContacts:
            state.employeeData.employeeContacts
                .where((c) => c.contactId != contactId)
                .toList(),
      ),
    );
  }

  // --- Methods for Employee Dependants ---
  void addEmployeeDependant(EmployeeDependantModel dependant) {
    final dependantWithId =
        dependant.dependantId == null || dependant.dependantId!.isEmpty
            ? dependant.copyWith(dependantId: UniqueKey().toString())
            : dependant;
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeDependants: [
          ...state.employeeData.employeeDependants,
          dependantWithId,
        ],
      ),
    );
  }

  void updateEmployeeDependant(EmployeeDependantModel updatedDependant) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeDependants:
            state.employeeData.employeeDependants
                .map(
                  (d) =>
                      d.dependantId == updatedDependant.dependantId
                          ? updatedDependant
                          : d,
                )
                .toList(),
      ),
    );
  }

  void deleteEmployeeDependant(String dependantId) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeDependants:
            state.employeeData.employeeDependants
                .where((d) => d.dependantId != dependantId)
                .toList(),
      ),
    );
  }

  // --- Methods for Employee Education ---
  void addEmployeeEducation(EmployeeEducationModel education) {
    final educationWithId =
        education.educationId == null || education.educationId!.isEmpty
            ? education.copyWith(educationId: UniqueKey().toString())
            : education;
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeEducations: [
          ...state.employeeData.employeeEducations,
          educationWithId,
        ],
      ),
    );
  }

  void updateEmployeeEducation(EmployeeEducationModel updatedEducation) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeEducations:
            state.employeeData.employeeEducations
                .map(
                  (e) =>
                      e.educationId == updatedEducation.educationId
                          ? updatedEducation
                          : e,
                )
                .toList(),
      ),
    );
  }

  void deleteEmployeeEducation(String educationId) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeEducations:
            state.employeeData.employeeEducations
                .where((e) => e.educationId != educationId)
                .toList(),
      ),
    );
  }

  // --- Methods for Employee Experience ---
  void addEmployeeExperience(EmployeeExperienceModel experience) {
    final experienceWithId =
        experience.experienceId == null || experience.experienceId!.isEmpty
            ? experience.copyWith(experienceId: UniqueKey().toString())
            : experience;
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeExperiences: [
          ...state.employeeData.employeeExperiences,
          experienceWithId,
        ],
      ),
    );
  }

  void updateEmployeeExperience(EmployeeExperienceModel updatedExperience) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeExperiences:
            state.employeeData.employeeExperiences
                .map(
                  (exp) =>
                      exp.experienceId == updatedExperience.experienceId
                          ? updatedExperience
                          : exp,
                )
                .toList(),
      ),
    );
  }

  void deleteEmployeeExperience(String experienceId) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeExperiences:
            state.employeeData.employeeExperiences
                .where((exp) => exp.experienceId != experienceId)
                .toList(),
      ),
    );
  }

  // --- Methods for Employee Spouse ---
  // EmployeeInfoModel allows a list of spouses, typically it would be one or none.
  // Adjust logic if only one spouse is allowed (e.g., replace instead of add to list).
  void addEmployeeSpouse(EmployeeSpouseModel spouse) {
    final spouseWithId =
        spouse.spouseId == null || spouse.spouseId!.isEmpty
            ? spouse.copyWith(spouseId: UniqueKey().toString())
            : spouse;
    // If only one spouse is allowed, you might want to replace the list or check its length.
    // For now, assuming the model allows multiple (though uncommon for active spouses).
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeSpouse: [...state.employeeData.employeeSpouse, spouseWithId],
      ),
    );
  }

  void updateEmployeeSpouse(EmployeeSpouseModel updatedSpouse) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeSpouse:
            state.employeeData.employeeSpouse
                .map(
                  (s) =>
                      s.spouseId == updatedSpouse.spouseId ? updatedSpouse : s,
                )
                .toList(),
      ),
    );
  }

  void deleteEmployeeSpouse(String spouseId) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        employeeSpouse:
            state.employeeData.employeeSpouse
                .where((s) => s.spouseId != spouseId)
                .toList(),
      ),
    );
  }

  // --- Methods for General Documents (EmployeeUploadModel) ---
  void addGeneralDocument(EmployeeUploadModel document) {
    final documentWithId =
        document.documentId == null || document.documentId!.isEmpty
            ? document.copyWith(documentId: UniqueKey().toString())
            : document;
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        generalDocuments: [
          ...state.employeeData.generalDocuments,
          documentWithId,
        ],
      ),
    );
  }

  void updateGeneralDocument(EmployeeUploadModel updatedDocument) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        generalDocuments:
            state.employeeData.generalDocuments
                .map(
                  (d) =>
                      d.documentId == updatedDocument.documentId
                          ? updatedDocument
                          : d,
                )
                .toList(),
      ),
    );
  }

  void deleteGeneralDocument(String documentId) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        generalDocuments:
            state.employeeData.generalDocuments
                .where((d) => d.documentId != documentId)
                .toList(),
      ),
    );
  }

  // --- Methods for Employee Performance (if adding performance during initial creation) ---
  void addEmployeePerformance(EmployeePerformanceModel performance) {
    // Performance ID is int, backend usually generates.
    // Client might not set it, or use a temporary local one if needed before saving.
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        performances: [...state.employeeData.performances, performance],
      ),
    );
  }

  void updateEmployeePerformance(EmployeePerformanceModel updatedPerformance) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        performances:
            state.employeeData.performances
                .map(
                  (p) =>
                      p.performanceId == updatedPerformance.performanceId
                          ? updatedPerformance
                          : p,
                )
                .toList(),
      ),
    );
  }

  void deleteEmployeePerformance(int performanceId) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        performances:
            state.employeeData.performances
                .where((p) => p.performanceId != performanceId)
                .toList(),
      ),
    );
  }

  // --- Final Submission Logic ---
  Future<bool> submitNewEmployee() async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);

    // Perform comprehensive validation on state.employeeData here
    if (state.employeeData.employeeId.isEmpty ||
        state.employeeData.firstName.isEmpty ||
        state.employeeData.positionId.isEmpty /* ... etc. */ ) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage:
            'Required core employee information is missing or invalid.',
      );
      return false;
    }

    try {
      // TODO: Implement actual API submission logic.
      // This involves:
      // 1. Creating a mutable copy of state.employeeData to update with URLs.
      //    EmployeeInfoModel dataToSubmit = state.employeeData;
      //
      // 2. Uploading state.employeeData.photoFile if it exists.
      //    if (dataToSubmit.photoFile != null) {
      //      final photoUrl = await _apiService.uploadFile(
      //        employeeId: dataToSubmit.employeeId,
      //        file: dataToSubmit.photoFile!,
      //        uploadCategory: 'profile_photos', // Or similar category
      //      );
      //      dataToSubmit = dataToSubmit.copyWith(photoUrl: photoUrl, photoFile: null);
      //    }
      //
      // 3. Iterating through collections (educations, experiences, generalDocuments)
      //    and uploading their respective files, then updating those collection items
      //    within dataToSubmit with the returned URLs and clearing their local File objects.
      //    For example, for generalDocuments:
      //    List<EmployeeUploadModel> updatedDocs = [];
      //    for (var doc in dataToSubmit.generalDocuments) {
      //      if (doc.documentFile != null) {
      //        final fileUrl = await _apiService.uploadFile(
      //            employeeId: dataToSubmit.employeeId,
      //            file: doc.documentFile!,
      //            uploadCategory: 'employee_documents');
      //        updatedDocs.add(doc.copyWith(filePath: fileUrl, documentFile: null));
      //      } else {
      //        updatedDocs.add(doc);
      //      }
      //    }
      //    dataToSubmit = dataToSubmit.copyWith(generalDocuments: updatedDocs);
      //    // Repeat for educations, experiences that might have file uploads.
      //
      // 4. Sending the final `dataToSubmit` (which now contains URLs instead of local files)
      //    to the backend API endpoint for creating/updating an employee.
      //    await _apiService.createNewEmployee(dataToSubmit);

      debugPrint(
        'Submitting New Employee Data: ${state.employeeData.toJson()}',
      ); // If you have toJson()
      await Future.delayed(
        const Duration(seconds: 2),
      ); // Simulate API call for now

      state = state.copyWith(isSubmitting: false);
      // Optionally call prepareNewEmployee() to reset the form for the next entry.
      // prepareNewEmployee();
      return true;
    } catch (e) {
      debugPrint('Submission error: $e');
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Failed to create employee: ${e.toString()}',
      );
      return false;
    }
  }
}
