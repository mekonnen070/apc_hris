// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_spouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeSpouseModel _$EmployeeSpouseModelFromJson(Map<String, dynamic> json) =>
    _EmployeeSpouseModel(
      spouseId: json['spouseId'] as String?,
      employeeId: json['employeeId'] as String,
      title: $enumDecodeNullable(_$StaffTitleEnumMap, json['title']),
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
  'title': _$StaffTitleEnumMap[instance.title],
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

const _$StaffTitleEnumMap = {
  StaffTitle.commissioner: 0,
  StaffTitle.deputyCommissioner: 1,
  StaffTitle.assistantCommissioner: 2,
  StaffTitle.commander: 3,
  StaffTitle.deputyCommander: 4,
  StaffTitle.chiefInspector: 5,
  StaffTitle.inspector: 6,
  StaffTitle.deputyInspector: 7,
  StaffTitle.assistantInspector: 8,
  StaffTitle.chiefSergeant: 9,
  StaffTitle.sergeant: 10,
  StaffTitle.deputySergeant: 11,
  StaffTitle.assistantSergeant: 12,
  StaffTitle.constable: 13,
  StaffTitle.ato: 14,
  StaffTitle.wro: 15,
};

const _$GenderEnumMap = {Gender.male: 0, Gender.female: 1, Gender.other: 2};
