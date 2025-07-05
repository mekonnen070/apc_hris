import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_modality.g.dart';

@JsonEnum(alwaysCreate: true)
enum TrainingModality {
  @JsonValue(0)
  regularEducation,

  @JsonValue(1)
  summerEducation,

  @JsonValue(2)
  distanceEducation,

  @JsonValue(3)
  missionaryEducation,

  @JsonValue(4)
  other,
}
