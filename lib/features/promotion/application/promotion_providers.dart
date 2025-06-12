// lib/features/promotion/application/promotion_providers.dart
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/promotion/application/data/promotion_repository.dart';
import 'package:police_com/features/promotion/domain/promotion_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'promotion_providers.g.dart';

@riverpod
Future<List<PromotionRequest>> myPromotionRequests(Ref ref, String employeeId) {
  // In a real app, employeeId would come from an auth provider
  return ref
      .watch(promotionRepositoryProvider)
      .getMyPromotionRequests(employeeId);
}
