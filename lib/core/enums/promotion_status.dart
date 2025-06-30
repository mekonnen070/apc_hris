// lib/core/enums/promotion_status.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum PromotionStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  approved,

  @JsonValue(2)
  rejected,
}
