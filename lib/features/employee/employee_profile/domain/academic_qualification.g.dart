// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic_qualification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AcademicQualification _$AcademicQualificationFromJson(
  Map<String, dynamic> json,
) => _AcademicQualification(
  id: json['id'] as String,
  institutionName: json['institutionName'] as String,
  degreeOrCertificate: json['degreeOrCertificate'] as String,
  fieldOfStudy: json['fieldOfStudy'] as String,
  graduationDate:
      json['graduationDate'] == null
          ? null
          : DateTime.parse(json['graduationDate'] as String),
  certificateFile: const FileConverter().fromJson(
    json['certificateFile'] as String?,
  ),
  certificateUrl: json['certificateUrl'] as String?,
);

Map<String, dynamic> _$AcademicQualificationToJson(
  _AcademicQualification instance,
) => <String, dynamic>{
  'id': instance.id,
  'institutionName': instance.institutionName,
  'degreeOrCertificate': instance.degreeOrCertificate,
  'fieldOfStudy': instance.fieldOfStudy,
  'graduationDate': instance.graduationDate?.toIso8601String(),
  'certificateFile': const FileConverter().toJson(instance.certificateFile),
  'certificateUrl': instance.certificateUrl,
};
