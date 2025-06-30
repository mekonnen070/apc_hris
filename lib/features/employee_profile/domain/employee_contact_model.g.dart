// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeContactModel _$EmployeeContactModelFromJson(
  Map<String, dynamic> json,
) => _EmployeeContactModel(
  contactId: json['contactId'] as String?,
  employeeId: json['employeeId'] as String,
  fullName: json['fullName'] as String,
  relationship: $enumDecode(_$RelationTypesEnumMap, json['relationship']),
  address: json['address'] as String?,
  phone: json['phone'] as String,
  mobile: json['mobile'] as String?,
  email: json['email'] as String?,
  isPrimary: json['isPrimary'] as bool? ?? false,
  isActive: json['isActive'] as bool? ?? true,
  createdBy: json['createdBy'] as String?,
  createdDate:
      json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
  modifiedBy: json['modifiedBy'] as String?,
  modifiedDate:
      json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
);

Map<String, dynamic> _$EmployeeContactModelToJson(
  _EmployeeContactModel instance,
) => <String, dynamic>{
  'contactId': instance.contactId,
  'employeeId': instance.employeeId,
  'fullName': instance.fullName,
  'relationship': _$RelationTypesEnumMap[instance.relationship]!,
  'address': instance.address,
  'phone': instance.phone,
  'mobile': instance.mobile,
  'email': instance.email,
  'isPrimary': instance.isPrimary,
  'isActive': instance.isActive,
  'createdBy': instance.createdBy,
  'createdDate': instance.createdDate?.toIso8601String(),
  'modifiedBy': instance.modifiedBy,
  'modifiedDate': instance.modifiedDate?.toIso8601String(),
};

const _$RelationTypesEnumMap = {
  RelationTypes.husband: 0,
  RelationTypes.wife: 1,
  RelationTypes.child: 2,
  RelationTypes.father: 3,
  RelationTypes.mother: 4,
  RelationTypes.brother: 5,
  RelationTypes.sister: 6,
  RelationTypes.guardian: 7,
  RelationTypes.other: 8,
};
