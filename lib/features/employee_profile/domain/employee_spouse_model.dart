import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/gender.dart';
// C# EmployeeSpouse does not directly use MaritalStatus enum for spouse,
// but it's implied the Employee's MaritalStatus would be 'Married'.

part 'employee_spouse_model.freezed.dart';
part 'employee_spouse_model.g.dart';

@freezed
abstract class EmployeeSpouseModel with _$EmployeeSpouseModel {
  const factory EmployeeSpouseModel({
    String? spouseId, // C# is not nullable but has Guid.NewGuid().ToString() in comment
    required String employeeId,
    required String title, // Title of spouse (e.g., Mr., Mrs.)
    required String spouseFullName,
    required Gender gender, // Added based on C# properties
    required DateTime spouseBirthDate,
    String? spousePhone, // C# is not nullable, made nullable as it might be optional
    String? spouseOccupation, // C# is not nullable, made nullable
    String? motherName, // C# is not nullable, made nullable
    required String address,
    DateTime? anniversaryDate, // C# is not nullable, made nullable
    String? retirementNumber, // C# is not nullable, made nullable
    String? tin, // C# is not nullable, made nullable
  }) = _EmployeeSpouseModel;

  factory EmployeeSpouseModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeSpouseModelFromJson(json);
}