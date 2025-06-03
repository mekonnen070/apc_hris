import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/education_level.dart';
import 'package:police_com/core/enums/education_status.dart';
import 'package:police_com/core/enums/ethiopian_university.dart';
import 'package:police_com/core/enums/field_of_study.dart';

part 'employee_education_model.freezed.dart';
part 'employee_education_model.g.dart';

@freezed
abstract class EmployeeEducationModel with _$EmployeeEducationModel {
  const factory EmployeeEducationModel({
    String? educationId,
    required String employeeId,
    // C# has 'string? Education'. Using EducationLevel enum for type safety in Dart.
    // If backend JSON strictly uses string for 'Education', a JsonConverter will be needed.
    required EducationLevel educationLevel,
    required EthiopianUniversity university,
    String? cgpa,
    required FieldOfStudy fieldOfStudy,
    required DateTime startDate,
    DateTime? endDate,
    required EducationStatus educationStatus,
    String? entryBy, // C# is 'string? EntryBy' but marked [Required]
    DateTime? entryDate, // C# is 'DateTime EntryDate', made nullable
    @Default(false) bool isApproved,
  }) = _EmployeeEducationModel;

  factory EmployeeEducationModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeEducationModelFromJson(json);
}
