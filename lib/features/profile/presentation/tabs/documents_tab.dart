// lib/features/profile/presentation/tabs/documents_tab.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

class DocumentsTab extends StatelessWidget {
  final EmployeeInfoModel employee;
  const DocumentsTab({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final documents = employee.generalDocuments;

    if (documents.isEmpty) {
      return const Center(
        child: Text('No documents available.'),
      );
    }

    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index) {
        final doc = documents[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.article_outlined),
            title: Text(doc.documentName),
            subtitle: Text(
                'Uploaded: ${doc.uploadDate != null ? DateFormat.yMMMd().format(doc.uploadDate!) : 'N/A'}'),
            onTap: () {
              // TODO: Implement document viewing or downloading
            },
          ),
        );
      },
    );
  }
}
