import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruit_info.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruitment_announcement.dart';

final newRecruitRepositoryProvider = Provider<INewRecruitRepository>((ref) {
  const useMockData = true;
  if (useMockData) {
    return MockNewRecruitRepository();
  }
  // return NewRecruitRepository(ref.watch(dioClientProvider));
});

abstract class INewRecruitRepository {
  Future<List<RecruitmentAnnouncement>> getRecruitmentAnnouncements();
  Future<void> createRecruit(RecruitInfo recruitInfo);
  Future<List<RecruitInfo>> getMyRecruits({
    required int page,
    required int pageSize,
    required RecruitStatus status,
  });
  Future<void> updateRecruitsStatus({
    required List<int> recruitIds,
    required RecruitStatus status,
  });
}

class NewRecruitRepository implements INewRecruitRepository {
  final Dio _dio;
  NewRecruitRepository(this._dio);

  @override
  Future<List<RecruitmentAnnouncement>> getRecruitmentAnnouncements() async {
    final response = await _dio.get(
      ApiEndpoints.recruitmentAnnouncementsEndpoint,
    );
    return (response.data as List)
        .map((e) => RecruitmentAnnouncement.fromJson(e))
        .toList();
  }

  @override
  Future<void> createRecruit(RecruitInfo recruitInfo) async {
    await _dio.post(ApiEndpoints.recruitsEndpoint, data: recruitInfo.toJson());
  }

  @override
  Future<List<RecruitInfo>> getMyRecruits({
    required int page,
    required int pageSize,
    required RecruitStatus status,
  }) async {
    final response = await _dio.get(
      ApiEndpoints.myRecruits,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'status': status.name,
      },
    );
    return (response.data as List).map((e) => RecruitInfo.fromJson(e)).toList();
  }

  @override
  Future<void> updateRecruitsStatus({
    required List<int> recruitIds,
    required RecruitStatus status,
  }) async {
    await _dio.post(
      ApiEndpoints.updateRecruitsStatus,
      data: {'recruitIds': recruitIds, 'status': status.name},
    );
  }
}

class MockNewRecruitRepository implements INewRecruitRepository {
  final _mockRecruits = List.generate(50, (index) {
    final statuses = [
      RecruitStatus.noStatus,
      RecruitStatus.passed,
      RecruitStatus.failed,
    ];
    return RecruitInfo(
      id: index + 1,
      announcementId: 1,
      firstName: 'Recruit',
      middleName: '${index + 1}',
      lastName: 'Person',
      dateOfBirth: DateTime(2000),
      age: 25,
      gender: Gender.male,
      maritalStatus: MaritalStatus.single,
      numberOfChildren: 0,
      nationality: 'Ethiopian',
      religion: Religion.christianity,
      bloodGroup: BloodGroup.oPositive,
      photoPath: 'path/to/photo.jpg',
      woreda: 'Sample Woreda',
      kebele: '01',
      houseNumber: '123',
      phoneNumber: '0912345678',
      status: statuses[Random().nextInt(statuses.length)],
    );
  });

  @override
  Future<List<RecruitmentAnnouncement>> getRecruitmentAnnouncements() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      RecruitmentAnnouncement(
        id: 1,
        title: 'Militia Recruitment 2025',
        content: 'Annual recruitment drive for new militia members.',
        startDate: DateTime(2025),
        endDate: DateTime(2025, 2),
      ),
      RecruitmentAnnouncement(
        id: 2,
        title: 'Special Forces Intake',
        content: 'Recruitment for the special forces unit.',
        startDate: DateTime(2025, 3),
        endDate: DateTime(2025, 4),
      ),
    ];
  }

  @override
  Future<void> createRecruit(RecruitInfo recruitInfo) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<List<RecruitInfo>> getMyRecruits({
    required int page,
    required int pageSize,
    required RecruitStatus status,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final filtered = _mockRecruits.where((r) => r.status == status).toList();
    final start = (page - 1) * pageSize;
    final end = start + pageSize;

    if (start >= filtered.length) {
      return [];
    }

    return filtered.sublist(
      start,
      end > filtered.length ? filtered.length : end,
    );
  }

  @override
  Future<void> updateRecruitsStatus({
    required List<int> recruitIds,
    required RecruitStatus status,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    // Simulate success
  }
}
