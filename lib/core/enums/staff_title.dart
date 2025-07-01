import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_title.g.dart';

@JsonEnum(alwaysCreate: true)
enum StaffTitle {
  @JsonValue(0)
  commissioner,
  @JsonValue(1)
  deputyCommissioner,
  @JsonValue(2)
  assistantCommissioner,
  @JsonValue(3)
  commander,
  @JsonValue(4)
  deputyCommander,
  @JsonValue(5)
  chiefInspector,
  @JsonValue(6)
  inspector,
  @JsonValue(7)
  deputyInspector,
  @JsonValue(8)
  assistantInspector,
  @JsonValue(9)
  chiefSergeant,
  @JsonValue(10)
  sergeant,
  @JsonValue(11)
  deputySergeant,
  @JsonValue(12)
  assistantSergeant,
  @JsonValue(13)
  constable,
  @JsonValue(14)
  ato,
  @JsonValue(15)
  wro,
}
