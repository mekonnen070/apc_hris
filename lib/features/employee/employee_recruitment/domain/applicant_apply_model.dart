import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/gender.dart'; // Using existing Gender enum
import 'package:police_com/core/enums/identification_type.dart';
import 'package:police_com/core/enums/recruitment_status.dart';

part 'applicant_apply_model.freezed.dart';
part 'applicant_apply_model.g.dart';

@freezed
abstract class ApplicantApplyModel with _$ApplicantApplyModel {
  const factory ApplicantApplyModel({
    int? applicantId,
    @JsonKey(name: 'appliedTo') required String appliedToVacancyId,
    required String firstName,
    required String lastName,
    String? middleName,
    required String email,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required Gender gender, // Using existing Gender enum
    required String address,
    required String nationality,

    @JsonKey(includeFromJson: false, includeToJson: false)
    File? resumeFile, // For local file picking
    String? resumePath, // To store URL/path from backend after upload

    String? identificationNumber,
    @Default(IdentificationType.nationalId)
    IdentificationType identificationType,

    // Fields related to recruitment process stages (populated by HR/System later)
    DateTime? interviewScheduledTime,
    String? interviewerName,
    String? interviewerFeedback,
    double? interviewScore, // Using double for decimal

    DateTime? examScheduledTime,
    String? examinerName,
    String? examinerFeedback,
    double? examScore, // Using double for decimal

    @Default(false) bool backgroundCheck,
    String? backgroundCheckRemark,
    @Default(false) bool referenceCheck,
    String? referenceCheckRemark,
    @Default(false) bool medicalCheck,
    String? medicalCheckRemark,
    @Default(false) bool finalCheck, // e.g. final approval
    String? finalCheckRemark,

    @Default(false) bool isOnBoarding, // From C#
    String? isOnBoardingRemark, // From C#

    @Default(RecruitmentStatus.submitted) RecruitmentStatus status,
    DateTime? entryDate, // Date of application submission
    String? entryBy, // Could be applicant's user ID if logged in, or system
  }) = _ApplicantApplyModel;

  factory ApplicantApplyModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicantApplyModelFromJson(json);
}
