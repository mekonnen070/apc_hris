import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/ethiopian_region.dart';
import 'package:police_com/core/enums/gender.dart';
import 'package:police_com/core/enums/relation_types.dart';

part 'employee_dependant_model.freezed.dart';
part 'employee_dependant_model.g.dart';

@freezed
abstract class EmployeeDependantModel with _$EmployeeDependantModel {
  const factory EmployeeDependantModel({
    String? dependantId,
    required String employeeId, // Changed to required based on likely admin usage
    required String dependantFullName,
    required RelationTypes relation,
    required Gender gender,
    required DateTime birthDate,
    String? occupation,
    required EthiopianRegion region,
    String? zone,
    String? woreda,
    String? kebele,
    String? houseNumber,
    required String phoneNumber,
    String? alternatePhoneNumber,
    String? email,
    @Default(true) bool enabled,
    String? entryBy,
    DateTime? entryDate, // Changed to nullable
  }) = _EmployeeDependantModel;

  factory EmployeeDependantModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDependantModelFromJson(json);
}