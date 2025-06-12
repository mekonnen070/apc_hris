// lib/features/clearance/domain/clearance_request.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/clearance_reason.dart';
import 'package:police_com/core/enums/clearance_status.dart';

part 'clearance_request.freezed.dart';
part 'clearance_request.g.dart';

@freezed
abstract class ClearanceRequest with _$ClearanceRequest {
  const factory ClearanceRequest({
    required int id,
    required String employeeId,
    required ClearanceReason reason,
    required DateTime requestDate,
    required DateTime lastDayOfWork,
    String? comments,
    required ClearanceStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ClearanceRequest;

  factory ClearanceRequest.fromJson(Map<String, dynamic> json) =>
      _$ClearanceRequestFromJson(json);
}
