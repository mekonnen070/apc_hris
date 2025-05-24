import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/file_converter.dart';

part 'academic_qualification.freezed.dart';
part 'academic_qualification.g.dart';

@freezed
abstract class AcademicQualification with _$AcademicQualification {
  factory AcademicQualification({
    required String id, // Unique identifier for the qualification
    required String institutionName,
    required String degreeOrCertificate,
    required String fieldOfStudy,
    DateTime? graduationDate,
    @FileConverter() File? certificateFile, // Local file before upload
    String? certificateUrl, // URL after upload
  }) = _AcademicQualification;

  factory AcademicQualification.fromJson(Map<String, dynamic> json) =>
      _$AcademicQualificationFromJson(json);
}
