import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

class DocumentsTab extends StatelessWidget {
  final EmployeeInfoModel employee;
  const DocumentsTab({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final documents = employee.generalDocuments;

    if (documents.isEmpty) {
      return Center(
        child: Text(context.lango.noDocumentsAvailable), // <-- REPLACED
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
                context.lango.uploadedOn(date: doc.uploadDate != null ? DateFormat.yMMMd().format(doc.uploadDate!) : context.lango.notAvailable)), // <-- REPLACED
            onTap: () {
              // TODO: Implement document viewing or downloading
            },
          ),
        );
      },
    );
  }
}