import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:police_com/core/enums/leave_type_enmu.dart';

class LeaveManagementPage extends ConsumerStatefulWidget {
  const LeaveManagementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LeaveManagementPageState();
}

class _LeaveManagementPageState extends ConsumerState<LeaveManagementPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  // Use the enum values for the dropdown.
  final List<LeaveType> leaveTypes = LeaveType.values;

  // Dummy leave history list using the enum.
  final List<Map<String, dynamic>> leaveHistory = [
    {
      'type': LeaveType.annual,
      'startDate': DateTime(2025, 1, 10),
      'endDate': DateTime(2025, 1, 15),
      'status': 'Approved',
    },
    {
      'type': LeaveType.sick,
      'startDate': DateTime(2025, 3, 1),
      'endDate': DateTime(2025, 3, 3),
      'status': 'Pending',
    },
  ];

  void _submitLeaveRequest() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      // In a real app, you'd send this data to your backend.
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Leave Request Submitted')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Submit Leave Request', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  FormBuilderDropdown<LeaveType>(
                    name: 'leaveType',
                    decoration: const InputDecoration(
                      labelText: 'Leave Type',
                      border: OutlineInputBorder(),
                    ),
                    items:
                        leaveTypes
                            .map(
                              (lt) => DropdownMenuItem(
                                value: lt,
                                child: Text(lt.title),
                              ),
                            )
                            .toList(),
                    validator: FormBuilderValidators.required(
                      errorText: 'Please select a leave type',
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderDateTimePicker(
                    name: 'startDate',
                    decoration: const InputDecoration(
                      labelText: 'Start Date',
                      border: OutlineInputBorder(),
                    ),
                    inputType: InputType.date,
                    validator: FormBuilderValidators.required(
                      errorText: 'Select a start date',
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderDateTimePicker(
                    name: 'endDate',
                    decoration: const InputDecoration(
                      labelText: 'End Date',
                      border: OutlineInputBorder(),
                    ),
                    inputType: InputType.date,
                    validator: FormBuilderValidators.required(
                      errorText: 'Select an end date',
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'reason',
                    decoration: const InputDecoration(
                      labelText: 'Reason',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                    validator: FormBuilderValidators.required(
                      errorText: 'Please provide a reason',
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submitLeaveRequest,
                    child: const Text('Submit Request'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            const Text('Leave History', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            leaveHistory.isEmpty
                ? const Text('No leave history available.')
                : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: leaveHistory.length,
                  itemBuilder: (context, index) {
                    final leave = leaveHistory[index];
                    final leaveType = leave['type'] as LeaveType;
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(leaveType.title),
                        subtitle: Text(
                          'From: ${leave['startDate'].toLocal().toString().split(' ')[0]}\nTo: ${leave['endDate'].toLocal().toString().split(' ')[0]}',
                        ),
                        trailing: Text(
                          leave['status'],
                          style: TextStyle(
                            color:
                                leave['status'] == 'Approved'
                                    ? Colors.green
                                    : Colors.orange,
                          ),
                        ),
                      ),
                    );
                  },
                ),
          ],
        ),
      ),
    );
  }
}
