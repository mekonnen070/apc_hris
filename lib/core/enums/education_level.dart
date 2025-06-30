// Describes various levels of educational attainment.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_level.g.dart';

@JsonEnum(alwaysCreate: true)
enum EducationLevel {
  @JsonValue(0)
  elementarySchool,

  @JsonValue(1)
  secondarySchoolFirstCycle,

  @JsonValue(2)
  secondarySchoolSecondCycle,

  @JsonValue(3)
  tvet,

  @JsonValue(4)
  certificate,

  @JsonValue(5)
  diploma,

  @JsonValue(6)
  advancedDiploma,

  @JsonValue(7)
  bachelorsDegree,

  @JsonValue(8)
  bachelorsDegreeFiveYear,

  @JsonValue(9)
  llbDegree,

  @JsonValue(10)
  mdDegree,

  @JsonValue(11)
  pharmDDegree,

  @JsonValue(12)
  postgraduateDiploma,

  @JsonValue(13)
  mastersDegree,

  @JsonValue(14)
  mba,

  @JsonValue(15)
  llm,

  @JsonValue(16)
  specialtyCertificate,

  @JsonValue(17)
  doctorOfMedicineSpecialty,

  @JsonValue(18)
  phD,

  @JsonValue(19)
  associateDegree,

  @JsonValue(20)
  highSchoolDiploma,

  @JsonValue(21)
  ged,

  @JsonValue(22)
  other,
}
