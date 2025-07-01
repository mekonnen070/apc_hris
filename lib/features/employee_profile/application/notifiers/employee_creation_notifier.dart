// lib/features/employee_profile/application/employee_creation_notifier.dart
import 'dart:io'; // For File type

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/blood_group.dart';
import 'package:police_com/core/enums/country.dart';
import 'package:police_com/core/enums/document_type.dart';
import 'package:police_com/core/enums/education_level.dart';
import 'package:police_com/core/enums/education_status.dart';
import 'package:police_com/core/enums/employee_type.dart';
import 'package:police_com/core/enums/employment_status.dart';
import 'package:police_com/core/enums/ethiopian_region.dart';
import 'package:police_com/core/enums/ethiopian_university.dart';
import 'package:police_com/core/enums/field_of_study.dart';
import 'package:police_com/core/enums/gender.dart';
import 'package:police_com/core/enums/marital_status.dart';
import 'package:police_com/core/enums/medical_status.dart';
import 'package:police_com/core/enums/organization_type.dart';
import 'package:police_com/core/enums/proficiency_level.dart';
import 'package:police_com/core/enums/relation_types.dart';
import 'package:police_com/core/enums/religion.dart';
import 'package:police_com/core/enums/staff_title.dart';
import 'package:police_com/features/employee_profile/application/states/employee_creation_state.dart';
import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_performance_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_upload_model.dart';

class EmployeeCreationNotifier extends StateNotifier<EmployeeCreationState> {
  final Ref _ref;

  EmployeeCreationNotifier(this._ref)
    : super(EmployeeCreationState(employeeData: _initialEmptyEmployeeData()));

  // TODO: Replace with your actual API service for fetching/saving employee data.
  // Example: final _employeeApiService = YourEmployeeApiService();

  static EmployeeInfoModel _initialEmptyEmployeeData([String? employeeId]) {
    return EmployeeInfoModel(
      employeeId:
          employeeId ??
          'TEMP-${UniqueKey().toString()}', // Temporary client-side ID, clearly marked
      firstName: '',
      gender: Gender.other,
      birthDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
      positionId: '', // Will be set to a police rank if editing
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

  Future<void> loadEmployeeForEditing(String employeeId) async {
    final link = _ref.keepAlive();
    state = EmployeeCreationState(
      employeeData: _initialEmptyEmployeeData(employeeId),
      isSubmitting: true,
    );

    try {
      debugPrint('Fetching full details for employee ID: $employeeId...');
      // TODO: Replace MOCK IMPLEMENTATION with actual API call
      // final fetchedEmployeeData = await _employeeApiService.getEmployeeDetails(employeeId);
      await Future.delayed(const Duration(seconds: 1));

      final mockLoadedEmployee = EmployeeInfoModel(
        employeeId: employeeId, // e.g., "APC0001"
        firstName: 'Alemayehu',
        fatherName: 'Tesfaye',
        grandName: 'Bekele',
        title: StaffTitle.sergeant,
        gender: Gender.male,
        birthDate: DateTime(1988, 7, 15),
        photoUrl: 'https://i.pravatar.cc/150?u=$employeeId',
        motherName: 'Yeshiwork Lemma',
        positionId: 'Sergeant', // Police Rank
        managerId: 'APC0000', // Example Commander ID
        address1: 'Kirkos Sub-City, Woreda 03',
        address2: 'Police Station Alpha',
        houseNumber: 'SN007',
        phone: '0911234501',
        mobile: '0911234501',
        email: '${employeeId.toLowerCase()}@amaharapolice.gov.et',
        bloodGroup: BloodGroup.aPositive,
        religion: Religion.christianity,
        medicalStatus: MedicalStatus.fit,
        retirementNumber: 'RT-$employeeId',
        tin: 'TIN-$employeeId',
        maritalStatus: MaritalStatus.married,
        hiredDate: DateTime(2012, 3, 10),
        retirementEligibilityDate: DateTime(2042, 3, 10),
        employeeContacts: [
          EmployeeContactModel(
            contactId: 'C1-$employeeId',
            employeeId: employeeId,
            fullName: 'Spouse Contact',
            relationship: RelationTypes.wife,
            phone: '0911987654',
            address: 'Same as employee',
          ),
          EmployeeContactModel(
            contactId: 'C2-$employeeId',
            employeeId: employeeId,
            fullName: 'Brother Contact',
            relationship: RelationTypes.brother,
            phone: '0912112233',
            address: 'Nearby Kebele',
          ),
        ],
        employeeDependants: [
          EmployeeDependantModel(
            dependantId: 'D1-$employeeId',
            employeeId: employeeId,
            dependantFullName: 'Kidist Alemayehu',
            relation: RelationTypes.child,
            gender: Gender.female,
            birthDate: DateTime(2018, 10, 5),
            region: EthiopianRegion.addisAbaba,
            phoneNumber: 'N/A',
            occupation: 'Student',
          ),
          EmployeeDependantModel(
            dependantId: 'D2-$employeeId',
            employeeId: employeeId,
            dependantFullName: 'Yonas Alemayehu',
            relation: RelationTypes.child,
            gender: Gender.male,
            birthDate: DateTime(2020, 1, 20),
            region: EthiopianRegion.addisAbaba,
            phoneNumber: 'N/A',
            occupation: 'Toddler',
          ),
        ],
        employeeEducations: [
          EmployeeEducationModel(
            educationId: 'EDU1-$employeeId',
            employeeId: employeeId,
            educationLevel: EducationLevel.diploma,
            university: EthiopianUniversity.ethiopianPoliceUniversity,
            fieldOfStudy: FieldOfStudy.law,
            startDate: DateTime(2010),
            endDate: DateTime(2012),
            educationStatus: EducationStatus.completed,
            cgpa: '3.5',
          ),
          EmployeeEducationModel(
            educationId: 'EDU2-$employeeId',
            employeeId: employeeId,
            educationLevel: EducationLevel.secondarySchoolSecondCycle,
            university: EthiopianUniversity.other, // Represents high school
            fieldOfStudy: FieldOfStudy.other, // General studies
            startDate: DateTime(2006),
            endDate: DateTime(2009),
            educationStatus: EducationStatus.completed,
          ),
        ],
        employeeExperiences: [
          EmployeeExperienceModel(
            experienceId: 'EXP1-$employeeId',
            employeeId: employeeId,
            organization: 'Local Police Unit B',
            organizationType: OrganizationType.govermental,
            position: 'Constable',
            responsibilities:
                'Patrol and community policing, initial investigations.',
            proficiencyLevel: ProficiencyLevel.intermediate,
            joinDate: DateTime(2008),
            separationDate: DateTime(2012, 3, 9),
            separationNotes: 'Promoted to Sergeant',
          ),
          EmployeeExperienceModel(
            experienceId: 'EXP2-$employeeId',
            employeeId: employeeId,
            organization: 'City Central Command',
            organizationType: OrganizationType.govermental,
            position: 'Desk Sergeant',
            responsibilities: 'Managing station logs, coordinating dispatches.',
            proficiencyLevel: ProficiencyLevel.expert,
            joinDate: DateTime(2012, 3, 10),
          ),
        ],
        employeeSpouse: [
          EmployeeSpouseModel(
            spouseId: 'SP1-$employeeId',
            employeeId: employeeId,
            title: StaffTitle.wro,
            spouseFullName: 'Hana Gebre',
            gender: Gender.female,
            spouseBirthDate: DateTime(1990),
            spousePhone: '0911987654',
            spouseOccupation: 'Teacher',
            motherName: 'Tigist Belay',
            address: 'Same as employee',
            anniversaryDate: DateTime(2015, 6, 10),
            retirementNumber: 'SP-RET-001',
            tin: 'SP-TIN-001',
          ),
        ],
        generalDocuments: [
          EmployeeUploadModel(
            documentId: 'DOC1-$employeeId',
            employeeId: employeeId,
            documentName: 'Police Academy Diploma',
            documentType: DocumentType.academicCertificate,
            filePath: '/uploads/docs/diploma_$employeeId.pdf',
            uploadDate: DateTime(2012, 4),
          ),
          EmployeeUploadModel(
            documentId: 'DOC2-$employeeId',
            employeeId: employeeId,
            documentName: 'National ID',
            documentType: DocumentType.id,
            filePath: '/uploads/docs/id_$employeeId.pdf',
            uploadDate: DateTime(2007),
            expiryDate: DateTime(2027),
          ),
          EmployeeUploadModel(
            documentId: 'DOC3-$employeeId',
            employeeId: employeeId,
            documentName: 'Commendation Letter',
            documentType: DocumentType.other,
            description: 'For bravery in action',
            filePath: '/uploads/docs/commendation_$employeeId.pdf',
            uploadDate: DateTime(2022, 5, 15),
          ),
        ],
        performances: [
          EmployeePerformanceModel(
            performanceId: 1,
            employeeId: employeeId,
            scorePoint: 85,
            rating: 4,
            evaluationDate: DateTime(2023, 12),
            evaluatorName: 'Commander Abebe',
            comments:
                'Good performance in Q4. Recommended for advanced training.',
            keyAchievements: 'Solved 3 high-profile cases.',
            areasForImprovement: 'Report writing timeliness.',
            fromDate: DateTime(2023, 9),
            toDate: DateTime(2023, 12),
          ),
          EmployeePerformanceModel(
            performanceId: 2,
            employeeId: employeeId,
            scorePoint: 92,
            rating: 5,
            evaluationDate: DateTime(2023, 6),
            evaluatorName: 'Commander Abebe',
            comments: 'Excellent work in community engagement.',
            keyAchievements: 'Led successful community policing initiative.',
            areasForImprovement: 'Delegation skills.',
            fromDate: DateTime(2023, 3),
            toDate: DateTime(2023, 6),
            nextEvaluationDate: DateTime(2023, 9),
          ),
        ],
      );

      state = EmployeeCreationState(employeeData: mockLoadedEmployee);
    } catch (e, stackTrace) {
      debugPrint('Error loading employee for editing: $e\n$stackTrace');
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Failed to load employee data: ${e.toString()}',
      );
    } finally {
      link.close();
    }
  }

  void updateCoreInfo({
    String? employeeId,
    StaffTitle? title,
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
        photoUrl:
            photoFile != null
                ? null
                : (photoUrl ?? state.employeeData.photoUrl),
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

  void updatePhotoFile(File? file) {
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        photoFile: file,
        photoUrl: file != null ? null : state.employeeData.photoUrl,
      ),
    );
  }

  // --- Methods for Employee Contacts ---
  void addEmployeeContact(EmployeeContactModel contact) {
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
  void addEmployeeSpouse(EmployeeSpouseModel spouse) {
    final spouseWithId =
        spouse.spouseId == null || spouse.spouseId!.isEmpty
            ? spouse.copyWith(spouseId: UniqueKey().toString())
            : spouse;
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

  // --- Methods for Employee Performance ---
  void addEmployeePerformance(EmployeePerformanceModel performance) {
    // Ensure performanceId is unique if client-generated, or 0 if backend generates
    final performanceWithId =
        performance.performanceId == 0
            ? performance.copyWith(
              performanceId: DateTime.now().millisecondsSinceEpoch,
            ) // temp client unique ID
            : performance;
    state = state.copyWith(
      employeeData: state.employeeData.copyWith(
        performances: [...state.employeeData.performances, performanceWithId],
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

  Future<bool> submitNewEmployee() async {
    final link = _ref.keepAlive();

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    if (state.employeeData.employeeId.isEmpty ||
        state.employeeData.firstName.isEmpty ||
        state.employeeData.positionId.isEmpty) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage:
            'Required core employee information is missing or invalid.',
      );
      link.close();
      return false;
    }

    try {
      EmployeeInfoModel dataToSubmit = state.employeeData;

      if (dataToSubmit.photoFile != null) {
        debugPrint(
          'Simulating photo upload for: ${dataToSubmit.photoFile!.path}',
        );
        await Future.delayed(const Duration(milliseconds: 500));
        const photoUrl =
            'https://example.com/uploads/profile_photos/new_photo.jpg';
        dataToSubmit = dataToSubmit.copyWith(
          photoUrl: photoUrl,
          photoFile: null,
        );
      }

      List<EmployeeUploadModel> updatedDocs = [];
      for (final doc in dataToSubmit.generalDocuments) {
        if (doc.documentFile != null) {
          debugPrint(
            'Simulating document upload for: ${doc.documentFile!.path}',
          );
          await Future.delayed(const Duration(milliseconds: 300));
          final fileUrl =
              "https://example.com/uploads/documents/${doc.documentFile!.path.split('/').last}";
          updatedDocs.add(doc.copyWith(filePath: fileUrl, documentFile: null));
        } else {
          updatedDocs.add(doc);
        }
      }
      dataToSubmit = dataToSubmit.copyWith(generalDocuments: updatedDocs);

      debugPrint('Submitting Final Employee Data: ${dataToSubmit.toJson()}');
      await Future.delayed(const Duration(seconds: 1));

      state = state.copyWith(isSubmitting: false, errorMessage: null);
      // prepareNewEmployee(); // Consider if this should be called here or by the UI layer after success
      link.close();
      return true;
    } catch (e, stackTrace) {
      debugPrint('Submission error: $e\n$stackTrace');
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Failed to create/update employee: ${e.toString()}',
      );
      link.close();
      return false;
    }
  }
}
