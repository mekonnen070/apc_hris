import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/relation_types.dart';

part 'employee_contact_model.freezed.dart';
part 'employee_contact_model.g.dart';

@freezed
abstract class EmployeeContactModel with _$EmployeeContactModel {
  const factory EmployeeContactModel({
    String? contactId,
    required String employeeId,
    required String fullName,
    required RelationTypes relationship,
    String? address,
    required String phone,
    String? mobile,
    String? email,
    @Default(false) bool isPrimary,
    @Default(true) bool isActive,
    String? createdBy,
    DateTime?
    createdDate, // Changed to nullable to align with typical backend generation
    String? modifiedBy,
    DateTime? modifiedDate,
  }) = _EmployeeContactModel;

  factory EmployeeContactModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeContactModelFromJson(json);
}
