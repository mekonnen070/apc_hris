import 'package:freezed_annotation/freezed_annotation.dart';

part 'religion.g.dart';

@JsonEnum(alwaysCreate: true)
enum Religion {
  @JsonValue(0)
  islam,

  @JsonValue(1)
  christianity,

  @JsonValue(2)
  hinduism,

  @JsonValue(3)
  buddhism,

  @JsonValue(4)
  judaism,

  @JsonValue(5)
  other,
}
