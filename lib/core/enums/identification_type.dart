import 'package:freezed_annotation/freezed_annotation.dart';

part 'identification_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum IdentificationType {
  @JsonValue(0)
  nationalId,

  @JsonValue(1)
  passport,

  @JsonValue(2)
  driverLicense,

  @JsonValue(3)
  organizationId,
}
