// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_spouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeSpouseModel _$EmployeeSpouseModelFromJson(Map<String, dynamic> json) =>
    _EmployeeSpouseModel(
      spouseId: json['spouseId'] as String?,
      employeeId: json['employeeId'] as String,
      title: json['title'] as String,
      spouseFullName: json['spouseFullName'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      spouseBirthDate: DateTime.parse(json['spouseBirthDate'] as String),
      spousePhone: json['spousePhone'] as String?,
      spouseOccupation: json['spouseOccupation'] as String?,
      motherName: json['motherName'] as String?,
      address: json['address'] as String,
      anniversaryDate:
          json['anniversaryDate'] == null
              ? null
              : DateTime.parse(json['anniversaryDate'] as String),
      retirementNumber: json['retirementNumber'] as String?,
      tin: json['tin'] as String?,
    );

Map<String, dynamic> _$EmployeeSpouseModelToJson(
  _EmployeeSpouseModel instance,
) => <String, dynamic>{
  'spouseId': instance.spouseId,
  'employeeId': instance.employeeId,
  'title': instance.title,
  'spouseFullName': instance.spouseFullName,
  'gender': _$GenderEnumMap[instance.gender]!,
  'spouseBirthDate': instance.spouseBirthDate.toIso8601String(),
  'spousePhone': instance.spousePhone,
  'spouseOccupation': instance.spouseOccupation,
  'motherName': instance.motherName,
  'address': instance.address,
  'anniversaryDate': instance.anniversaryDate?.toIso8601String(),
  'retirementNumber': instance.retirementNumber,
  'tin': instance.tin,
};

const _$GenderEnumMap = {Gender.male: 0, Gender.female: 1, Gender.other: 2};
