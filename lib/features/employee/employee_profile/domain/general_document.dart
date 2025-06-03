import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_document.freezed.dart';
part 'general_document.g.dart';

@freezed
abstract class GeneralDocument with _$GeneralDocument {
  factory GeneralDocument({
    required String id, // Unique identifier
    required String documentDescription,
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? documentFile, // Local file before upload
    String? documentUrl, // URL after upload
  }) = _GeneralDocument;

  factory GeneralDocument.fromJson(Map<String, dynamic> json) =>
      _$GeneralDocumentFromJson(json);
}
