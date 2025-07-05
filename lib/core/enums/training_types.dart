import 'package:json_annotation/json_annotation.dart';

part 'training_types.g.dart';

@JsonEnum(alwaysCreate: true)
enum TrainingTypes {
  @JsonValue(0)
  shortTerm,

  @JsonValue(1)
  midTerm,

  @JsonValue(2)
  longTerm,

  @JsonValue(3)
  other,
}
