import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/placement/domain/placement.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

final placementRepositoryProvider = Provider<IPlacementRepository>((ref) {
  const useMockData = true;
  if (useMockData) {
    return MockPlacementRepository();
  }
  // return PlacementRepository(ref.watch(dioClientProvider));
});

abstract class IPlacementRepository {
  Future<List<Placement>> getAvailablePlacements({
    required int page,
    required int pageSize,
  });
  Future<Placement> getPlacementDetails({required int placementId});
  Future<PlacementApplicant> getMyApplicationForPlacement({
    required int placementId,
  });
  Future<List<PlacementApplicant>> getSelectedApplicants({
    required int placementId,
  });
  Future<void> applyForPlacement({
    required int placementId,
    required String reason,
  });
  Future<void> submitAppeal({
    required int applicationId,
    required String appealReason,
  });
}

class PlacementRepository implements IPlacementRepository {
  final Dio _dio;
  PlacementRepository(this._dio);

  @override
  Future<List<Placement>> getAvailablePlacements({
    required int page,
    required int pageSize,
  }) async {
    final response = await _dio.get(
      ApiEndpoints.availablePlacements,
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    return (response.data as List).map((e) => Placement.fromJson(e)).toList();
  }

  @override
  Future<Placement> getPlacementDetails({required int placementId}) async {
    final response = await _dio.get(
      '${ApiEndpoints.placementDetails}/$placementId',
    );
    return Placement.fromJson(response.data);
  }

  @override
  Future<void> applyForPlacement({
    required int placementId,
    required String reason,
  }) async {
    await _dio.post(
      ApiEndpoints.applyForPlacement,
      data: {'placementId': placementId, 'reason': reason},
    );
  }

  @override
  Future<PlacementApplicant> getMyApplicationForPlacement({
    required int placementId,
  }) async {
    final response = await _dio.get(
      '${ApiEndpoints.myPlacementApplications}/$placementId',
    );
    return PlacementApplicant.fromJson(response.data);
  }

  @override
  Future<List<PlacementApplicant>> getSelectedApplicants({
    required int placementId,
  }) async {
    final response = await _dio.get(
      '${ApiEndpoints.placementSelectedApplicants}/$placementId',
    );
    return (response.data as List)
        .map((e) => PlacementApplicant.fromJson(e))
        .toList();
  }

  @override
  Future<void> submitAppeal({
    required int applicationId,
    required String appealReason,
  }) async {
    await _dio.post(
      ApiEndpoints.submitPlacementAppeal,
      data: {'applicationId': applicationId, 'appealReason': appealReason},
    );
  }
}

class MockPlacementRepository implements IPlacementRepository {
  final _availablePlacements = List.generate(30, (index) {
    ApplicantStatus? status;
    if (index % 5 == 0) status = ApplicantStatus.applied;
    if (index % 5 == 1) status = ApplicantStatus.notSelected;
    if (index % 5 == 2) status = ApplicantStatus.appealed;
    if (index % 5 == 3) status = ApplicantStatus.appealed;
    if (index % 5 == 4) status = ApplicantStatus.selected;

    return Placement(
      placementAnnouncementId: index + 1,
      title: 'Deployment to Zone #${index + 1}',
      description:
          'Standard operational deployment to a new zone for a period of six months.',
      startDate: DateTime.now().add(Duration(days: 60 + index * 10)),
      endDate: DateTime.now().add(Duration(days: 240 + index * 10)),
      location: 'North Gondar Zone',
      currentUserApplicationStatus: index == 0 || index == 1 ? null : status,
    );
  });

  // Mock data stores
  final _myApplications = <int, PlacementApplicant>{};
  final _selectedApplicants = <int, List<PlacementApplicant>>{};

  @override
  Future<List<Placement>> getAvailablePlacements({
    required int page,
    required int pageSize,
  }) async {
    await Future.delayed(const Duration(milliseconds: 700));
    final start = (page - 1) * pageSize;
    int end = start + pageSize;
    if (start >= _availablePlacements.length) return [];
    if (end > _availablePlacements.length) end = _availablePlacements.length;
    return _availablePlacements.sublist(start, end);
  }

  @override
  Future<Placement> getPlacementDetails({required int placementId}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _availablePlacements.firstWhere(
      (p) => p.placementAnnouncementId == placementId,
    );
  }

  @override
  Future<void> applyForPlacement({
    required int placementId,
    required String reason,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final placement = _availablePlacements.firstWhere(
      (p) => p.placementAnnouncementId == placementId,
    );
    final index = _availablePlacements.indexOf(placement);
    _availablePlacements[index] = placement.copyWith(
      currentUserApplicationStatus: ApplicantStatus.applied,
    );
  }

  @override
  Future<PlacementApplicant> getMyApplicationForPlacement({
    required int placementId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final placement = _availablePlacements.firstWhere(
      (p) => p.placementAnnouncementId == placementId,
    );
    if (placement.currentUserApplicationStatus == null) {
      throw Exception('Not applied for this placement.');
    }
    _myApplications.putIfAbsent(
      placementId,
      () => PlacementApplicant(
        placementApplicantId: placementId * 100,
        placementAnnouncementId: placementId,
        employeeId: 'current_user',
        appliedDate: DateTime.now().subtract(const Duration(days: 3)),
        status: placement.currentUserApplicationStatus!,
      ),
    );
    return _myApplications[placementId]!;
  }

  @override
  Future<List<PlacementApplicant>> getSelectedApplicants({
    required int placementId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _selectedApplicants.putIfAbsent(
      placementId,
      () => List.generate(
        Random().nextInt(15) + 5,
        (index) => PlacementApplicant(
          placementApplicantId: (placementId * 1000) + index,
          placementAnnouncementId: placementId,
          employeeId: 'EMP-01$index',
          employeeFullName: 'Officer ${index + 1}',
          employeePhotoPath: 'https://i.pravatar.cc/150?u=placement$index',
          appliedDate: DateTime.now().subtract(const Duration(days: 12)),
          status: ApplicantStatus.selected,
        ),
      ),
    );
    return _selectedApplicants[placementId]!;
  }

  @override
  Future<void> submitAppeal({
    required int applicationId,
    required String appealReason,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final placementId = (applicationId / 100).floor();
    final application = _myApplications[placementId];
    if (application != null) {
      _myApplications[placementId] = application.copyWith(
        status: ApplicantStatus.appealed,
      );
    }
  }
}
