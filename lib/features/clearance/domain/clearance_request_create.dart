import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/clearance_status.dart';
import 'package:police_com/core/enums/clearance_type.dart';

part 'clearance_request_create.freezed.dart';
part 'clearance_request_create.g.dart';

@freezed
abstract class ClearanceRequestCreate with _$ClearanceRequestCreate {
  const factory ClearanceRequestCreate({
    required String requestId,
    required String employeeId,
    required ClearanceType type,
    required DateTime requestDate,
    DateTime? targetCompletionDate,
    @Default(ClearanceStatus.pending) ClearanceStatus clearanceStatus,
    String? remarks,
  }) = _ClearanceRequestCreate;

  factory ClearanceRequestCreate.fromJson(Map<String, dynamic> json) =>
      _$ClearanceRequestCreateFromJson(json);
}
