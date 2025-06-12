// lib/features/profile/data/profile_repository.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:uuid/uuid.dart';

final profileRepositoryProvider = Provider(
  (ref) => ProfileRepository(ref.read(dioClientProvider)),
);

class ProfileRepository {
  final DioClient _dioClient;

  ProfileRepository(this._dioClient);

  Future<EmployeeInfoModel> getEmployeeProfile(String employeeId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    const uuid = Uuid();
    return EmployeeInfoModel(
      employeeId: employeeId,
      title: 'Sgt.',
      firstName: 'Abe',
      fatherName: 'Assefa',
      grandName: 'Tessema',
      gender: Gender.male,
      birthDate: DateTime(1988, 5, 21),
      photoUrl:
          'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      motherName: 'Yeshi Emebet',
      positionId: 'Lead Developer', // Using title instead of ID for display
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
          title: 'Mrs.',
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
          relationship: RelationTypes.spouse,
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

  Future<void> updateEmployeeProfile(EmployeeInfoModel employeeInfo) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Updating employee profile: ${employeeInfo.toJson()}');
  }
}
