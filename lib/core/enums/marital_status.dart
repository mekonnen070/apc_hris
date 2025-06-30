// Represents the marital status of an individual.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'marital_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum MaritalStatus {
  @JsonValue(0)
  single,

  @JsonValue(1)
  married,

  @JsonValue(2)
  divorced,

  @JsonValue(3)
  widowed,

  @JsonValue(4)
  separated,
}