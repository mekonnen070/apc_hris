import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/all_enums.dart';

import 'recruitment_announcement.dart';

part 'recruit_info.freezed.dart';
part 'recruit_info.g.dart';

@freezed
abstract class RecruitInfo with _$RecruitInfo {
  const factory RecruitInfo({
    required String? recruitId,
    required String? announcementId,
    @JsonKey(includeFromJson: false, includeToJson: false)
    RecruitmentAnnouncement? announcement,
    required String? firstName,
    required String? fatherName,
    String? grandName,
    required Gender gender,
    required DateTime birthDate,
    String? motherName,
    required String? mobile,
    String? email,
    @Default(Country.ethiopia) Country nationality,
    @Default(NewRecruitStatus.pending) NewRecruitStatus recruitStatus,
  }) = _RecruitInfo;

  factory RecruitInfo.fromJson(Map<String, dynamic> json) =>
      _$RecruitInfoFromJson(json);
}
