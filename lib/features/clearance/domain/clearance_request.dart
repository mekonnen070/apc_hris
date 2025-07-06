import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/clearance_status.dart';
import 'package:police_com/core/enums/clearance_type.dart'; // Make sure this enum exists

part 'clearance_request.freezed.dart';
part 'clearance_request.g.dart';

@freezed
abstract class ClearanceRequest with _$ClearanceRequest {
  const factory ClearanceRequest({
    required String requestId,
    required String employeeId,
    required ClearanceType type,
    required DateTime requestDate,
    DateTime? targetCompletionDate,
    @Default(ClearanceStatus.pending) ClearanceStatus clearanceStatus,
    String? remarks,
  }) = _ClearanceRequest;

  factory ClearanceRequest.fromJson(Map<String, dynamic> json) =>
      _$ClearanceRequestFromJson(json);
}
