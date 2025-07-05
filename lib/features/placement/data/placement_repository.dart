import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/placement/domain/placement_announcement.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

/// Provider for the Placement Repository.
/// This will be the single entry point for the application layer to interact
/// with placement data.
final placementRepositoryProvider = Provider<IPlacementRepository>((ref) {
  final dio = ref.watch(dioClientProvider);
  return PlacementRepository(dio);
});

/// The abstract interface (contract) for the placement repository.
abstract class IPlacementRepository {
  /// Fetches a list of all available placement announcements.
  Future<List<PlacementAnnouncement>> getPlacementAnnouncements();

  /// Fetches the detailed information for a single placement announcement.
  Future<PlacementAnnouncement> getPlacementAnnouncementDetail(int id);

  /// Submits a new application for a placement.
  Future<void> applyForPlacement(PlacementApplicant application);

  /// Fetches all applications submitted by a specific employee.
  Future<List<PlacementApplicant>> getMyApplications({
    required String employeeId,
  });
}

/// The concrete implementation of the repository.
class PlacementRepository implements IPlacementRepository {
  final DioClient _dio;
  PlacementRepository(this._dio);

  @override
  Future<List<PlacementAnnouncement>> getPlacementAnnouncements() async {
    try {
      // Note: Using the endpoint exactly as specified in the Swagger doc, including the typo.
      final response = await _dio.get(ApiEndpoints.placementAnnouncements);
      final data = response.data as List;
      return data.map((item) => PlacementAnnouncement.fromJson(item)).toList();
    } catch (e, st) {
      log('Failed to fetch placement announcements', error: e, stackTrace: st);
      // Re-throw the error to be handled by the application layer (notifier).
      rethrow;
    }
  }

  @override
  Future<PlacementAnnouncement> getPlacementAnnouncementDetail(int id) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.placementAnnouncementDetail,
        queryParameters: {'id': id},
      );
      return PlacementAnnouncement.fromJson(response.data);
    } catch (e, st) {
      log(
        'Failed to fetch placement detail for ID: $id',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  @override
  Future<void> applyForPlacement(PlacementApplicant application) async {
    try {
      // The backend expects a JSON body for creating an application.
      await _dio.post(
        ApiEndpoints.createPlacementApplication,
        data: application.toJson(),
      );
    } catch (e, st) {
      log('Failed to apply for placement', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<List<PlacementApplicant>> getMyApplications({
    required String employeeId,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.myPlacementApplications,
        queryParameters: {'employeeId': employeeId},
      );
      final data = response.data as List;
      final applications =
          data.map((item) => PlacementApplicant.fromJson(item)).toList();

      return applications;
    } catch (e, st) {
      log(
        'Failed to fetch applications for employee: $employeeId',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
