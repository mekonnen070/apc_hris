// lib/features/recruitment/presentation/vacancies_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/vacancy_status.dart';
import 'package:police_com/core/extensions/enum_extension.dart';
import 'package:police_com/features/employee/employee_profile/presentation/employee_list_screen.dart';
import 'package:police_com/features/employee/employee_recruitment/application/providers/vacancy_providers.dart';
import 'package:police_com/features/employee/employee_recruitment/presentation/vacancy_detail_screen.dart';
import 'package:police_com/features/employee/employee_recruitment/presentation/widgets/vacancy_list_item_widget.dart';

class VacanciesScreen extends HookConsumerWidget {
  const VacanciesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vacancyListState = ref.watch(vacancyListNotifierProvider);
    final vacancyListNotifier = ref.read(vacancyListNotifierProvider.notifier);
    final searchController = useTextEditingController();
    final isSearching = useState(false);

    useEffect(() {
      if (!isSearching.value && searchController.text.isNotEmpty) {
        searchController.clear();
        vacancyListNotifier.setSearchQuery('');
      }
      return null;
    }, [isSearching.value]);

    Widget buildBody() {
      if (vacancyListState.isLoading && vacancyListState.vacancies.isEmpty) {
        return const CenteredLoadingIndicator();
      }
      if (vacancyListState.errorMessage != null &&
          vacancyListState.vacancies.isEmpty) {
        return ErrorDisplayWidget(
          message: vacancyListState.errorMessage!,
          onRetry: () => vacancyListNotifier.fetchVacancies(isRefresh: true),
        );
      }
      if (vacancyListState.vacancies.isEmpty) {
        return EmptyListDisplayWidget(
          message:
              vacancyListState.searchQuery.isNotEmpty
                  ? "No vacancies found matching '${vacancyListState.searchQuery}' for ${vacancyListState.filterStatus.toDisplayString} status."
                  : 'No ${vacancyListState.filterStatus.toDisplayString.toLowerCase()} vacancies found.',
          actionText:
              vacancyListState.searchQuery.isNotEmpty ? 'Clear Search' : null,
          onActionPressed:
              vacancyListState.searchQuery.isNotEmpty
                  ? () {
                    searchController.clear();
                    vacancyListNotifier.setSearchQuery('');
                  }
                  : null,
        );
      }

      return RefreshIndicator(
        onRefresh: () => vacancyListNotifier.fetchVacancies(isRefresh: true),
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: vacancyListState.vacancies.length,
          itemBuilder: (context, index) {
            final vacancy = vacancyListState.vacancies[index];
            return VacancyListItemWidget(
              vacancy: vacancy,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => VacancyDetailScreen(vacancy: vacancy),
                  ),
                );
              },
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title:
            isSearching.value
                ? TextField(
                  controller: searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search vacancies...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Theme.of(
                        context,
                      ).appBarTheme.foregroundColor?.withOpacity(0.7),
                    ),
                  ),
                  style: TextStyle(
                    color: Theme.of(context).appBarTheme.foregroundColor,
                    fontSize: 18,
                  ),
                  onChanged: (query) {
                    // Debounce could be added here
                    vacancyListNotifier.setSearchQuery(query);
                  },
                )
                : const Text('Vacant Positions'),
        actions: [
          IconButton(
            icon: Icon(
              isSearching.value ? Icons.close_rounded : Icons.search_rounded,
            ),
            tooltip: isSearching.value ? 'Close Search' : 'Search Vacancies',
            onPressed: () => isSearching.value = !isSearching.value,
          ),
          PopupMenuButton<VacancyStatus>(
            icon: const Icon(Icons.filter_list_rounded),
            tooltip: 'Filter by Status',
            onSelected: (VacancyStatus status) {
              vacancyListNotifier.setFilterStatus(status);
            },
            itemBuilder: (BuildContext context) {
              return VacancyStatus.values.map((VacancyStatus status) {
                return PopupMenuItem<VacancyStatus>(
                  value: status,
                  child: Text(status.toDisplayString),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Filter:',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Chip(
                  label: Text(
                    vacancyListState.filterStatus.toDisplayString,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ],
            ),
          ),
          Expanded(child: buildBody()),
        ],
      ),
    );
  }
}
