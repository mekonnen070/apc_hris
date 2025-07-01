import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';

part 'placement_applicant.freezed.dart';
part 'placement_applicant.g.dart';

@freezed
abstract class PlacementApplicant with _$PlacementApplicant {
  const factory PlacementApplicant({
    required int applicantId,
    required int pAnnouncementId,
    required String employeeId,
    required DateTime entryDate,
    required String entryBy,
    required int policeTitle,
    required ApplicantStatus applicantStatus,
  }) = _PlacementApplicant;

  factory PlacementApplicant.fromJson(Map<String, dynamic> json) =>
      _$PlacementApplicantFromJson(json);
}
