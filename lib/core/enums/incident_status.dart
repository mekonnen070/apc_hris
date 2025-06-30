import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum IncidentStatus {
  @JsonValue(0)
  submitted,

  @JsonValue(1)
  underReview,

  @JsonValue(2)
  resolved,

  @JsonValue(3)
  closed,
}
