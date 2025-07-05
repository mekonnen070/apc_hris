import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/training/domain/training.dart';
import 'package:police_com/features/training/domain/training_applicant.dart';
import 'package:police_com/features/training/domain/training_application_request.dart';

/// Provider for the Training Repository.
final trainingRepositoryProvider = Provider<ITrainingRepository>((ref) {
  final dio = ref.watch(dioClientProvider);
  return TrainingRepository(dio);
});

/// The abstract interface for the training repository.
abstract class ITrainingRepository {
  Future<List<Training>> getAvailableTrainings();
  Future<Training> getTrainingDetail(String id);
  Future<void> applyForTraining(TrainingApplicationRequest application);
  Future<List<TrainingApplicant>> getMyApplications({
    required String employeeId,
  });
}

/// The concrete implementation of the repository.
class TrainingRepository implements ITrainingRepository {
  final DioClient _dio;
  TrainingRepository(this._dio);

  @override
  Future<List<Training>> getAvailableTrainings() async {
    try {
      final response = await _dio.get(ApiEndpoints.availableTrainings);
      final data = response.data as List;
      return data.map((item) => Training.fromJson(item)).toList();
    } catch (e, st) {
      log('Failed to fetch available trainings', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<Training> getTrainingDetail(String id) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.trainingDetail,
        queryParameters: {'id': id},
      );
      return Training.fromJson(response.data);
    } catch (e, st) {
      log(
        'Failed to fetch training detail for ID: $id',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  @override
  Future<void> applyForTraining(
    TrainingApplicationRequest applicationRequest,
  ) async {
    try {
      await _dio.post(
        ApiEndpoints.applyForTraining,
        data:
            applicationRequest
                .toJson(), // This now sends the correct, minimal data
      );
    } catch (e, st) {
      log('Failed to apply for training', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<List<TrainingApplicant>> getMyApplications({
    required String employeeId,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.myTrainingApplications,
        queryParameters: {'employeeId': employeeId},
      );
      final data = response.data as List;
      return data.map((item) => TrainingApplicant.fromJson(item)).toList();
    } catch (e, st) {
      log(
        'Failed to fetch training applications for employee: $employeeId',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
