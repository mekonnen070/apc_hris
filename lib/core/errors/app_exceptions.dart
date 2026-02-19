/// Thrown when a user logs in successfully but their account
/// is not linked to any employee record (employeeId is null).
class NoEmployeeLinkedExeption implements Exception {
  final String message;

  const NoEmployeeLinkedExeption([
    this.message =
        'No employee linked to this account. '
            'Try another account or contact HR.',
  ]);

  @override
  String toString() => message;
}
