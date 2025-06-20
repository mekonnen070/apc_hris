import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';

part 'training.freezed.dart';
part 'training.g.dart';

@freezed
abstract class Training with _$Training {
  const factory Training({
    required int trainingId,
    required String trainingName,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required int duration,
    required String organizedBy,
    required String trainingCenter,
    required String? certificate,
    // This field will tell the UI if the current user has already applied.
    // It's not part of the C# model but is a helpful UI-specific property.
    ApplicantStatus? currentUserApplicationStatus,
  }) = _Training;

  factory Training.fromJson(Map<String, dynamic> json) =>
      _$TrainingFromJson(json);
}
