
// lib/features/profile/application/profile_providers.dart
import 'dart:async';

import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/profile/data/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'profile_notifier.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  final _uuid = const Uuid();

  @override
  Future<EmployeeInfoModel> build(String employeeId) {
    return ref.watch(profileRepositoryProvider).getEmployeeProfile(employeeId);
  }

  Future<bool> _updateProfile(EmployeeInfoModel updatedInfo) async {
    final repo = ref.read(profileRepositoryProvider);
    state = const AsyncValue.loading();
    try {
      await repo.updateEmployeeProfile(updatedInfo);
      state = AsyncValue.data(updatedInfo); // Optimistic update
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> updatePersonalInfo(EmployeeInfoModel updatedInfo) async {
    return _updateProfile(updatedInfo);
  }

  // Generic list update helper
  Future<bool> _updateEmployeeList<T>(
    List<T> list,
    EmployeeInfoModel Function(List<T> updatedList) copyWith,
  ) async {
    final employee = state.valueOrNull;
    if (employee == null) return false;
    return _updateProfile(copyWith(list));
  }

  // --- Education ---
  Future<bool> addEducation(EmployeeEducationModel education) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final newEducation = education.copyWith(educationId: _uuid.v4());
    final updatedList = [...employee.employeeEducations, newEducation];
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeEducations: l));
  }

  Future<bool> updateEducation(EmployeeEducationModel education) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeEducations.map((e) => e.educationId == education.educationId ? education : e).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeEducations: l));
  }

  Future<bool> deleteEducation(String educationId) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeEducations.where((e) => e.educationId != educationId).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeEducations: l));
  }

  // --- Experience ---
  Future<bool> addExperience(EmployeeExperienceModel experience) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final newExperience = experience.copyWith(experienceId: _uuid.v4());
    final updatedList = [...employee.employeeExperiences, newExperience];
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeExperiences: l));
  }

  Future<bool> updateExperience(EmployeeExperienceModel experience) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeExperiences.map((e) => e.experienceId == experience.experienceId ? experience : e).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeExperiences: l));
  }

  Future<bool> deleteExperience(String experienceId) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeExperiences.where((e) => e.experienceId != experienceId).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeExperiences: l));
  }

  // --- Dependants ---
  Future<bool> addDependant(EmployeeDependantModel dependant) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final newDependant = dependant.copyWith(dependantId: _uuid.v4());
    final updatedList = [...employee.employeeDependants, newDependant];
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeDependants: l));
  }

  Future<bool> updateDependant(EmployeeDependantModel dependant) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeDependants.map((d) => d.dependantId == dependant.dependantId ? dependant : d).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeDependants: l));
  }

  Future<bool> deleteDependant(String dependantId) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeDependants.where((d) => d.dependantId != dependantId).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeDependants: l));
  }

  // --- Contacts ---
  Future<bool> addContact(EmployeeContactModel contact) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final newContact = contact.copyWith(contactId: _uuid.v4());
    final updatedList = [...employee.employeeContacts, newContact];
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeContacts: l));
  }

  Future<bool> updateContact(EmployeeContactModel contact) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeContacts.map((c) => c.contactId == contact.contactId ? contact : c).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeContacts: l));
  }

  Future<bool> deleteContact(String contactId) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeContacts.where((c) => c.contactId != contactId).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeContacts: l));
  }

  // --- Spouse ---
  Future<bool> addSpouse(EmployeeSpouseModel spouse) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final newSpouse = spouse.copyWith(spouseId: _uuid.v4());
    final updatedList = [...employee.employeeSpouse, newSpouse];
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeSpouse: l));
  }

  Future<bool> updateSpouse(EmployeeSpouseModel spouse) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeSpouse.map((s) => s.spouseId == spouse.spouseId ? spouse : s).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeSpouse: l));
  }

  Future<bool> deleteSpouse(String spouseId) {
    final employee = state.valueOrNull;
    if (employee == null) return Future.value(false);
    final updatedList = employee.employeeSpouse.where((s) => s.spouseId != spouseId).toList();
    return _updateEmployeeList(updatedList, (l) => employee.copyWith(employeeSpouse: l));
  }
}
