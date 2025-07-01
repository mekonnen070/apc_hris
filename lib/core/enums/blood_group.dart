// Represents blood groups.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_group.g.dart';

@JsonEnum(alwaysCreate: true)
enum BloodGroup {
  @JsonValue(0)
  aPositive,
  @JsonValue(1)
  aNegative,
  @JsonValue(2)
  bPositive,
  @JsonValue(3)
  bNegative,
  @JsonValue(4)
  abPositive,
  @JsonValue(5)
  abNegative,
  @JsonValue(6)
  oPositive,
  @JsonValue(7)
  oNegative,
  @JsonValue(8)
  unknown,
}
