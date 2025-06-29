import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/incident_status.dart';
import 'package:police_com/core/enums/incident_type.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/incident/data/incident_repository.dart';
import 'package:police_com/features/incident/domain/incident_report.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class ReportNewIncidentScreen extends HookConsumerWidget {
  const ReportNewIncidentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final descriptionController = useTextEditingController();
    final incidentDate = useState<DateTime?>(null);
    final incidentType = useState<IncidentType?>(null);
    final isLoading = useState(false);

    void submitForm() async {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;

        final report = IncidentReport(
          id: 0,
          reportedById: 'CURRENT_USER_ID',
          incidentDate: incidentDate.value!,
          incidentType: incidentType.value!,
          description: descriptionController.text,
          status: IncidentStatus.submitted,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        try {
          await ref
              .read(incidentRepositoryProvider)
              .submitIncidentReport(report);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar( // <-- REMOVED CONST
              content: Text(context.lango.incidentReportSubmitted), // <-- REPLACED
            ),
          );
          Navigator.of(context).pop(true);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${context.lango.failedToSubmitReport} $e')), // <-- REPLACED
          );
        } finally {
          isLoading.value = false;
        }
      }
    }

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.reportNewIncident), // <-- REPLACED
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppDateField(
                labelText: context.lango.incidentDate, // <-- REPLACED
                onDateSelected: (date) => incidentDate.value = date,
                validator:
                    (value) =>
                        incidentDate.value == null
                            ? context.lango.pleaseSelectIncidentDate // <-- REPLACED
                            : null,
              ),
              const SizedBox(height: 16),
              AppDropdownField<IncidentType>(
                value: incidentType.value,
                labelText: context.lango.incidentType, // <-- REPLACED
                items:
                    IncidentType.values
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.name.toDisplayCase()),
                          ),
                        )
                        .toList(),
                onChanged: (value) => incidentType.value = value,
                validator:
                    (value) =>
                        value == null ? context.lango.pleaseSelectAnIncidentType : null, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: descriptionController,
                labelText: context.lango.descriptionOfIncident, // <-- REPLACED
                hintText:
                    context.lango.provideClearDetailedDescription, // <-- REPLACED
                maxLines: 7,
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? context.lango.pleaseEnterDescription // <-- REPLACED
                            : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: isLoading.value ? null : submitForm,
                child:
                    isLoading.value
                        ? const CircularProgressIndicator.adaptive()
                        : Text(context.lango.submitReport), // <-- REPLACED & REMOVED CONST
              ),
            ],
          ),
        ),
      ),
    );
  }
} 