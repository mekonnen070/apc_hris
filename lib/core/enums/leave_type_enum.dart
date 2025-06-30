/// Represents the type of leave.
///
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_type_enum.g.dart';

@JsonEnum(alwaysCreate: true)
enum LeaveType {
  @JsonValue(0)
  annual,

  @JsonValue(1)
  sick,

  @JsonValue(2)
  maternity,

  @JsonValue(3)
  paternity,

  @JsonValue(4)
  unpaid,

  @JsonValue(5)
  other,
}
