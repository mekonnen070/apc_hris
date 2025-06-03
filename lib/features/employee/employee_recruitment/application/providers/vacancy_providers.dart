// lib/features/recruitment/application/vacancy_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/employee/employee_recruitment/application/notifiers/vacancy_list_notifier.dart';
import 'package:police_com/features/employee/employee_recruitment/application/states/vacancy_list_state.dart';

final vacancyListNotifierProvider =
    StateNotifierProvider.autoDispose<VacancyListNotifier, VacancyListState>((
      ref,
    ) {
      // TODO: Inject actual API service when available
      // final apiService = ref.watch(yourVacancyApiServiceProvider);
      // return VacancyListNotifier(apiService);
      return VacancyListNotifier();
    });
