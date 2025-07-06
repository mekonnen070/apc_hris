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
    required int transferRequestId,
    // --- Nullability corrected based on C# model ---
    String? employeeId,

    // --- Current Location/Position (Required in C#) ---
    required String currentLocation,
    String? currentLocationId,
    required String currentDepartment,
    required String currentPosition,

    // --- Levels (Enums are value types, non-nullable by default in C#) ---
    required TransferLevels transferLevelFrom,
    required TransferLevels transferLevelTo,

    // --- Destination Location/Position (Nullable in C#) ---
    String? toLocation,
    String? toLocationId,
    String? toDepartment,
    String? toDepartmentId,
    String? toPosition,
    String? toPositionId,

    // --- Date and Reason ---
    required DateTime requestDate,
    required TransferPeriod transferPeriod,
    String? transferYear,
    TransferReasons? transferReason, // Corrected to be nullable
    // --- Approval Info (Nullable in C#) ---
    @Default(TransferStatus.pending) TransferStatus transferStatus,
    String? approvedBy,
    DateTime? approvalDate,
  }) = _TransferRequest;

  factory TransferRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestFromJson(json);
}
