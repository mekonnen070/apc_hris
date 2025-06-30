// Represents the current status of an educational qualification.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum EducationStatus {
  @JsonValue(0)
  inProgress,

  @JsonValue(1)
  completed,

  @JsonValue(2)
  onHold,

  @JsonValue(3)
  fraud,
}