
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_type.g.dart';

@JsonEnum(alwaysCreate: true)

enum IncidentType {
  @JsonValue(0)
  safety,

  @JsonValue(1)
  conduct,

  @JsonValue(2)
  harassment,

  @JsonValue(3)
  theft,

  @JsonValue(4)
  grievance,

  @JsonValue(5)
  other,
}
