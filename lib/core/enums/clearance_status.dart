// lib/core/enums/clearance_status.dart

import 'package:json_annotation/json_annotation.dart';

part 'clearance_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum ClearanceStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  approved,

  @JsonValue(2)
  rejected,

  @JsonValue(3)
  processing,

  @JsonValue(4)
  completed,
}
