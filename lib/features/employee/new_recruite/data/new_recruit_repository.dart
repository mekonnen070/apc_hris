// lib/features/employee/new_recruite/data/recruit_repository.dart

import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruit_info.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruitment_announcement.dart';

final recruitRepositoryProvider = Provider<IRecruitRepository>((ref) {
  final dio = ref.watch(dioClientProvider);
  return RecruitRepository(dio);
});

abstract class IRecruitRepository {
  Future<List<RecruitInfo>> getRecruits();
  Future<void> createRecruit(RecruitInfo req);
  Future<void> editRecruit({required String id, required RecruitInfo info});
  Future<List<RecruitmentAnnouncement>> getRecruitmentAnnouncements();
}

class RecruitRepository implements IRecruitRepository {
  final DioClient _dio;
  RecruitRepository(this._dio);

  @override
  Future<List<RecruitInfo>> getRecruits() async {
    final resp = await _dio.get(ApiEndpoints.recruits);
    return (resp.data as List).map((e) => RecruitInfo.fromJson(e)).toList();
  }

  @override
  Future<void> createRecruit(RecruitInfo req) async {
    try {
      await _dio.post(ApiEndpoints.createRecruit, data: req.toJson());
    } catch (e, st) {
      log('Error: $e');
      log('Stacktrace: $st');
    }
  }

  @override
  Future<void> editRecruit({
    required String id,
    required RecruitInfo info,
  }) async {
    try {
      await _dio.post(
        ApiEndpoints.editRecruit,
        queryParameters: {'id': id},
        data: info.toJson(),
      );
    } catch (e, st) {
      log('Error: $e');
      log('Stacktrace: $st');
    }
  }

  @override
  Future<List<RecruitmentAnnouncement>> getRecruitmentAnnouncements() async {
    final response = await _dio.get(ApiEndpoints.recruitmentAnnouncements);
    return (response.data as List)
        .map((e) => RecruitmentAnnouncement.fromJson(e))
        .toList();
  }
}
