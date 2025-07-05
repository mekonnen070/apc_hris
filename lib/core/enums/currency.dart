import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.g.dart';

/// Represents supported currencies in the system.
@JsonEnum(alwaysCreate: true)
enum Currency {
  @JsonValue(0)
  etb,

  @JsonValue(1)
  usd,

  @JsonValue(2)
  eur,

  @JsonValue(3)
  gbp,
}
