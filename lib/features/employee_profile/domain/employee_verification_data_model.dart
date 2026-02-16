import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_verification_data_model.freezed.dart';
part 'employee_verification_data_model.g.dart';

@freezed
abstract class EmployeeVerificationDataModel
    with _$EmployeeVerificationDataModel {
  factory EmployeeVerificationDataModel({
    required String employeeId,
    required String staffId,
    required String firstName,
    required String fatherName,
    required String grandName,
    required String fullName,
    required String gender,
    required String birthDate,
    String? photoUrl,
    String? signature,
    String? motherName,
    String? address,
    String? appearance,
    String? height,
    String? mobile,
    String? email,
    String? bloodGroup,
    String? nationality,
    String? religion,
    String? medicalStatus,
    String? retirementNumber,
    String? maritalStatus,
    bool? isManager,
    @JsonKey(includeToJson: false) String? bankAccount,
    bool? isRepresented,
    @JsonKey(includeToJson: false) String? repBankAccount,
    String? entryBy,
    String? entryDate,
    String? employmentStatus,
    String? recuritmentType,
    String? employmentType,
    String? hiredDate,
    String? retirementEligibilityDate,
    String? positionJoinedDate,
    String? employmentTerminationDate,
    String? levelHoldingDate,
    String? scaleHoldingDate,
    bool? isCardIssued,
    String? positionId,
    String? positionName,
    String? departmentId,
    String? departmentName,
    String? organizationId,
    String? organizationName,
    String? currentLevelId,
    String? levelName,
    String? rankScaleId,
    String? scaleName,
    String? managerId,
    String? managerName,
  }) = _EmployeeVerificationDataModel;

  factory EmployeeVerificationDataModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeVerificationDataModelFromJson(json);
}
