import 'package:json_annotation/json_annotation.dart';

part 'clearance_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum ClearanceType {
  @JsonValue(0)
  resignation,

  @JsonValue(1)
  termination,

  @JsonValue(2)
  retirement,

  @JsonValue(3)
  transfer,

  @JsonValue(4)
  promotion,

  @JsonValue(5)
  contractEnd,

  @JsonValue(6)
  leaveOfAbsence,
}
