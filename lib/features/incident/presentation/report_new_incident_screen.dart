// lib/features/grievance/presentation/report_new_incident_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/incident_status.dart';
import 'package:police_com/core/enums/incident_type.dart';
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
            const SnackBar(
              content: Text('Incident report submitted successfully'),
            ),
          );
          Navigator.of(context).pop(true);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit report: $e')),
          );
        } finally {
          isLoading.value = false;
        }
      }
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Report New Incident'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppDateField(
                labelText: 'Incident Date',
                onDateSelected: (date) => incidentDate.value = date,
                validator:
                    (value) =>
                        incidentDate.value == null
                            ? 'Please select the incident date'
                            : null,
              ),
              const SizedBox(height: 16),
              AppDropdownField<IncidentType>(
                value: incidentType.value,
                labelText: 'Incident Type',
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
                        value == null ? 'Please select an incident type' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: descriptionController,
                labelText: 'Description of Incident',
                hintText:
                    'Please provide a clear and detailed description of the incident.',
                maxLines: 7,
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? 'Please enter a description'
                            : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: isLoading.value ? null : submitForm,
                child:
                    isLoading.value
                        ? const CircularProgressIndicator.adaptive()
                        : const Text('Submit Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
