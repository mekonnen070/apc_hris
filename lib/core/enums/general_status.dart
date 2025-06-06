/// Represents the general status for workflows, approvals, or processes in the system.
///
enum GeneralStatus {
  /// The item is pending and awaiting action.
  pending,

  /// The item has been submitted for review or processing.
  submitted,

  /// The item has been approved.
  approved,

  /// The item has been rejected.
  rejected,

  /// The process or item is completed.
  completed,

  /// The process or item has been canceled.
  canceled,
}
