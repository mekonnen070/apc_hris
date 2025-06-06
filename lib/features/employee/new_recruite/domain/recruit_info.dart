import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/country.dart';
import 'package:police_com/core/enums/gender.dart';

part 'recruit_info.freezed.dart';
part 'recruit_info.g.dart';

/// Model representing recruit information for the recruitment feature.
/// Mirrors the C# RecruitInfo class.
@freezed
abstract class RecruitInfo with _$RecruitInfo {
  const factory RecruitInfo({
    required String recruitId,
    required String announcementId,
    required String firstName,
    required String fatherName,
    String? grandName,
    required Gender gender,
    required DateTime birthDate,
    String? motherName,
    required String mobile,
    String? email,
    Country? nationality,
  }) = _RecruitInfo;

  factory RecruitInfo.fromJson(Map<String, dynamic> json) =>
      _$RecruitInfoFromJson(json);
}
