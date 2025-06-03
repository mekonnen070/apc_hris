// lib/features/recruitment/presentation/widgets/onboarding_task_item_widget.dart
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/onboarding_task_status.dart';
import 'package:police_com/core/enums/task_assignee_type.dart';
import 'package:police_com/core/extensions/enum_extension.dart';
import 'package:police_com/features/employee/employee_recruitment/application/providers/onboarding_providers.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/onboarding_task_model.dart';

class OnboardingTaskItemWidget extends ConsumerWidget {
  final OnboardingTaskModel task;
  final String
  applicantId; // Needed to interact with the correct notifier instance

  const OnboardingTaskItemWidget({
    super.key,
    required this.task,
    required this.applicantId,
  });

  // Helper to get color based on status
  Color _getStatusColor(OnboardingTaskStatus status, ThemeData theme) {
    switch (status) {
      case OnboardingTaskStatus.pending:
        return Colors.orange.shade700;
      case OnboardingTaskStatus.inProgress:
        return theme.colorScheme.primary;
      case OnboardingTaskStatus.completed:
        return Colors.green.shade700;
      case OnboardingTaskStatus.waived:
        return Colors.grey.shade600;
      case OnboardingTaskStatus.requiresAttention:
        return theme.colorScheme.error;
      default:
        return theme.textTheme.bodySmall?.color ?? Colors.grey;
    }
  }

  // Helper to show dialog for updating status/notes (for HR)
  void _showUpdateTaskDialog(BuildContext context, WidgetRef ref) {
    final notesController = TextEditingController(
      text: task.notes ?? task.checkRemark ?? '',
    );
    OnboardingTaskStatus selectedStatus = task.status;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          // To update status dropdown within dialog
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text('Update Task: ${task.title}'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<OnboardingTaskStatus>(
                      decoration: const InputDecoration(
                        labelText: 'New Status',
                      ),
                      value: selectedStatus,
                      items:
                          OnboardingTaskStatus.values.map((status) {
                            return DropdownMenuItem(
                              value: status,
                              child: Text(status.toDisplayString),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setStateDialog(() => selectedStatus = value);
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: notesController,
                      decoration: InputDecoration(
                        labelText:
                            task.isChecklistItem
                                ? 'Check Remark'
                                : 'Notes / Comments',
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(dialogContext).pop(),
                ),
                ElevatedButton(
                  child: const Text('Save Update'),
                  onPressed: () {
                    ref
                        .read(onboardingNotifierProvider(applicantId).notifier)
                        .updateTaskStatus(
                          task.id,
                          selectedStatus,
                          notes:
                              task.isChecklistItem
                                  ? null
                                  : notesController.text,
                          remark:
                              task.isChecklistItem
                                  ? notesController.text
                                  : null,
                        );
                    Navigator.of(dialogContext).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Helper to handle document upload for tasks assigned to NewHire (initiated by HR view for now)
  void _handleDocumentUpload(BuildContext context, WidgetRef ref) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'jpg',
        'png',
        'doc',
        'docx',
      ], // Common document types
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      // ignore: unused_result
      ref
          .read(onboardingNotifierProvider(applicantId).notifier)
          .uploadDocumentForTask(task.id, file);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    bool isHrTask =
        task.assignedTo == TaskAssigneeType.hr ||
        task.assignedTo == TaskAssigneeType.manager ||
        task.assignedTo == TaskAssigneeType.system;
    bool canHrUpdate =
        task.status != OnboardingTaskStatus.completed &&
        task.status != OnboardingTaskStatus.waived;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: _getStatusColor(task.status, theme).withOpacity(0.5),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        leading: Icon(
          task.status == OnboardingTaskStatus.completed
              ? Icons.check_circle_rounded
              : task.status == OnboardingTaskStatus.waived
              ? Icons.do_not_disturb_on_rounded
              : task.status == OnboardingTaskStatus.requiresAttention
              ? Icons.error_rounded
              : task.status == OnboardingTaskStatus.inProgress
              ? Icons.hourglass_top_rounded
              : Icons.pending_actions_rounded,
          color: _getStatusColor(task.status, theme),
          size: 28,
        ),
        title: Text(
          task.title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description != null && task.description!.isNotEmpty) ...[
              Text(task.description!, style: theme.textTheme.bodySmall),
              const SizedBox(height: 4),
            ],
            Text(
              'Assigned to: ${task.assignedTo.toDisplayString}',
              style: theme.textTheme.bodySmall,
            ),
            if (task.dueDate != null)
              Text(
                'Due: ${DateFormat('dd MMM, yyyy').format(task.dueDate!)}',
                style: theme.textTheme.bodySmall,
              ),
            if (task.completionDate != null)
              Text(
                'Completed: ${DateFormat('dd MMM, yyyy').format(task.completionDate!)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.green.shade700,
                ),
              ),
            if (task.notes != null && task.notes!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  'Notes: ${task.notes}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            if (task.isChecklistItem &&
                task.checkRemark != null &&
                task.checkRemark!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  'Remark: ${task.checkRemark}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            if (task.requiredDocumentName != null) ...[
              const SizedBox(height: 6),
              Text(
                'Requires: ${task.requiredDocumentName}',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (task.uploadedDocumentPath != null)
                Text(
                  'Uploaded: ${task.uploadedDocumentPath!.split('/').last}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.blue.shade700,
                  ),
                )
              else if (task.assignedTo ==
                  TaskAssigneeType
                      .newHire) // Only show upload for new hire tasks if not yet uploaded
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: TextButton.icon(
                    // This button is for HR to *trigger* an upload on behalf of the user for now, or to mark as received
                    icon: const Icon(Icons.upload_file_outlined, size: 16),
                    label: const Text(
                      'Manage Document',
                      style: TextStyle(fontSize: 12),
                    ),
                    onPressed:
                        () =>
                            _handleDocumentUpload(context, ref), // Mock upload
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 20),
                    ),
                  ),
                ),
            ],
          ],
        ),
        trailing:
            (isHrTask &&
                    canHrUpdate) // HR can update tasks assigned to HR, System, or Manager
                ? IconButton(
                  icon: const Icon(Icons.edit_note_outlined),
                  tooltip: 'Update Task Status/Notes',
                  onPressed: () => _showUpdateTaskDialog(context, ref),
                )
                : null,
        isThreeLine: true, // Adjust based on content
      ),
    );
  }
}
