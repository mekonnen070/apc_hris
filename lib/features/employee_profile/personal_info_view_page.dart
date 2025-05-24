import 'package:flutter/material.dart';
import 'package:police_com/features/employee_profile/personal_info_page.dart';

class PersonalInformationViewPage extends StatelessWidget {
  const PersonalInformationViewPage({super.key});

  // Dummy data for demonstration.
  // Keys must match the form field names in PersonalInformationPage.
  final Map<String, dynamic> dummyData = const {
    'fullName': 'Kdot Alem',
    'address': 'Bahir Dar',
    'phone': '0923456789',
    'email': 'Kdot773@gmail.com',
    'dateOfBirth': '2000-01-01', // We will convert this to DateTime below.
    'gender': 'Male',
    'maritalStatus': 'Single',
  };

  // Helper method to convert string to DateTime.
  DateTime? _parseDate(String dateString) {
    try {
      return DateTime.parse(dateString);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Convert dummyData's dateOfBirth to a DateTime
    final Map<String, dynamic> viewData = Map<String, dynamic>.from(dummyData);
    if (viewData.containsKey('dateOfBirth') &&
        viewData['dateOfBirth'] is String) {
      viewData['dateOfBirth'] = _parseDate(viewData['dateOfBirth']);
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display each field as a Card with ListTile.
            Expanded(
              child: ListView(
                children:
                    viewData.entries.map((entry) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text(entry.key),
                          subtitle: Text(
                            entry.value is DateTime
                                ? (entry.value as DateTime)
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0]
                                : entry.value.toString(),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the editable PersonalInformationPage,
                  // passing the dummy data.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              PersonalInformationPage(initialData: viewData),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Edit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
