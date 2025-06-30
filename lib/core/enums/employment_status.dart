// Represents the employment status of an employee.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'employment_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum EmploymentStatus {
  @JsonValue(0)
  active,

  @JsonValue(1)
  eligible, // For what? Might need clarification from backend context

  @JsonValue(2)
  noticeGiven,

  @JsonValue(3)
  rejected,

  @JsonValue(4)
  processing,

  @JsonValue(5)
  retired,
}
