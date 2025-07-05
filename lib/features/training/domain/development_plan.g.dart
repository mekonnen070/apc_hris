// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'development_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DevelopmentPlan _$DevelopmentPlanFromJson(Map<String, dynamic> json) =>
    _DevelopmentPlan(
      planId: json['planId'] as String?,
      planName: json['planName'] as String,
      planType: $enumDecode(_$TrainingTypesEnumMap, json['planType']),
      planDescription: json['planDescription'] as String,
      planCost: (json['planCost'] as num).toDouble(),
      usedCost: (json['usedCost'] as num).toDouble(),
      planCurrency: $enumDecode(_$CurrencyEnumMap, json['planCurrency']),
      developmentSource: $enumDecode(
        _$DevelopmentSourceEnumMap,
        json['developmentSource'],
      ),
      planStatus: $enumDecode(_$GeneralStatusEnumMap, json['planStatus']),
      planEntryBy: json['planEntryBy'] as String?,
      planEntryDate:
          json['planEntryDate'] == null
              ? null
              : DateTime.parse(json['planEntryDate'] as String),
    );

Map<String, dynamic> _$DevelopmentPlanToJson(
  _DevelopmentPlan instance,
) => <String, dynamic>{
  'planId': instance.planId,
  'planName': instance.planName,
  'planType': _$TrainingTypesEnumMap[instance.planType]!,
  'planDescription': instance.planDescription,
  'planCost': instance.planCost,
  'usedCost': instance.usedCost,
  'planCurrency': _$CurrencyEnumMap[instance.planCurrency]!,
  'developmentSource': _$DevelopmentSourceEnumMap[instance.developmentSource]!,
  'planStatus': _$GeneralStatusEnumMap[instance.planStatus]!,
  'planEntryBy': instance.planEntryBy,
  'planEntryDate': instance.planEntryDate?.toIso8601String(),
};

const _$TrainingTypesEnumMap = {
  TrainingTypes.shortTerm: 0,
  TrainingTypes.midTerm: 1,
  TrainingTypes.longTerm: 2,
  TrainingTypes.other: 3,
};

const _$CurrencyEnumMap = {
  Currency.etb: 0,
  Currency.usd: 1,
  Currency.eur: 2,
  Currency.gbp: 3,
};

const _$DevelopmentSourceEnumMap = {
  DevelopmentSource.external: 0,
  DevelopmentSource.internal: 1,
};

const _$GeneralStatusEnumMap = {
  GeneralStatus.pending: 0,
  GeneralStatus.submitted: 1,
  GeneralStatus.approved: 2,
  GeneralStatus.rejected: 3,
  GeneralStatus.completed: 4,
  GeneralStatus.canceled: 5,
};
