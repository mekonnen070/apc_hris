// lib/features/profile/data/profile_repository.dart

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/app_config.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/profile/data/i_profile_repository.dart';
import 'package:police_com/features/profile/data/mock_profile_repository.dart';

final profileRepositoryProvider = Provider<IProfileRepository>((ref) {
  if (AppConfig.useMockData) {
    return MockProfileRepository();
  }
  return ProfileRepository(ref.watch(dioClientProvider));
});

class ProfileRepository with LoggerMixin implements IProfileRepository {
  final DioClient _dioClient;
  ProfileRepository(this._dioClient);

  @override
  Future<EmployeeInfoModel> getEmployeeProfile({
    required String employeeId,
  }) async {
    try {
      final response = await _dioClient.get(
        ApiEndpoints.employeeDetails,
        queryParameters: {'EmpId': employeeId},
      );

      return EmployeeInfoModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      logError(
        'Failed to fetch employee profile for ID: $employeeId',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // The Architect's Note: ADDED - The missing concrete implementation.
  @override
  Future<void> updateEmployeeProfile(EmployeeInfoModel employeeInfo) async {
    try {
      // Typically, updating a full object uses a PUT request.
      await _dioClient.put(
        ApiEndpoints.getEmployeeProfile(
          employeeId: employeeInfo.employeeId,
        ), // Assumes PUT to the specific user URL
        data: employeeInfo.toJson(),
      );
    } on DioException catch (e, stackTrace) {
      logError(
        'Failed to update employee profile for ID: ${employeeInfo.employeeId}',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // --- Education ---
  @override
  Future<void> addEducation(
    String employeeId,
    EmployeeEducationModel education,
  ) async {
    try {
      await _dioClient.post(
        ApiEndpoints.education(employeeId: employeeId),
        data: education.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to add education for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> updateEducation(
    String employeeId,
    EmployeeEducationModel education,
  ) async {
    try {
      await _dioClient.put(
        ApiEndpoints.educationById(
          employeeId: employeeId,
          educationId: education.educationId!,
        ),
        data: education.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to update education for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deleteEducation(String employeeId, String educationId) async {
    try {
      await _dioClient.delete(
        ApiEndpoints.educationById(
          employeeId: employeeId,
          educationId: educationId,
        ),
      );
    } on DioException catch (e, st) {
      logError('Failed to delete education $educationId', error: e, stackTrace: st);
      rethrow;
    }
  }

  // --- Experience ---
  @override
  Future<void> addExperience(
    String employeeId,
    EmployeeExperienceModel experience,
  ) async {
    try {
      await _dioClient.post(
        ApiEndpoints.experience(employeeId: employeeId),
        data: experience.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to add experience for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> updateExperience(
    String employeeId,
    EmployeeExperienceModel experience,
  ) async {
    try {
      await _dioClient.put(
        ApiEndpoints.experienceById(
          employeeId: employeeId,
          experienceId: experience.experienceId!,
        ),
        data: experience.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to update experience for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deleteExperience(String employeeId, String experienceId) async {
    try {
      await _dioClient.delete(
        ApiEndpoints.experienceById(
          employeeId: employeeId,
          experienceId: experienceId,
        ),
      );
    } on DioException catch (e, st) {
      logError('Failed to delete experience $experienceId', error: e, stackTrace: st);
      rethrow;
    }
  }

  // --- Dependant ---
  @override
  Future<void> addDependant(
    String employeeId,
    EmployeeDependantModel dependant,
  ) async {
    try {
      await _dioClient.post(
        ApiEndpoints.dependant(employeeId: employeeId),
        data: dependant.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to add dependant for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> updateDependant(
    String employeeId,
    EmployeeDependantModel dependant,
  ) async {
    try {
      await _dioClient.put(
        ApiEndpoints.dependantById(
          employeeId: employeeId,
          dependantId: dependant.dependantId!,
        ),
        data: dependant.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to update dependant for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deleteDependant(String employeeId, String dependantId) async {
    try {
      await _dioClient.delete(
        ApiEndpoints.dependantById(
          employeeId: employeeId,
          dependantId: dependantId,
        ),
      );
    } on DioException catch (e, st) {
      logError('Failed to delete dependant $dependantId', error: e, stackTrace: st);
      rethrow;
    }
  }

  // --- Contact ---
  @override
  Future<void> addContact(
    String employeeId,
    EmployeeContactModel contact,
  ) async {
    try {
      await _dioClient.post(
        ApiEndpoints.contact(employeeId: employeeId),
        data: contact.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to add contact for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> updateContact(
    String employeeId,
    EmployeeContactModel contact,
  ) async {
    try {
      await _dioClient.put(
        ApiEndpoints.contactById(
          employeeId: employeeId,
          contactId: contact.contactId!,
        ),
        data: contact.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to update contact for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deleteContact(String employeeId, String contactId) async {
    try {
      await _dioClient.delete(
        ApiEndpoints.contactById(employeeId: employeeId, contactId: contactId),
      );
    } on DioException catch (e, st) {
      logError('Failed to delete contact $contactId', error: e, stackTrace: st);
      rethrow;
    }
  }

  // --- Spouse ---
  @override
  Future<void> addSpouse(String employeeId, EmployeeSpouseModel spouse) async {
    try {
      await _dioClient.post(
        ApiEndpoints.spouse(employeeId: employeeId),
        data: spouse.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to add spouse for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> updateSpouse(
    String employeeId,
    EmployeeSpouseModel spouse,
  ) async {
    try {
      await _dioClient.put(
        ApiEndpoints.spouseById(
          employeeId: employeeId,
          spouseId: spouse.spouseId!,
        ),
        data: spouse.toJson(),
      );
    } on DioException catch (e, st) {
      logError('Failed to update spouse for $employeeId', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deleteSpouse(String employeeId, String spouseId) async {
    try {
      await _dioClient.delete(
        ApiEndpoints.spouseById(employeeId: employeeId, spouseId: spouseId),
      );
    } on DioException catch (e, st) {
      logError('Failed to delete spouse $spouseId', error: e, stackTrace: st);
      rethrow;
    }
  }
}
