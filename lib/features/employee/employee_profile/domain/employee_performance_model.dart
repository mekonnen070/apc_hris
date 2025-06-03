import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_performance_model.freezed.dart';
part 'employee_performance_model.g.dart';

@freezed
abstract class EmployeePerformanceModel with _$EmployeePerformanceModel {
  const factory EmployeePerformanceModel({
    @Default(0) int performanceId, // C# Key, assuming int. Default 0 if new.
    required String employeeId,
    required int scorePoint,
    @Default(1) int rating, // C# has default calculation, providing a base default
    String? comments,
    required DateTime evaluationDate, // C# has default DateTime.Today
    required String evaluatorName,
    String? keyAchievements,
    String? areasForImprovement,
    DateTime? fromDate,
    DateTime? toDate,
    DateTime? nextEvaluationDate,
    String? updateBy, // Audit
    DateTime? updateDate, // C# not nullable, made nullable
  }) = _EmployeePerformanceModel;

  factory EmployeePerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeePerformanceModelFromJson(json);
}