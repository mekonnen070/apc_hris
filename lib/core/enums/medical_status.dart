// Represents an employee's medical fitness status.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum MedicalStatus {
  @JsonValue(0)
  fit,

  @JsonValue(1)
  unfit,

  @JsonValue(2)
  pending,

  @JsonValue(3)
  other,
}
