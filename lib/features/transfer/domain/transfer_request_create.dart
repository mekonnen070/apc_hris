import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/transfer_levels.dart';
import 'package:police_com/core/enums/transfer_period.dart';
import 'package:police_com/core/enums/transfer_reasons.dart';

part 'transfer_request_create.freezed.dart';
part 'transfer_request_create.g.dart';

@freezed
abstract class TransferRequestCreate with _$TransferRequestCreate {
  const factory TransferRequestCreate({
    required String employeeId,
    required String currentLocation,
    required String currentLocationId,
    required String currentDepartment,
    required String currentPosition,
    required TransferLevels transferLevelFrom,
    required TransferLevels transferLevelTo,
    required String toLocation,
    required String toLocationId,
    required String toDepartment,
    required String toDepartmentId,
    required String toPosition,
    required String toPositionId,
    required DateTime requestDate,
    required TransferPeriod transferPeriod,
    required String transferYear,
    required TransferReasons transferReason,
  }) = _TransferRequestCreate;

  factory TransferRequestCreate.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestCreateFromJson(json);
}
