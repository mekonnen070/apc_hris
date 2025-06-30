import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_levels.g.dart';

@JsonEnum(alwaysCreate: true)
enum TransferLevels {
  @JsonValue(0)
  otherRegionPoliceCommission,

  @JsonValue(1)
  amharaPoliceCommission,

  @JsonValue(2)
  zone,

  @JsonValue(3)
  policeCollege,

  @JsonValue(4)
  birgade,

  @JsonValue(5)
  battalion,

  @JsonValue(6)
  shambel,

  @JsonValue(7)
  woreda,

  @JsonValue(8)
  kebele,
}