import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocumentManagementPage extends ConsumerStatefulWidget {
  const DocumentManagementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DocumentManagementPageState();
}

class _DocumentManagementPageState
    extends ConsumerState<DocumentManagementPage> {
  final List<String> _documents = [];

  void _uploadDocument() {
    setState(() => _documents.add('Document ${_documents.length + 1}.pdf'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Document Management')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FilledButton.icon(
              onPressed: _uploadDocument,
              icon: const Icon(Icons.upload_file),
              label: Text(
                _documents.isEmpty
                    ? 'Upload Document'
                    : 'Upload Another Document',
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child:
                  _documents.isEmpty
                      ? const Center(child: Text('No documents uploaded yet.'))
                      : ListView.builder(
                        itemCount: _documents.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.insert_drive_file),
                            title: Text(_documents[index]),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
