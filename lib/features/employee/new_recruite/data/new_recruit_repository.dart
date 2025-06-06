import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
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
}

class MockNewRecruitRepository implements INewRecruitRepository {
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
    // Simulate a successful creation
  }
}
