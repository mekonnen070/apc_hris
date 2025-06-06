import 'package:freezed_annotation/freezed_annotation.dart';

part 'recruitment_announcement.freezed.dart';
part 'recruitment_announcement.g.dart';

@freezed
abstract class RecruitmentAnnouncement with _$RecruitmentAnnouncement {
  const factory RecruitmentAnnouncement({
    required int id,
    required String title,
    required String content,
    required DateTime startDate,
    required DateTime endDate,
  }) = _RecruitmentAnnouncement;

  factory RecruitmentAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$RecruitmentAnnouncementFromJson(json);
}