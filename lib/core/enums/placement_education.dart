import 'package:freezed_annotation/freezed_annotation.dart';

part 'placement_education.g.dart';

@JsonEnum(alwaysCreate: true)
enum PlacementEducation {
  @JsonValue(0)
  fifthGrade,

  @JsonValue(1)
  sixthAndSeventh,

  @JsonValue(2)
  eighthAndNinth,

  @JsonValue(3)
  tenthComplete,

  @JsonValue(4)
  certificateLevelOne,

  @JsonValue(5)
  certificateLevelTwo,

  @JsonValue(6)
  diploma,

  @JsonValue(7)
  higherDiploma,

  @JsonValue(8)
  firstDegree,

  @JsonValue(9)
  secondDegree,

  @JsonValue(10)
  phd,
}
