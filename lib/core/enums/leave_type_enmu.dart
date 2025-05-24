enum LeaveType { annual, sick, unpaid, parental }

extension LeaveTypeExtension on LeaveType {
  String get title {
    switch (this) {
      case LeaveType.annual:
        return 'Annual Leave';
      case LeaveType.sick:
        return 'Sick Leave';
      case LeaveType.unpaid:
        return 'Unpaid Leave';
      case LeaveType.parental:
        return 'Parental Leave';
    }
  }
}
