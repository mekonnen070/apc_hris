/// Represents the approval status of a leave request.
///
enum LeaveRequestStatus {
  /// The leave request is pending and awaiting approval.
  pending,

  /// The leave request has been approved.
  approved,

  /// The leave request has been rejected.
  rejected,
}
