/// Enum representing different marital statuses.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'marital_status_enum.g.dart';

@JsonEnum(alwaysCreate: true)
enum MaritalStatusEnum {
  @JsonValue(0)
  single,

  @JsonValue(1)
  married,

  @JsonValue(2)
  divorced,

  @JsonValue(3)
  widowed,
}
