import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/transfer_request_status.dart';

part 'transfer_request_model.freezed.dart';
part 'transfer_request_model.g.dart';

@freezed
abstract class TransferRequestModel with _$TransferRequestModel {
  const factory TransferRequestModel({
    required String id, // Unique request ID
    required String employeeId,
    required String employeeFullName, // For display convenience
    required String currentPositionTitle,
    required String currentDepartment,
    required String currentLocation, // e.g., Station Name or City
    // Requested Destination
    required String
    requestedDepartment, // Could be a specific department ID or name
    required String
    requestedLocation, // Could be a specific location ID or name
    String?
    requestedPositionTitle, // Optional: if applying for a known vacant position

    required String reasonForRequest,
    required DateTime requestDate,
    @Default(TransferRequestStatus.pendingManagerApproval)
    TransferRequestStatus status,

    String? managerComments,
    String? hrComments,
    DateTime? effectiveDate, // Date the transfer becomes active if approved
    DateTime? lastUpdated, // Timestamp of the last status change or comment
  }) = _TransferRequestModel;

  factory TransferRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestModelFromJson(json);
}

// To generate: flutter pub run build_runner build --delete-conflicting-outputs
