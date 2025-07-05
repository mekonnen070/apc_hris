import 'package:json_annotation/json_annotation.dart';

part 'training_warranty.g.dart';

@JsonEnum(alwaysCreate: true)
enum TrainingWarranty {
  @JsonValue(0)
  certificate,

  @JsonValue(1)
  diploma,

  @JsonValue(2)
  seniorDiploma,

  @JsonValue(3)
  bscDegree,

  @JsonValue(4)
  mscDegree,

  @JsonValue(5)
  phdDegree,

  @JsonValue(6)
  other,
}
