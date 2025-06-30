// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeUploadModel _$EmployeeUploadModelFromJson(Map<String, dynamic> json) =>
    _EmployeeUploadModel(
      documentId: json['documentId'] as String?,
      employeeId: json['employeeId'] as String,
      documentName: json['documentName'] as String,
      documentType: $enumDecode(_$DocumentTypeEnumMap, json['documentType']),
      description: json['description'] as String?,
      filePath: json['filePath'] as String?,
      expiryDate:
          json['expiryDate'] == null
              ? null
              : DateTime.parse(json['expiryDate'] as String),
      isActive: json['isActive'] as bool? ?? true,
      uploadedBy: json['uploadedBy'] as String?,
      uploadDate:
          json['uploadDate'] == null
              ? null
              : DateTime.parse(json['uploadDate'] as String),
    );

Map<String, dynamic> _$EmployeeUploadModelToJson(
  _EmployeeUploadModel instance,
) => <String, dynamic>{
  'documentId': instance.documentId,
  'employeeId': instance.employeeId,
  'documentName': instance.documentName,
  'documentType': _$DocumentTypeEnumMap[instance.documentType]!,
  'description': instance.description,
  'filePath': instance.filePath,
  'expiryDate': instance.expiryDate?.toIso8601String(),
  'isActive': instance.isActive,
  'uploadedBy': instance.uploadedBy,
  'uploadDate': instance.uploadDate?.toIso8601String(),
};

const _$DocumentTypeEnumMap = {
  DocumentType.cv: 0,
  DocumentType.contract: 1,
  DocumentType.id: 2,
  DocumentType.passport: 3,
  DocumentType.drivingLicense: 4,
  DocumentType.academicCertificate: 5,
  DocumentType.trainingCertificate: 6,
  DocumentType.paySlip: 7,
  DocumentType.taxDocument: 8,
  DocumentType.medicalReport: 9,
  DocumentType.other: 10,
};
