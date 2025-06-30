import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_reasons.g.dart';

@JsonEnum(alwaysCreate: true)
enum TransferReasons {
  @JsonValue(0)
  service,

  @JsonValue(1)
  marriage,

  @JsonValue(2)
  healthProblem,

  @JsonValue(3)
  familyOrWorkMater, // Note: C# name has a typo, we match it here.

  @JsonValue(4)
  specialPlacement,
}