import 'package:json_annotation/json_annotation.dart';

part 'clearance_reason.g.dart';

@JsonEnum(alwaysCreate: true)
enum ClearanceReason {
  @JsonValue(0)
  resignation,

  @JsonValue(1)
  endOfContract,

  @JsonValue(2)
  retirement,

  @JsonValue(3)
  longTermLeave,

  @JsonValue(4)
  other,
}
