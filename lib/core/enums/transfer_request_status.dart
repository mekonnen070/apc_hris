// lib/core/enums/transfer_request_status.dart
enum TransferRequestStatus {
  pendingManagerApproval,
  pendingHRApproval,
  approved,
  rejectedByManager,
  rejectedByHR,
  completed, // Transfer has taken effect
  cancelledByEmployee,
  // Could add more granular states like 'InformationRequested'
}
