// Categorizes different types of documents.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum DocumentType {
  @JsonValue(0)
  cv,

  @JsonValue(1)
  contract,

  @JsonValue(2)
  id, // General ID

  @JsonValue(3)
  passport,

  @JsonValue(4)
  drivingLicense,

  @JsonValue(5)
  academicCertificate,

  @JsonValue(6)
  trainingCertificate,

  @JsonValue(7)
  paySlip,

  @JsonValue(8)
  taxDocument,

  @JsonValue(9)
  medicalReport,

  @JsonValue(10)
  other,
}