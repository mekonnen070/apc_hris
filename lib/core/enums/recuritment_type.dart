import 'package:freezed_annotation/freezed_annotation.dart';

part 'recuritment_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum RecuritmentType {
  @JsonValue(0)
  military,

  @JsonValue(1)
  civilian,
}
