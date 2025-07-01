// lib/features/profile/data/mock_profile_repository.dart

import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/enums/staff_title.dart';
import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/profile/data/i_profile_repository.dart';
import 'package:uuid/uuid.dart';

// The Architect's Note: The original hardcoded data is now isolated in this
// mock implementation, fulfilling Commandment IV.
class MockProfileRepository implements IProfileRepository {
  @override
  Future<EmployeeInfoModel> getEmployeeProfile({
    required String employeeId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    const uuid = Uuid();
    return EmployeeInfoModel(
      employeeId: employeeId,
      title: StaffTitle.sergeant,
      firstName: 'Abe',
      fatherName: 'Assefa',
      grandName: 'Tessema',
      gender: Gender.male,
      birthDate: DateTime(1988, 5, 21),
      photoUrl:
          'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      motherName: 'Yeshi Emebet',
      positionId: 'Lead Developer',
      managerId: 'MGR-CTO',
      address1: 'Kebele 04, Addis Ababa',
      phone: '+251911223344',
      mobile: '+251911223344',
      email: 'abe.a@police.gov.et',
      bloodGroup: BloodGroup.oPositive,
      religion: Religion.christianity,
      medicalStatus: MedicalStatus.fit,
      maritalStatus: MaritalStatus.married,
      hiredDate: DateTime(2010, 1, 15),
      employeeEducations: [
        EmployeeEducationModel(
          educationId: uuid.v4(),
          employeeId: employeeId,
          educationLevel: EducationLevel.bachelorsDegree,
          university: EthiopianUniversity.addisAbabaUniversity,
          fieldOfStudy: FieldOfStudy.computerScience,
          startDate: DateTime(2006, 9),
          endDate: DateTime(2010, 7),
          educationStatus: EducationStatus.completed,
          isApproved: true,
        ),
      ],
      employeeExperiences: [
        EmployeeExperienceModel(
          experienceId: uuid.v4(),
          employeeId: employeeId,
          organization: 'Federal Police',
          organizationType: OrganizationType.govermental,
          position: 'Junior Officer',
          responsibilities: 'Patrol and community support',
          joinDate: DateTime(2010, 8),
          separationDate: DateTime(2015),
        ),
        EmployeeExperienceModel(
          experienceId: uuid.v4(),
          employeeId: employeeId,
          organization: 'Federal Police',
          organizationType: OrganizationType.govermental,
          position: 'Sergeant',
          responsibilities: 'Squad lead and field operations management.',
          joinDate: DateTime(2015, 1, 2),
        ),
      ],
      employeeSpouse: [
        EmployeeSpouseModel(
          spouseId: uuid.v4(),
          employeeId: employeeId,
          title: StaffTitle.commissioner,
          spouseFullName: 'Almaz Gebre',
          gender: Gender.female,
          spouseBirthDate: DateTime(1990, 2, 14),
          spouseOccupation: 'Nurse',
          address: 'Kebele 04, Addis Ababa',
        ),
      ],
      employeeContacts: [
        EmployeeContactModel(
          contactId: uuid.v4(),
          employeeId: employeeId,
          fullName: 'Almaz Gebre',
          relationship: RelationTypes.wife,
          phone: '+251911556677',
          address: 'Kebele 04, Addis Ababa',
        ),
      ],
      employeeDependants: [
        EmployeeDependantModel(
          dependantId: uuid.v4(),
          employeeId: employeeId,
          dependantFullName: 'Lia Abe',
          relation: RelationTypes.child,
          gender: Gender.female,
          birthDate: DateTime(2015, 10, 2),
          region: EthiopianRegion.addisAbaba,
          phoneNumber: '+251911223344',
        ),
      ],
    );
  }

  // The Architect's Note: ADDED - The missing concrete implementation for the mock.
  @override
  Future<void> updateEmployeeProfile(EmployeeInfoModel employeeInfo) async {
    print('MOCK: Updating employee profile for ${employeeInfo.employeeId}');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> addEducation(
    String employeeId,
    EmployeeEducationModel education,
  ) async {
    print('MOCK: Adding education for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> updateEducation(
    String employeeId,
    EmployeeEducationModel education,
  ) async {
    print('MOCK: Updating education ${education.educationId} for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> deleteEducation(String employeeId, String educationId) async {
    print('MOCK: Deleting education $educationId for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> addExperience(
    String employeeId,
    EmployeeExperienceModel experience,
  ) async {
    print('MOCK: Adding experience for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> updateExperience(
    String employeeId,
    EmployeeExperienceModel experience,
  ) async {
    print(
      'MOCK: Updating experience ${experience.experienceId} for $employeeId',
    );
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> deleteExperience(String employeeId, String experienceId) async {
    print('MOCK: Deleting experience $experienceId for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> addDependant(
    String employeeId,
    EmployeeDependantModel dependant,
  ) async {
    print('MOCK: Adding dependant for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> updateDependant(
    String employeeId,
    EmployeeDependantModel dependant,
  ) async {
    print('MOCK: Updating dependant ${dependant.dependantId} for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> deleteDependant(String employeeId, String dependantId) async {
    print('MOCK: Deleting dependant $dependantId for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> addContact(
    String employeeId,
    EmployeeContactModel contact,
  ) async {
    print('MOCK: Adding contact for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> updateContact(
    String employeeId,
    EmployeeContactModel contact,
  ) async {
    print('MOCK: Updating contact ${contact.contactId} for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> deleteContact(String employeeId, String contactId) async {
    print('MOCK: Deleting contact $contactId for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> addSpouse(String employeeId, EmployeeSpouseModel spouse) async {
    print('MOCK: Adding spouse for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> updateSpouse(
    String employeeId,
    EmployeeSpouseModel spouse,
  ) async {
    print('MOCK: Updating spouse ${spouse.spouseId} for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> deleteSpouse(String employeeId, String spouseId) async {
    print('MOCK: Deleting spouse $spouseId for $employeeId');
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
