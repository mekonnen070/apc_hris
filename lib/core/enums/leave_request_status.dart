/// Represents the status of a leave request.
///
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_request_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum LeaveRequestStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  approved,

  @JsonValue(2)
  rejected,

  @JsonValue(3)
  cancelled,
}
