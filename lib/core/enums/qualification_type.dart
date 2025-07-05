import 'package:json_annotation/json_annotation.dart';

part 'qualification_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum QualificationType {
  @JsonValue(0)
  professional,

  @JsonValue(1)
  certification,

  @JsonValue(2)
  competency,

  @JsonValue(3)
  other,
}
