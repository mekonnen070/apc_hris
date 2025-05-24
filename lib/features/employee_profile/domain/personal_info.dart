import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_info.freezed.dart';
part 'personal_info.g.dart';

@freezed
abstract class PersonalInfo with _$PersonalInfo {
  factory PersonalInfo({
    required String fullName,
    required String address,
    required String phoneNumber,
    required String email,
    required DateTime? dateOfBirth,
    required String? gender,
    required String? maritalStatus,
  }) = _PersonalInfo;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);
}
