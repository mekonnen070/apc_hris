import 'package:json_annotation/json_annotation.dart';

part 'development_source.g.dart';

@JsonEnum(alwaysCreate: true)
enum DevelopmentSource {
  @JsonValue(0)
  external,

  @JsonValue(1)
  internal,
}
