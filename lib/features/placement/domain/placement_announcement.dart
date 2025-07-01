import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/core/enums/placement_education.dart';

part 'placement_announcement.freezed.dart';
part 'placement_announcement.g.dart';

@freezed
abstract class PlacementAnnouncement with _$PlacementAnnouncement {
  factory PlacementAnnouncement({
    required int announcementId,
    required String announcementTitle,
    required String location,
    required String department,
    required String positionId,
    required int requiredExperience,
    required PlacementEducation requiredEducation,
    required int requiredApplicants,
    required DateTime createdDate,
    required String createdBy,
    required DateTime expiryDate,
    required bool budgeted,
    required ApplicantStatus announcementStatus,
  }) = _PlacementAnnouncement;

  factory PlacementAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$PlacementAnnouncementFromJson(json);
}
