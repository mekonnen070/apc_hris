import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';

part 'placement_applicant.freezed.dart';
part 'placement_applicant.g.dart';

@freezed
abstract class PlacementApplicant with _$PlacementApplicant {
  const factory PlacementApplicant({
    required int placementApplicantId,
    required int placementAnnouncementId,
    required String employeeId,
    String? employeeFullName,
    String? employeePhotoPath,
    required DateTime appliedDate,
    required ApplicantStatus status,
    String? reasonForRejection,
    String? appealReason,
    DateTime? appealDate,
  }) = _PlacementApplicant;

  factory PlacementApplicant.fromJson(Map<String, dynamic> json) =>
      _$PlacementApplicantFromJson(json);
}
