// lib/features/profile/application/profile_notifier.dart

import 'dart:async';

import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/profile/data/i_profile_repository.dart';
import 'package:police_com/features/profile/data/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'profile_notifier.g.dart';

// The Architect's Note:
// This is the final, correct provider. It is now parameter-less.
// It discovers the logged-in user's ID internally, making it a self-sufficient
// component that UI elements can simply "watch" without needing to know the user's ID.
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  final _uuid = const Uuid();

  @override
  Future<EmployeeInfoModel> build() {
    // 1. Read the employeeId from the central provider. This is the only source of truth.
    final employeeId = ref.watch(currentEmployeeIdProvider);

    // 2. If no user is logged in, it is an unrecoverable error for this screen.
    if (employeeId == null) {
      throw Exception(
        'User is not authenticated. Cannot build ProfileNotifier.',
      );
    }

    // 3. Fetch the initial profile data using the discovered ID.
    return ref
        .watch(profileRepositoryProvider)
        .getEmployeeProfile(employeeId: employeeId);
  }

  /// This is the final, robust pattern for optimistic updates.
  Future<bool> _optimisticUpdate(
    EmployeeInfoModel Function(EmployeeInfoModel currentEmployee)
    getUpdatedModel,
    Future<void> Function(IProfileRepository repo, String employeeId) apiCall,
  ) async {
    final repo = ref.read(profileRepositoryProvider);
    final employeeId = ref.read(currentEmployeeIdProvider);
    final previousState = state;
    final currentEmployee = state.valueOrNull;

    if (currentEmployee == null || employeeId == null) return false;

    // 1. Optimistic UI Update
    state = AsyncValue.data(getUpdatedModel(currentEmployee));

    try {
      // 2. Real API Call, using the centrally-provided employeeId
      await apiCall(repo, employeeId);
      return true;
    } catch (e, st) {
      // 3. Revert on Failure
      state = previousState;
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Updates the top-level personal information for the employee.
  Future<bool> updatePersonalInfo(EmployeeInfoModel updatedInfo) {
    return _optimisticUpdate(
      (employee) => updatedInfo,
      (repo, employeeId) => repo.updateEmployeeProfile(updatedInfo),
    );
  }

  // --- Education ---
  Future<bool> addEducation(EmployeeEducationModel education) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeEducations: [
          ...employee.employeeEducations,
          education.copyWith(educationId: _uuid.v4()),
        ],
      ),
      (repo, employeeId) => repo.addEducation(employeeId, education),
    );
  }

  Future<bool> updateEducation(EmployeeEducationModel education) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeEducations:
            employee.employeeEducations
                .map(
                  (e) => e.educationId == education.educationId ? education : e,
                )
                .toList(),
      ),
      (repo, employeeId) => repo.updateEducation(employeeId, education),
    );
  }

  Future<bool> deleteEducation(String educationId) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeEducations:
            employee.employeeEducations
                .where((e) => e.educationId != educationId)
                .toList(),
      ),
      (repo, employeeId) => repo.deleteEducation(employeeId, educationId),
    );
  }

  // --- Experience ---
  Future<bool> addExperience(EmployeeExperienceModel experience) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeExperiences: [
          ...employee.employeeExperiences,
          experience.copyWith(experienceId: _uuid.v4()),
        ],
      ),
      (repo, employeeId) => repo.addExperience(employeeId, experience),
    );
  }

  Future<bool> updateExperience(EmployeeExperienceModel experience) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeExperiences:
            employee.employeeExperiences
                .map(
                  (e) =>
                      e.experienceId == experience.experienceId
                          ? experience
                          : e,
                )
                .toList(),
      ),
      (repo, employeeId) => repo.updateExperience(employeeId, experience),
    );
  }

  Future<bool> deleteExperience(String experienceId) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeExperiences:
            employee.employeeExperiences
                .where((e) => e.experienceId != experienceId)
                .toList(),
      ),
      (repo, employeeId) => repo.deleteExperience(employeeId, experienceId),
    );
  }

  // --- Dependant ---
  Future<bool> addDependant(EmployeeDependantModel dependant) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeDependants: [
          ...employee.employeeDependants,
          dependant.copyWith(dependantId: _uuid.v4()),
        ],
      ),
      (repo, employeeId) => repo.addDependant(employeeId, dependant),
    );
  }

  Future<bool> updateDependant(EmployeeDependantModel dependant) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeDependants:
            employee.employeeDependants
                .map(
                  (d) => d.dependantId == dependant.dependantId ? dependant : d,
                )
                .toList(),
      ),
      (repo, employeeId) => repo.updateDependant(employeeId, dependant),
    );
  }

  Future<bool> deleteDependant(String dependantId) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeDependants:
            employee.employeeDependants
                .where((d) => d.dependantId != dependantId)
                .toList(),
      ),
      (repo, employeeId) => repo.deleteDependant(employeeId, dependantId),
    );
  }

  // --- Contact ---
  Future<bool> addContact(EmployeeContactModel contact) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeContacts: [
          ...employee.employeeContacts,
          contact.copyWith(contactId: _uuid.v4()),
        ],
      ),
      (repo, employeeId) => repo.addContact(employeeId, contact),
    );
  }

  Future<bool> updateContact(EmployeeContactModel contact) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeContacts:
            employee.employeeContacts
                .map((c) => c.contactId == contact.contactId ? contact : c)
                .toList(),
      ),
      (repo, employeeId) => repo.updateContact(employeeId, contact),
    );
  }

  Future<bool> deleteContact(String contactId) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeContacts:
            employee.employeeContacts
                .where((c) => c.contactId != contactId)
                .toList(),
      ),
      (repo, employeeId) => repo.deleteContact(employeeId, contactId),
    );
  }

  // --- Spouse ---
  Future<bool> addSpouse(EmployeeSpouseModel spouse) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeSpouse: [
          ...employee.employeeSpouse,
          spouse.copyWith(spouseId: _uuid.v4()),
        ],
      ),
      (repo, employeeId) => repo.addSpouse(employeeId, spouse),
    );
  }

  Future<bool> updateSpouse(EmployeeSpouseModel spouse) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeSpouse:
            employee.employeeSpouse
                .map((s) => s.spouseId == spouse.spouseId ? spouse : s)
                .toList(),
      ),
      (repo, employeeId) => repo.updateSpouse(employeeId, spouse),
    );
  }

  Future<bool> deleteSpouse(String spouseId) {
    return _optimisticUpdate(
      (employee) => employee.copyWith(
        employeeSpouse:
            employee.employeeSpouse
                .where((s) => s.spouseId != spouseId)
                .toList(),
      ),
      (repo, employeeId) => repo.deleteSpouse(employeeId, spouseId),
    );
  }
}
