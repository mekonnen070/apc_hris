import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/document_type.dart';

part 'employee_upload_model.freezed.dart';
part 'employee_upload_model.g.dart';

@freezed
abstract class EmployeeUploadModel with _$EmployeeUploadModel {
  const factory EmployeeUploadModel({
    String? documentId, // C# is nullable but Key
    required String employeeId,
    required String documentName,
    required DocumentType documentType,
    String? description,
    String? filePath, // This is the URL/path from backend after upload

    // For local file handling before upload
    @JsonKey(includeFromJson: false, includeToJson: false) File? documentFile,

    DateTime? expiryDate,
    @Default(true) bool isActive,
    String? uploadedBy, // Audit
    DateTime? uploadDate,   // C# not nullable, made nullable
  }) = _EmployeeUploadModel;

  factory EmployeeUploadModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeUploadModelFromJson(json);
}