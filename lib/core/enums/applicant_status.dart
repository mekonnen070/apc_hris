import 'package:json_annotation/json_annotation.dart';

part 'applicant_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum ApplicantStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  submitted,

  @JsonValue(2)
  selected,

  @JsonValue(3)
  rejected,

  @JsonValue(4)
  underReview,

  @JsonValue(5)
  offered,

  @JsonValue(6)
  completed,

  @JsonValue(7)
  progress,

  @JsonValue(8)
  withdrawn,
}
