// lib/features/promotion/domain/promotion_request.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/promotion_status.dart';

part 'promotion_request.freezed.dart';
part 'promotion_request.g.dart';

@freezed
abstract class PromotionRequest with _$PromotionRequest {
  const factory PromotionRequest({
    required int id,
    required String employeeId,
    required DateTime requestDate,
    required String currentPositionId,
    required String promotedToPositionId,
    required String reason,
    String? comments,
    required PromotionStatus status,
  }) = _PromotionRequest;

  factory PromotionRequest.fromJson(Map<String, dynamic> json) =>
      _$PromotionRequestFromJson(json);
}
