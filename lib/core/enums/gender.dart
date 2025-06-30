import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender.g.dart';

@JsonEnum(alwaysCreate: true)
enum Gender {
  @JsonValue(0)
  male,
  @JsonValue(1)
  female,
  @JsonValue(2)
  other,
}
