// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_dependant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeDependantModel _$EmployeeDependantModelFromJson(
  Map<String, dynamic> json,
) => _EmployeeDependantModel(
  dependantId: json['dependantId'] as String?,
  employeeId: json['employeeId'] as String,
  dependantFullName: json['dependantFullName'] as String,
  relation: $enumDecode(_$RelationTypesEnumMap, json['relation']),
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  birthDate: DateTime.parse(json['birthDate'] as String),
  occupation: json['occupation'] as String?,
  region: $enumDecode(_$EthiopianRegionEnumMap, json['region']),
  zone: json['zone'] as String?,
  woreda: json['woreda'] as String?,
  kebele: json['kebele'] as String?,
  houseNumber: json['houseNumber'] as String?,
  phoneNumber: json['phoneNumber'] as String,
  alternatePhoneNumber: json['alternatePhoneNumber'] as String?,
  email: json['email'] as String?,
  enabled: json['enabled'] as bool? ?? true,
  entryBy: json['entryBy'] as String?,
  entryDate:
      json['entryDate'] == null
          ? null
          : DateTime.parse(json['entryDate'] as String),
);

Map<String, dynamic> _$EmployeeDependantModelToJson(
  _EmployeeDependantModel instance,
) => <String, dynamic>{
  'dependantId': instance.dependantId,
  'employeeId': instance.employeeId,
  'dependantFullName': instance.dependantFullName,
  'relation': _$RelationTypesEnumMap[instance.relation]!,
  'gender': _$GenderEnumMap[instance.gender]!,
  'birthDate': instance.birthDate.toIso8601String(),
  'occupation': instance.occupation,
  'region': _$EthiopianRegionEnumMap[instance.region]!,
  'zone': instance.zone,
  'woreda': instance.woreda,
  'kebele': instance.kebele,
  'houseNumber': instance.houseNumber,
  'phoneNumber': instance.phoneNumber,
  'alternatePhoneNumber': instance.alternatePhoneNumber,
  'email': instance.email,
  'enabled': instance.enabled,
  'entryBy': instance.entryBy,
  'entryDate': instance.entryDate?.toIso8601String(),
};

const _$RelationTypesEnumMap = {
  RelationTypes.spouse: 'spouse',
  RelationTypes.child: 'child',
  RelationTypes.parent: 'parent',
  RelationTypes.sibling: 'sibling',
  RelationTypes.guardian: 'guardian',
  RelationTypes.emergencyContact: 'emergencyContact',
  RelationTypes.other: 'other',
};

const _$GenderEnumMap = {Gender.male: 0, Gender.female: 1, Gender.other: 2};

const _$EthiopianRegionEnumMap = {
  EthiopianRegion.addisAbaba: 'addisAbaba',
  EthiopianRegion.afar: 'afar',
  EthiopianRegion.amhara: 'amhara',
  EthiopianRegion.benishangulGumuz: 'benishangulGumuz',
  EthiopianRegion.direDawa: 'direDawa',
  EthiopianRegion.gambela: 'gambela',
  EthiopianRegion.harari: 'harari',
  EthiopianRegion.oromia: 'oromia',
  EthiopianRegion.sidama: 'sidama',
  EthiopianRegion.somali: 'somali',
  EthiopianRegion.southWestEthiopia: 'southWestEthiopia',
  EthiopianRegion.southern: 'southern',
  EthiopianRegion.tigray: 'tigray',
};
