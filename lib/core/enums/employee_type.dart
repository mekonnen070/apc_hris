// Differentiates between military and civilian employee types.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum EmployeeType {
  @JsonValue(0)
  military,

  @JsonValue(1)
  civilian,
}