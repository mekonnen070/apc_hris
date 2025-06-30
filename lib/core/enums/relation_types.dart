import 'package:freezed_annotation/freezed_annotation.dart';

part 'relation_types.g.dart';

@JsonEnum(alwaysCreate: true)
enum RelationTypes {
  @JsonValue(0)
  husband,

  @JsonValue(1)
  wife,

  @JsonValue(2)
  child,

  @JsonValue(3)
  father,

  @JsonValue(4)
  mother,

  @JsonValue(5)
  brother,

  @JsonValue(6)
  sister,

  @JsonValue(7)
  guardian,

  @JsonValue(8)
  other,
}
