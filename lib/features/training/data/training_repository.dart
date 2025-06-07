import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/training/domain/training.dart';
import 'package:police_com/features/training/domain/training_applicant.dart';

final trainingRepositoryProvider = Provider<ITrainingRepository>((ref) {
  const useMockData = true;
  if (useMockData) {
    return MockTrainingRepository();
  }
  // return TrainingRepository(ref.watch(dioClientProvider));
});

abstract class ITrainingRepository {
  Future<List<Training>> getAvailableTrainings({
    required int page,
    required int pageSize,
  });
  Future<Training> getTrainingDetails({required int trainingId});
  Future<TrainingApplicant> getMyApplicationForTraining({
    required int trainingId,
  });
  Future<List<TrainingApplicant>> getSelectedApplicants({
    required int trainingId,
  });
  Future<void> applyForTraining({
    required int trainingId,
    required String reason,
  });
  Future<void> submitAppeal({
    required int applicationId,
    required String appealReason,
  });
}

class TrainingRepository implements ITrainingRepository {
  final Dio _dio;
  TrainingRepository(this._dio);

  @override
  Future<List<Training>> getAvailableTrainings({
    required int page,
    required int pageSize,
  }) async {
    final response = await _dio.get(
      ApiEndpoints.availableTrainings,
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    return (response.data as List).map((e) => Training.fromJson(e)).toList();
  }

  @override
  Future<Training> getTrainingDetails({required int trainingId}) async {
    final response = await _dio.get(
      '${ApiEndpoints.trainingDetails}/$trainingId',
    );
    return Training.fromJson(response.data);
  }

  @override
  Future<void> applyForTraining({
    required int trainingId,
    required String reason,
  }) async {
    await _dio.post(
      ApiEndpoints.applyForTraining,
      data: {'trainingId': trainingId, 'reason': reason},
    );
  }

  @override
  Future<TrainingApplicant> getMyApplicationForTraining({
    required int trainingId,
  }) async {
    final response = await _dio.get(
      '${ApiEndpoints.myTrainingApplications}/$trainingId',
    );
    return TrainingApplicant.fromJson(response.data);
  }

  @override
  Future<List<TrainingApplicant>> getSelectedApplicants({
    required int trainingId,
  }) async {
    final response = await _dio.get(
      '${ApiEndpoints.trainingSelectedApplicants}/$trainingId',
    );
    return (response.data as List)
        .map((e) => TrainingApplicant.fromJson(e))
        .toList();
  }

  @override
  Future<void> submitAppeal({
    required int applicationId,
    required String appealReason,
  }) async {
    await _dio.post(
      ApiEndpoints.submitTrainingAppeal,
      data: {'applicationId': applicationId, 'appealReason': appealReason},
    );
  }
}

class MockTrainingRepository implements ITrainingRepository {
  final _availableTrainings = List.generate(40, (index) {
    ApplicantStatus? status;
    if (index % 5 == 0) status = ApplicantStatus.applied;
    if (index % 5 == 1) status = ApplicantStatus.notSelected;
    if (index % 5 == 2) status = ApplicantStatus.appealed;

    return Training(
      trainingId: index + 1,
      trainingName: 'Advanced Tactical Training #${index + 1}',
      description:
          'A comprehensive course on modern tactical operations and strategies, focusing on urban and rural environments. This training will cover advanced maneuvering, crisis negotiation, and high-risk situation management.',
      startDate: DateTime.now().add(Duration(days: 30 + index * 5)),
      endDate: DateTime.now().add(Duration(days: 35 + index * 5)),
      duration: 5,
      organizedBy: 'Federal Police Commission',
      trainingCenter: 'Kolfe Training Center',
      certificate: 'Certificate of Advanced Tactics',
      currentUserApplicationStatus: status,
    );
  });

  final _myApplications = <int, TrainingApplicant>{};
  final _applicants = <int, List<TrainingApplicant>>{};

  @override
  Future<List<Training>> getAvailableTrainings({
    required int page,
    required int pageSize,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final start = (page - 1) * pageSize;
    int end = start + pageSize;
    if (start >= _availableTrainings.length) {
      return [];
    }
    if (end > _availableTrainings.length) {
      end = _availableTrainings.length;
    }
    return _availableTrainings.sublist(start, end);
  }

  @override
  Future<Training> getTrainingDetails({required int trainingId}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _availableTrainings.firstWhere((t) => t.trainingId == trainingId);
  }

  @override
  Future<void> applyForTraining({
    required int trainingId,
    required String reason,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final training = _availableTrainings.firstWhere(
      (t) => t.trainingId == trainingId,
    );
    final index = _availableTrainings.indexOf(training);
    _availableTrainings[index] = training.copyWith(
      currentUserApplicationStatus: ApplicantStatus.applied,
    );
  }

  @override
  Future<TrainingApplicant> getMyApplicationForTraining({
    required int trainingId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final training = _availableTrainings.firstWhere(
      (t) => t.trainingId == trainingId,
    );

    if (training.currentUserApplicationStatus == null) {
      throw Exception('Not applied for this training.');
    }

    _myApplications.putIfAbsent(
      trainingId,
      () => TrainingApplicant(
        trainingApplicantId: trainingId * 100,
        trainingId: trainingId,
        employeeId: 'current_user',
        appliedDate: DateTime.now().subtract(const Duration(days: 5)),
        status: training.currentUserApplicationStatus!,
        reasonForRejection:
            training.currentUserApplicationStatus == ApplicantStatus.notSelected
                ? 'Candidate did not meet the physical fitness requirements for this advanced course.'
                : null,
      ),
    );

    return _myApplications[trainingId]!;
  }

  @override
  Future<List<TrainingApplicant>> getSelectedApplicants({
    required int trainingId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));
    _applicants.putIfAbsent(
      trainingId,
      () => List.generate(
        Random().nextInt(10) + 5,
        (index) => TrainingApplicant(
          trainingApplicantId: (trainingId * 1000) + index,
          trainingId: trainingId,
          employeeId: 'EMP-00$index',
          employeeFullName: 'Selected Officer ${index + 1}',
          employeePhotoPath: 'https://i.pravatar.cc/150?u=emp$index',
          appliedDate: DateTime.now().subtract(const Duration(days: 10)),
          status: ApplicantStatus.selected,
        ),
      ),
    );
    return _applicants[trainingId]!;
  }

  @override
  Future<void> submitAppeal({
    required int applicationId,
    required String appealReason,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    final trainingId = (applicationId / 100).floor();
    final application = _myApplications[trainingId];
    if (application != null) {
      _myApplications[trainingId] = application.copyWith(
        status: ApplicantStatus.appealed,
        appealReason: appealReason,
        appealDate: DateTime.now(),
      );
    }
  }
}
