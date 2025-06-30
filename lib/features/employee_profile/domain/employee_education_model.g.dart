// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeEducationModel _$EmployeeEducationModelFromJson(
  Map<String, dynamic> json,
) => _EmployeeEducationModel(
  educationId: json['educationId'] as String?,
  employeeId: json['employeeId'] as String,
  educationLevel: $enumDecode(_$EducationLevelEnumMap, json['educationLevel']),
  university: $enumDecode(_$EthiopianUniversityEnumMap, json['university']),
  cgpa: json['cgpa'] as String?,
  fieldOfStudy: $enumDecode(_$FieldOfStudyEnumMap, json['fieldOfStudy']),
  startDate: DateTime.parse(json['startDate'] as String),
  endDate:
      json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
  educationStatus: $enumDecode(
    _$EducationStatusEnumMap,
    json['educationStatus'],
  ),
  entryBy: json['entryBy'] as String?,
  entryDate:
      json['entryDate'] == null
          ? null
          : DateTime.parse(json['entryDate'] as String),
  isApproved: json['isApproved'] as bool? ?? false,
);

Map<String, dynamic> _$EmployeeEducationModelToJson(
  _EmployeeEducationModel instance,
) => <String, dynamic>{
  'educationId': instance.educationId,
  'employeeId': instance.employeeId,
  'educationLevel': _$EducationLevelEnumMap[instance.educationLevel]!,
  'university': _$EthiopianUniversityEnumMap[instance.university]!,
  'cgpa': instance.cgpa,
  'fieldOfStudy': _$FieldOfStudyEnumMap[instance.fieldOfStudy]!,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'educationStatus': _$EducationStatusEnumMap[instance.educationStatus]!,
  'entryBy': instance.entryBy,
  'entryDate': instance.entryDate?.toIso8601String(),
  'isApproved': instance.isApproved,
};

const _$EducationLevelEnumMap = {
  EducationLevel.elementarySchool: 0,
  EducationLevel.secondarySchoolFirstCycle: 1,
  EducationLevel.secondarySchoolSecondCycle: 2,
  EducationLevel.tvet: 3,
  EducationLevel.certificate: 4,
  EducationLevel.diploma: 5,
  EducationLevel.advancedDiploma: 6,
  EducationLevel.bachelorsDegree: 7,
  EducationLevel.bachelorsDegreeFiveYear: 8,
  EducationLevel.llbDegree: 9,
  EducationLevel.mdDegree: 10,
  EducationLevel.pharmDDegree: 11,
  EducationLevel.postgraduateDiploma: 12,
  EducationLevel.mastersDegree: 13,
  EducationLevel.mba: 14,
  EducationLevel.llm: 15,
  EducationLevel.specialtyCertificate: 16,
  EducationLevel.doctorOfMedicineSpecialty: 17,
  EducationLevel.phD: 18,
  EducationLevel.associateDegree: 19,
  EducationLevel.highSchoolDiploma: 20,
  EducationLevel.ged: 21,
  EducationLevel.other: 22,
};

const _$EthiopianUniversityEnumMap = {
  EthiopianUniversity.addisAbabaUniversity: 'addisAbabaUniversity',
  EthiopianUniversity.addisAbabaScienceAndTechnologyUniversity:
      'addisAbabaScienceAndTechnologyUniversity',
  EthiopianUniversity.adamaScienceAndTechnologyUniversity:
      'adamaScienceAndTechnologyUniversity',
  EthiopianUniversity.bahirDarUniversity: 'bahirDarUniversity',
  EthiopianUniversity.mekelleUniversity: 'mekelleUniversity',
  EthiopianUniversity.hawassaUniversity: 'hawassaUniversity',
  EthiopianUniversity.arbaMinchUniversity: 'arbaMinchUniversity',
  EthiopianUniversity.jimmaUniversity: 'jimmaUniversity',
  EthiopianUniversity.haramayaUniversity: 'haramayaUniversity',
  EthiopianUniversity.wollegaUniversity: 'wollegaUniversity',
  EthiopianUniversity.debreMarkosUniversity: 'debreMarkosUniversity',
  EthiopianUniversity.dillaUniversity: 'dillaUniversity',
  EthiopianUniversity.woldiaUniversity: 'woldiaUniversity',
  EthiopianUniversity.maddaWalabuUniversity: 'maddaWalabuUniversity',
  EthiopianUniversity.wolaitaSodoUniversity: 'wolaitaSodoUniversity',
  EthiopianUniversity.debreBirhanUniversity: 'debreBirhanUniversity',
  EthiopianUniversity.gondarUniversity: 'gondarUniversity',
  EthiopianUniversity.direDawaUniversity: 'direDawaUniversity',
  EthiopianUniversity.semeraUniversity: 'semeraUniversity',
  EthiopianUniversity.assosaUniversity: 'assosaUniversity',
  EthiopianUniversity.buleHoraUniversity: 'buleHoraUniversity',
  EthiopianUniversity.mizanTepiUniversity: 'mizanTepiUniversity',
  EthiopianUniversity.jigjigaUniversity: 'jigjigaUniversity',
  EthiopianUniversity.amboUniversity: 'amboUniversity',
  EthiopianUniversity.debreTaborUniversity: 'debreTaborUniversity',
  EthiopianUniversity.wachemoUniversity: 'wachemoUniversity',
  EthiopianUniversity.bongaUniversity: 'bongaUniversity',
  EthiopianUniversity.metuUniversity: 'metuUniversity',
  EthiopianUniversity.stMarysUniversity: 'stMarysUniversity',
  EthiopianUniversity.unityUniversity: 'unityUniversity',
  EthiopianUniversity.admasUniversity: 'admasUniversity',
  EthiopianUniversity.riftValleyUniversity: 'riftValleyUniversity',
  EthiopianUniversity.ethiopianCivilServiceUniversity:
      'ethiopianCivilServiceUniversity',
  EthiopianUniversity.alphaUniversity: 'alphaUniversity',
  EthiopianUniversity.newGenerationUniversity: 'newGenerationUniversity',
  EthiopianUniversity.keaMedUniversity: 'keaMedUniversity',
  EthiopianUniversity.hiLCoE: 'hiLCoE',
  EthiopianUniversity.americanCollegeOfTechnology:
      'americanCollegeOfTechnology',
  EthiopianUniversity.harmayaUniversityPrivate: 'harmayaUniversityPrivate',
  EthiopianUniversity.jirenUniversity: 'jirenUniversity',
  EthiopianUniversity.bethelUniversity: 'bethelUniversity',
  EthiopianUniversity.axumUniversity: 'axumUniversity',
  EthiopianUniversity.greenLandCollege: 'greenLandCollege',
  EthiopianUniversity.eiABC: 'eiABC',
  EthiopianUniversity.kotebeUniversityOfEducation:
      'kotebeUniversityOfEducation',
  EthiopianUniversity.defenseUniversity: 'defenseUniversity',
  EthiopianUniversity.ethiopianPoliceUniversity: 'ethiopianPoliceUniversity',
  EthiopianUniversity.ethiopianAviationUniversity:
      'ethiopianAviationUniversity',
  EthiopianUniversity.ethiopianManagementInstitute:
      'ethiopianManagementInstitute',
  EthiopianUniversity.ethiopianFilmAcademy: 'ethiopianFilmAcademy',
  EthiopianUniversity.other: 'other',
};

const _$FieldOfStudyEnumMap = {
  FieldOfStudy.accounting: 'accounting',
  FieldOfStudy.aeronauticalEngineering: 'aeronauticalEngineering',
  FieldOfStudy.agriculture: 'agriculture',
  FieldOfStudy.architecture: 'architecture',
  FieldOfStudy.biochemistry: 'biochemistry',
  FieldOfStudy.biology: 'biology',
  FieldOfStudy.businessAdministration: 'businessAdministration',
  FieldOfStudy.chemicalEngineering: 'chemicalEngineering',
  FieldOfStudy.chemistry: 'chemistry',
  FieldOfStudy.civilEngineering: 'civilEngineering',
  FieldOfStudy.computerEngineering: 'computerEngineering',
  FieldOfStudy.computerScience: 'computerScience',
  FieldOfStudy.culinaryArts: 'culinaryArts',
  FieldOfStudy.dataScience: 'dataScience',
  FieldOfStudy.economics: 'economics',
  FieldOfStudy.electricalEngineering: 'electricalEngineering',
  FieldOfStudy.englishLiterature: 'englishLiterature',
  FieldOfStudy.environmentalScience: 'environmentalScience',
  FieldOfStudy.finance: 'finance',
  FieldOfStudy.fineArts: 'fineArts',
  FieldOfStudy.graphicDesign: 'graphicDesign',
  FieldOfStudy.history: 'history',
  FieldOfStudy.humanResources: 'humanResources',
  FieldOfStudy.informationTechnology: 'informationTechnology',
  FieldOfStudy.internationalRelations: 'internationalRelations',
  FieldOfStudy.journalism: 'journalism',
  FieldOfStudy.law: 'law',
  FieldOfStudy.marketing: 'marketing',
  FieldOfStudy.mathematics: 'mathematics',
  FieldOfStudy.mechanicalEngineering: 'mechanicalEngineering',
  FieldOfStudy.medicine: 'medicine',
  FieldOfStudy.nursing: 'nursing',
  FieldOfStudy.pharmacy: 'pharmacy',
  FieldOfStudy.philosophy: 'philosophy',
  FieldOfStudy.physics: 'physics',
  FieldOfStudy.politicalScience: 'politicalScience',
  FieldOfStudy.psychology: 'psychology',
  FieldOfStudy.publicHealth: 'publicHealth',
  FieldOfStudy.sociology: 'sociology',
  FieldOfStudy.softwareEngineering: 'softwareEngineering',
  FieldOfStudy.statistics: 'statistics',
  FieldOfStudy.telecommunications: 'telecommunications',
  FieldOfStudy.theaterArts: 'theaterArts',
  FieldOfStudy.urbanPlanning: 'urbanPlanning',
  FieldOfStudy.veterinaryMedicine: 'veterinaryMedicine',
  FieldOfStudy.other: 'other',
};

const _$EducationStatusEnumMap = {
  EducationStatus.inProgress: 0,
  EducationStatus.completed: 1,
  EducationStatus.onHold: 2,
  EducationStatus.fraud: 3,
};
