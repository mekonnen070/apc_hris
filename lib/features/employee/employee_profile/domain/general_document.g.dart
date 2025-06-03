// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneralDocument _$GeneralDocumentFromJson(Map<String, dynamic> json) =>
    _GeneralDocument(
      id: json['id'] as String,
      documentDescription: json['documentDescription'] as String,
      documentUrl: json['documentUrl'] as String?,
    );

Map<String, dynamic> _$GeneralDocumentToJson(_GeneralDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentDescription': instance.documentDescription,
      'documentUrl': instance.documentUrl,
    };
