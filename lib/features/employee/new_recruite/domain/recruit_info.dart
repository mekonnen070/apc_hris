import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/all_enums.dart';

part 'recruit_info.freezed.dart';
part 'recruit_info.g.dart';

@freezed
abstract class RecruitInfo with _$RecruitInfo {
  const factory RecruitInfo({
    int? id,
    required int announcementId,
    required String firstName,
    required String middleName,
    required String lastName,
    required DateTime dateOfBirth,
    required int age,
    required Gender gender,
    required MaritalStatus maritalStatus,
    required int numberOfChildren,
    required String nationality,
    required Religion religion,
    required BloodGroup bloodGroup,
    required String photoPath,
    required String woreda,
    required String kebele,
    required String houseNumber,
    required String phoneNumber,
    String? signature,
    @Default(RecruitStatus.noStatus) RecruitStatus status,
  }) = _RecruitInfo;

  factory RecruitInfo.fromJson(Map<String, dynamic> json) =>
      _$RecruitInfoFromJson(json);
}