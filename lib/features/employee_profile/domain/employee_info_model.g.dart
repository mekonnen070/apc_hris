// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeInfoModel _$EmployeeInfoModelFromJson(
  Map<String, dynamic> json,
) => _EmployeeInfoModel(
  employeeId: json['employeeId'] as String,
  title: $enumDecodeNullable(_$StaffTitleEnumMap, json['title']),
  firstName: json['firstName'] as String,
  fatherName: json['fatherName'] as String?,
  grandName: json['grandName'] as String?,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  birthDate: DateTime.parse(json['birthDate'] as String),
  photoUrl: json['photoUrl'] as String?,
  motherName: json['motherName'] as String?,
  positionId: json['positionId'] as String,
  managerId: json['managerId'] as String?,
  address1: json['address1'] as String?,
  address2: json['address2'] as String?,
  houseNumber: json['houseNumber'] as String?,
  phone: json['phone'] as String?,
  mobile: json['mobile'] as String,
  email: json['email'] as String,
  nationality:
      $enumDecodeNullable(_$CountryEnumMap, json['nationality']) ??
      Country.ethiopia,
  bloodGroup:
      $enumDecodeNullable(_$BloodGroupEnumMap, json['bloodGroup']) ??
      BloodGroup.unknown,
  religion:
      $enumDecodeNullable(_$ReligionEnumMap, json['religion']) ??
      Religion.other,
  medicalStatus:
      $enumDecodeNullable(_$MedicalStatusEnumMap, json['medicalStatus']) ??
      MedicalStatus.pending,
  retirementNumber: json['retirementNumber'] as String?,
  tin: json['tin'] as String?,
  maritalStatus:
      $enumDecodeNullable(_$MaritalStatusEnumMap, json['maritalStatus']) ??
      MaritalStatus.single,
  employmentStatus:
      $enumDecodeNullable(
        _$EmploymentStatusEnumMap,
        json['employmentStatus'],
      ) ??
      EmploymentStatus.active,
  isManager: json['isManager'] as bool? ?? false,
  employeeType:
      $enumDecodeNullable(_$EmployeeTypeEnumMap, json['employeeType']) ??
      EmployeeType.military,
  hiredDate: DateTime.parse(json['hiredDate'] as String),
  retirementEligibilityDate:
      json['retirementEligibilityDate'] == null
          ? null
          : DateTime.parse(json['retirementEligibilityDate'] as String),
  entryBy: json['entryBy'] as String?,
  entryDate:
      json['entryDate'] == null
          ? null
          : DateTime.parse(json['entryDate'] as String),
  employeeContacts:
      (json['employeeContacts'] as List<dynamic>?)
          ?.map((e) => EmployeeContactModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  employeeDependants:
      (json['employeeDependants'] as List<dynamic>?)
          ?.map(
            (e) => EmployeeDependantModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  employeeEducations:
      (json['employeeEducations'] as List<dynamic>?)
          ?.map(
            (e) => EmployeeEducationModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  employeeExperiences:
      (json['employeeExperiences'] as List<dynamic>?)
          ?.map(
            (e) => EmployeeExperienceModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  performances:
      (json['performances'] as List<dynamic>?)
          ?.map(
            (e) => EmployeePerformanceModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  employeeSpouse:
      (json['employeeSpouse'] as List<dynamic>?)
          ?.map((e) => EmployeeSpouseModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  generalDocuments:
      (json['generalDocuments'] as List<dynamic>?)
          ?.map((e) => EmployeeUploadModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$EmployeeInfoModelToJson(_EmployeeInfoModel instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'title': _$StaffTitleEnumMap[instance.title],
      'firstName': instance.firstName,
      'fatherName': instance.fatherName,
      'grandName': instance.grandName,
      'gender': _$GenderEnumMap[instance.gender]!,
      'birthDate': instance.birthDate.toIso8601String(),
      'photoUrl': instance.photoUrl,
      'motherName': instance.motherName,
      'positionId': instance.positionId,
      'managerId': instance.managerId,
      'address1': instance.address1,
      'address2': instance.address2,
      'houseNumber': instance.houseNumber,
      'phone': instance.phone,
      'mobile': instance.mobile,
      'email': instance.email,
      'nationality': _$CountryEnumMap[instance.nationality]!,
      'bloodGroup': _$BloodGroupEnumMap[instance.bloodGroup]!,
      'religion': _$ReligionEnumMap[instance.religion]!,
      'medicalStatus': _$MedicalStatusEnumMap[instance.medicalStatus]!,
      'retirementNumber': instance.retirementNumber,
      'tin': instance.tin,
      'maritalStatus': _$MaritalStatusEnumMap[instance.maritalStatus]!,
      'employmentStatus': _$EmploymentStatusEnumMap[instance.employmentStatus]!,
      'isManager': instance.isManager,
      'employeeType': _$EmployeeTypeEnumMap[instance.employeeType]!,
      'hiredDate': instance.hiredDate.toIso8601String(),
      'retirementEligibilityDate':
          instance.retirementEligibilityDate?.toIso8601String(),
      'entryBy': instance.entryBy,
      'entryDate': instance.entryDate?.toIso8601String(),
      'employeeContacts': instance.employeeContacts,
      'employeeDependants': instance.employeeDependants,
      'employeeEducations': instance.employeeEducations,
      'employeeExperiences': instance.employeeExperiences,
      'performances': instance.performances,
      'employeeSpouse': instance.employeeSpouse,
      'generalDocuments': instance.generalDocuments,
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

const _$CountryEnumMap = {
  Country.afghanistan: 0,
  Country.alandIslands: 1,
  Country.albania: 2,
  Country.algeria: 3,
  Country.andorra: 4,
  Country.angola: 5,
  Country.antiguaAndBarbuda: 6,
  Country.argentina: 7,
  Country.armenia: 8,
  Country.australia: 9,
  Country.austria: 10,
  Country.azerbaijan: 11,
  Country.bahamas: 12,
  Country.bahrain: 13,
  Country.bangladesh: 14,
  Country.barbados: 15,
  Country.belarus: 16,
  Country.belgium: 17,
  Country.belize: 18,
  Country.benin: 19,
  Country.bhutan: 20,
  Country.bolivia: 21,
  Country.bosniaAndHerzegovina: 22,
  Country.botswana: 23,
  Country.brazil: 24,
  Country.brunei: 25,
  Country.bulgaria: 26,
  Country.burkinaFaso: 27,
  Country.burundi: 28,
  Country.caboVerde: 29,
  Country.cambodia: 30,
  Country.cameroon: 31,
  Country.canada: 32,
  Country.centralAfricanRepublic: 33,
  Country.chad: 34,
  Country.chile: 35,
  Country.china: 36,
  Country.colombia: 37,
  Country.comoros: 38,
  Country.congo: 39,
  Country.costaRica: 40,
  Country.croatia: 41,
  Country.cuba: 42,
  Country.cyprus: 43,
  Country.czechia: 44,
  Country.democraticRepublicOfTheCongo: 45,
  Country.denmark: 46,
  Country.djibouti: 47,
  Country.dominica: 48,
  Country.dominicanRepublic: 49,
  Country.ecuador: 50,
  Country.egypt: 51,
  Country.elSalvador: 52,
  Country.equatorialGuinea: 53,
  Country.eritrea: 54,
  Country.estonia: 55,
  Country.eswatini: 56,
  Country.ethiopia: 57,
  Country.fiji: 58,
  Country.finland: 59,
  Country.france: 60,
  Country.gabon: 61,
  Country.gambia: 62,
  Country.georgia: 63,
  Country.germany: 64,
  Country.ghana: 65,
  Country.greece: 66,
  Country.grenada: 67,
  Country.guatemala: 68,
  Country.guinea: 69,
  Country.guineaBissau: 70,
  Country.guyana: 71,
  Country.haiti: 72,
  Country.honduras: 73,
  Country.hungary: 74,
  Country.iceland: 75,
  Country.india: 76,
  Country.indonesia: 77,
  Country.iran: 78,
  Country.iraq: 79,
  Country.ireland: 80,
  Country.israel: 81,
  Country.italy: 82,
  Country.jamaica: 83,
  Country.japan: 84,
  Country.jordan: 85,
  Country.kazakhstan: 86,
  Country.kenya: 87,
  Country.kiribati: 88,
  Country.kuwait: 89,
  Country.kyrgyzstan: 90,
  Country.laos: 91,
  Country.latvia: 92,
  Country.lebanon: 93,
  Country.lesotho: 94,
  Country.liberia: 95,
  Country.libya: 96,
  Country.liechtenstein: 97,
  Country.lithuania: 98,
  Country.luxembourg: 99,
  Country.madagascar: 100,
  Country.malawi: 101,
  Country.malaysia: 102,
  Country.maldives: 103,
  Country.mali: 104,
  Country.malta: 105,
  Country.marshallIslands: 106,
  Country.mauritania: 107,
  Country.mauritius: 108,
  Country.mexico: 109,
  Country.micronesia: 110,
  Country.moldova: 111,
  Country.monaco: 112,
  Country.mongolia: 113,
  Country.montenegro: 114,
  Country.morocco: 115,
  Country.mozambique: 116,
  Country.myanmar: 117,
  Country.namibia: 118,
  Country.nauru: 119,
  Country.nepal: 120,
  Country.netherlands: 121,
  Country.newZealand: 122,
  Country.nicaragua: 123,
  Country.niger: 124,
  Country.nigeria: 125,
  Country.northKorea: 126,
  Country.northMacedonia: 127,
  Country.norway: 128,
  Country.oman: 129,
  Country.pakistan: 130,
  Country.palau: 131,
  Country.palestine: 132,
  Country.panama: 133,
  Country.papuaNewGuinea: 134,
  Country.paraguay: 135,
  Country.peru: 136,
  Country.philippines: 137,
  Country.poland: 138,
  Country.portugal: 139,
  Country.qatar: 140,
  Country.romania: 141,
  Country.russia: 142,
  Country.rwanda: 143,
  Country.saintKittsAndNevis: 144,
  Country.saintLucia: 145,
  Country.saintVincentAndTheGrenadines: 146,
  Country.samoa: 147,
  Country.sanMarino: 148,
  Country.saoTomeAndPrincipe: 149,
  Country.saudiArabia: 150,
  Country.senegal: 151,
  Country.serbia: 152,
  Country.seychelles: 153,
  Country.sierraLeone: 154,
  Country.singapore: 155,
  Country.slovakia: 156,
  Country.slovenia: 157,
  Country.solomonIslands: 158,
  Country.somalia: 159,
  Country.southAfrica: 160,
  Country.southKorea: 161,
  Country.southSudan: 162,
  Country.spain: 163,
  Country.sriLanka: 164,
  Country.sudan: 165,
  Country.suriname: 166,
  Country.sweden: 167,
  Country.switzerland: 168,
  Country.syria: 169,
  Country.tajikistan: 170,
  Country.tanzania: 171,
  Country.thailand: 172,
  Country.timorLeste: 173,
  Country.togo: 174,
  Country.tonga: 175,
  Country.trinidadAndTobago: 176,
  Country.tunisia: 177,
  Country.turkey: 178,
  Country.turkmenistan: 179,
  Country.tuvalu: 180,
  Country.uganda: 181,
  Country.ukraine: 182,
  Country.unitedArabEmirates: 183,
  Country.unitedKingdom: 184,
  Country.unitedStates: 185,
  Country.uruguay: 186,
  Country.uzbekistan: 187,
  Country.vanuatu: 188,
  Country.vaticanCity: 189,
  Country.venezuela: 190,
  Country.vietnam: 191,
  Country.yemen: 192,
  Country.zambia: 193,
  Country.zimbabwe: 194,
};

const _$BloodGroupEnumMap = {
  BloodGroup.aPositive: 0,
  BloodGroup.aNegative: 1,
  BloodGroup.bPositive: 2,
  BloodGroup.bNegative: 3,
  BloodGroup.abPositive: 4,
  BloodGroup.abNegative: 5,
  BloodGroup.oPositive: 6,
  BloodGroup.oNegative: 7,
  BloodGroup.unknown: 8,
};

const _$ReligionEnumMap = {
  Religion.islam: 0,
  Religion.christianity: 1,
  Religion.hinduism: 2,
  Religion.buddhism: 3,
  Religion.judaism: 4,
  Religion.other: 5,
};

const _$MedicalStatusEnumMap = {
  MedicalStatus.fit: 0,
  MedicalStatus.unfit: 1,
  MedicalStatus.pending: 2,
  MedicalStatus.other: 3,
};

const _$MaritalStatusEnumMap = {
  MaritalStatus.single: 0,
  MaritalStatus.married: 1,
  MaritalStatus.divorced: 2,
  MaritalStatus.widowed: 3,
  MaritalStatus.separated: 4,
};

const _$EmploymentStatusEnumMap = {
  EmploymentStatus.active: 0,
  EmploymentStatus.eligible: 1,
  EmploymentStatus.noticeGiven: 2,
  EmploymentStatus.rejected: 3,
  EmploymentStatus.processing: 4,
  EmploymentStatus.retired: 5,
};

const _$EmployeeTypeEnumMap = {
  EmployeeType.military: 0,
  EmployeeType.civilian: 1,
};
