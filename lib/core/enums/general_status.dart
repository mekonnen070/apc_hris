/// Represents the general status for workflows, approvals, or processes in the system.
///
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum GeneralStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  submitted,

  @JsonValue(2)
  approved,

  @JsonValue(3)
  rejected,

  @JsonValue(4)
  completed,

  @JsonValue(5)
  canceled,
}
