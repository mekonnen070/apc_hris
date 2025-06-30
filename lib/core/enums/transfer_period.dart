import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_period.g.dart';

@JsonEnum(alwaysCreate: true)
enum TransferPeriod {
  @JsonValue(0)
  january,

  @JsonValue(1)
  july,
}