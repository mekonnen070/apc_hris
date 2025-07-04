import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/announcement_status.dart';

part 'recruitment_announcement.freezed.dart';
part 'recruitment_announcement.g.dart';

@freezed
abstract class RecruitmentAnnouncement with _$RecruitmentAnnouncement {
  const factory RecruitmentAnnouncement({
    required String? announcementId,
    required String? announcementTitle,
    required String? announcementDescription,
    required int requiredApplicants,
    required String? round,
    required DateTime? createdDate,
    String? createdBy,
    required DateTime? expiryDate,
    @Default(AnnouncementStatus.created) AnnouncementStatus status,
    DateTime? postedDate,
    String? postedBy,
  }) = _RecruitmentAnnouncement;

  factory RecruitmentAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$RecruitmentAnnouncementFromJson(json);
}