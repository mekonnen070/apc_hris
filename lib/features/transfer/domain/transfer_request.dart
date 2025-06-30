import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/enums/transfer_levels.dart';
import 'package:police_com/core/enums/transfer_period.dart';
import 'package:police_com/core/enums/transfer_reasons.dart';

part 'transfer_request.freezed.dart';
part 'transfer_request.g.dart';

@freezed
abstract class TransferRequest with _$TransferRequest {
  const factory TransferRequest({
    // --- Renamed & Type Changed ---
    required int transferRequestId,
    String? employeeId,

    // --- Current Location/Position ---
    required String? currentLocation,
    String? currentLocationId,
    required String? currentDepartment,
    required String? currentPosition,

    // --- New Enum Fields ---
    required TransferLevels transferLevelFrom,
    required TransferLevels transferLevelTo,

    // --- Destination Location/Position (Renamed) ---
    required String? requestedLocation,
    String? requestedLocationId,
    String? requestedDepartment,
    String? requestedDepartmentId,
    String? requestedPositionTitle,
    String? requestedPositionId,

    // --- Date and Reason ---
    required DateTime requestDate,
    TransferPeriod? transferPeriod,
    String? transferYear,
    TransferReasons? reasonForRequest,

    // --- Approval Info ---
    String? approvedBy,
    DateTime? approvalDate,
    @Default(TransferStatus.pending) TransferStatus status,
  }) = _TransferRequest;

  factory TransferRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestFromJson(json);
}
