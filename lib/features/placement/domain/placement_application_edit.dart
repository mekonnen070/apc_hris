import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';

part 'placement_application_edit.freezed.dart';
part 'placement_application_edit.g.dart';

@freezed
abstract class PlacementApplicationEdit with _$PlacementApplicationEdit {
  const factory PlacementApplicationEdit({
    // This model exactly matches the JSON body for the Edit endpoint
    required int applicantId,
    required int pAnnouncementId,
    required String employeeId,
    required DateTime entryDate,
    required String entryBy,
    required int policeTitle,
    required ApplicantStatus applicantStatus,
  }) = _PlacementApplicationEdit;

  factory PlacementApplicationEdit.fromJson(Map<String, dynamic> json) =>
      _$PlacementApplicationEditFromJson(json);
}