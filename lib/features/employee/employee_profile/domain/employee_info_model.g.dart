// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeInfoModel _$EmployeeInfoModelFromJson(
  Map<String, dynamic> json,
) => _EmployeeInfoModel(
  employeeId: json['employeeId'] as String,
  title: json['title'] as String?,
  firstName: json['firstName'] as String,
  fatherName: json['fatherName'] as String?,
  grandName: json['grandName'] as String?,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  birthDate: DateTime.parse(json['birthDate'] as String),
  photoUrl: json['photoUrl'] as String?,
  motherName: json['motherName'] as String?,
  positionId: json['positionId'] as String,
  managerId: json['managerId'] as String?,
  address1: json['address1'] as String,
  address2: json['address2'] as String?,
  houseNumber: json['houseNumber'] as String?,
  phone: json['phone'] as String,
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
      'title': instance.title,
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

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$CountryEnumMap = {
  Country.afghanistan: 'afghanistan',
  Country.alandIslands: 'alandIslands',
  Country.albania: 'albania',
  Country.algeria: 'algeria',
  Country.andorra: 'andorra',
  Country.angola: 'angola',
  Country.antiguaAndBarbuda: 'antiguaAndBarbuda',
  Country.argentina: 'argentina',
  Country.armenia: 'armenia',
  Country.australia: 'australia',
  Country.austria: 'austria',
  Country.azerbaijan: 'azerbaijan',
  Country.bahamas: 'bahamas',
  Country.bahrain: 'bahrain',
  Country.bangladesh: 'bangladesh',
  Country.barbados: 'barbados',
  Country.belarus: 'belarus',
  Country.belgium: 'belgium',
  Country.belize: 'belize',
  Country.benin: 'benin',
  Country.bhutan: 'bhutan',
  Country.bolivia: 'bolivia',
  Country.bosniaAndHerzegovina: 'bosniaAndHerzegovina',
  Country.botswana: 'botswana',
  Country.brazil: 'brazil',
  Country.brunei: 'brunei',
  Country.bulgaria: 'bulgaria',
  Country.burkinaFaso: 'burkinaFaso',
  Country.burundi: 'burundi',
  Country.caboVerde: 'caboVerde',
  Country.cambodia: 'cambodia',
  Country.cameroon: 'cameroon',
  Country.canada: 'canada',
  Country.centralAfricanRepublic: 'centralAfricanRepublic',
  Country.chad: 'chad',
  Country.chile: 'chile',
  Country.china: 'china',
  Country.colombia: 'colombia',
  Country.comoros: 'comoros',
  Country.congo: 'congo',
  Country.costaRica: 'costaRica',
  Country.croatia: 'croatia',
  Country.cuba: 'cuba',
  Country.cyprus: 'cyprus',
  Country.czechia: 'czechia',
  Country.democraticRepublicOfTheCongo: 'democraticRepublicOfTheCongo',
  Country.denmark: 'denmark',
  Country.djibouti: 'djibouti',
  Country.dominica: 'dominica',
  Country.dominicanRepublic: 'dominicanRepublic',
  Country.ecuador: 'ecuador',
  Country.egypt: 'egypt',
  Country.elSalvador: 'elSalvador',
  Country.equatorialGuinea: 'equatorialGuinea',
  Country.eritrea: 'eritrea',
  Country.estonia: 'estonia',
  Country.eswatini: 'eswatini',
  Country.ethiopia: 'ethiopia',
  Country.fiji: 'fiji',
  Country.finland: 'finland',
  Country.france: 'france',
  Country.gabon: 'gabon',
  Country.gambia: 'gambia',
  Country.georgia: 'georgia',
  Country.germany: 'germany',
  Country.ghana: 'ghana',
  Country.greece: 'greece',
  Country.grenada: 'grenada',
  Country.guatemala: 'guatemala',
  Country.guinea: 'guinea',
  Country.guineaBissau: 'guineaBissau',
  Country.guyana: 'guyana',
  Country.haiti: 'haiti',
  Country.honduras: 'honduras',
  Country.hungary: 'hungary',
  Country.iceland: 'iceland',
  Country.india: 'india',
  Country.indonesia: 'indonesia',
  Country.iran: 'iran',
  Country.iraq: 'iraq',
  Country.ireland: 'ireland',
  Country.israel: 'israel',
  Country.italy: 'italy',
  Country.jamaica: 'jamaica',
  Country.japan: 'japan',
  Country.jordan: 'jordan',
  Country.kazakhstan: 'kazakhstan',
  Country.kenya: 'kenya',
  Country.kiribati: 'kiribati',
  Country.kuwait: 'kuwait',
  Country.kyrgyzstan: 'kyrgyzstan',
  Country.laos: 'laos',
  Country.latvia: 'latvia',
  Country.lebanon: 'lebanon',
  Country.lesotho: 'lesotho',
  Country.liberia: 'liberia',
  Country.libya: 'libya',
  Country.liechtenstein: 'liechtenstein',
  Country.lithuania: 'lithuania',
  Country.luxembourg: 'luxembourg',
  Country.madagascar: 'madagascar',
  Country.malawi: 'malawi',
  Country.malaysia: 'malaysia',
  Country.maldives: 'maldives',
  Country.mali: 'mali',
  Country.malta: 'malta',
  Country.marshallIslands: 'marshallIslands',
  Country.mauritania: 'mauritania',
  Country.mauritius: 'mauritius',
  Country.mexico: 'mexico',
  Country.micronesia: 'micronesia',
  Country.moldova: 'moldova',
  Country.monaco: 'monaco',
  Country.mongolia: 'mongolia',
  Country.montenegro: 'montenegro',
  Country.morocco: 'morocco',
  Country.mozambique: 'mozambique',
  Country.myanmar: 'myanmar',
  Country.namibia: 'namibia',
  Country.nauru: 'nauru',
  Country.nepal: 'nepal',
  Country.netherlands: 'netherlands',
  Country.newZealand: 'newZealand',
  Country.nicaragua: 'nicaragua',
  Country.niger: 'niger',
  Country.nigeria: 'nigeria',
  Country.northKorea: 'northKorea',
  Country.northMacedonia: 'northMacedonia',
  Country.norway: 'norway',
  Country.oman: 'oman',
  Country.pakistan: 'pakistan',
  Country.palau: 'palau',
  Country.palestine: 'palestine',
  Country.panama: 'panama',
  Country.papuaNewGuinea: 'papuaNewGuinea',
  Country.paraguay: 'paraguay',
  Country.peru: 'peru',
  Country.philippines: 'philippines',
  Country.poland: 'poland',
  Country.portugal: 'portugal',
  Country.qatar: 'qatar',
  Country.romania: 'romania',
  Country.russia: 'russia',
  Country.rwanda: 'rwanda',
  Country.saintKittsAndNevis: 'saintKittsAndNevis',
  Country.saintLucia: 'saintLucia',
  Country.saintVincentAndTheGrenadines: 'saintVincentAndTheGrenadines',
  Country.samoa: 'samoa',
  Country.sanMarino: 'sanMarino',
  Country.saoTomeAndPrincipe: 'saoTomeAndPrincipe',
  Country.saudiArabia: 'saudiArabia',
  Country.senegal: 'senegal',
  Country.serbia: 'serbia',
  Country.seychelles: 'seychelles',
  Country.sierraLeone: 'sierraLeone',
  Country.singapore: 'singapore',
  Country.slovakia: 'slovakia',
  Country.slovenia: 'slovenia',
  Country.solomonIslands: 'solomonIslands',
  Country.somalia: 'somalia',
  Country.southAfrica: 'southAfrica',
  Country.southKorea: 'southKorea',
  Country.southSudan: 'southSudan',
  Country.spain: 'spain',
  Country.sriLanka: 'sriLanka',
  Country.sudan: 'sudan',
  Country.suriname: 'suriname',
  Country.sweden: 'sweden',
  Country.switzerland: 'switzerland',
  Country.syria: 'syria',
  Country.tajikistan: 'tajikistan',
  Country.tanzania: 'tanzania',
  Country.thailand: 'thailand',
  Country.timorLeste: 'timorLeste',
  Country.togo: 'togo',
  Country.tonga: 'tonga',
  Country.trinidadAndTobago: 'trinidadAndTobago',
  Country.tunisia: 'tunisia',
  Country.turkey: 'turkey',
  Country.turkmenistan: 'turkmenistan',
  Country.tuvalu: 'tuvalu',
  Country.uganda: 'uganda',
  Country.ukraine: 'ukraine',
  Country.unitedArabEmirates: 'unitedArabEmirates',
  Country.unitedKingdom: 'unitedKingdom',
  Country.unitedStates: 'unitedStates',
  Country.uruguay: 'uruguay',
  Country.uzbekistan: 'uzbekistan',
  Country.vanuatu: 'vanuatu',
  Country.vaticanCity: 'vaticanCity',
  Country.venezuela: 'venezuela',
  Country.vietnam: 'vietnam',
  Country.yemen: 'yemen',
  Country.zambia: 'zambia',
  Country.zimbabwe: 'zimbabwe',
};

const _$BloodGroupEnumMap = {
  BloodGroup.aPositive: 'aPositive',
  BloodGroup.aNegative: 'aNegative',
  BloodGroup.bPositive: 'bPositive',
  BloodGroup.bNegative: 'bNegative',
  BloodGroup.abPositive: 'abPositive',
  BloodGroup.abNegative: 'abNegative',
  BloodGroup.oPositive: 'oPositive',
  BloodGroup.oNegative: 'oNegative',
  BloodGroup.unknown: 'unknown',
};

const _$ReligionEnumMap = {
  Religion.christianity: 'christianity',
  Religion.islam: 'islam',
  Religion.hinduism: 'hinduism',
  Religion.buddhism: 'buddhism',
  Religion.judaism: 'judaism',
  Religion.traditional: 'traditional',
  Religion.atheist: 'atheist',
  Religion.other: 'other',
  Religion.unknown: 'unknown',
};

const _$MedicalStatusEnumMap = {
  MedicalStatus.fit: 'fit',
  MedicalStatus.unfit: 'unfit',
  MedicalStatus.pending: 'pending',
  MedicalStatus.other: 'other',
};

const _$MaritalStatusEnumMap = {
  MaritalStatus.single: 'single',
  MaritalStatus.married: 'married',
  MaritalStatus.divorced: 'divorced',
  MaritalStatus.widowed: 'widowed',
  MaritalStatus.separated: 'separated',
};

const _$EmploymentStatusEnumMap = {
  EmploymentStatus.active: 'active',
  EmploymentStatus.eligible: 'eligible',
  EmploymentStatus.noticeGiven: 'noticeGiven',
  EmploymentStatus.rejected: 'rejected',
  EmploymentStatus.processing: 'processing',
  EmploymentStatus.retired: 'retired',
};

const _$EmployeeTypeEnumMap = {
  EmployeeType.military: 'military',
  EmployeeType.civilian: 'civilian',
};
