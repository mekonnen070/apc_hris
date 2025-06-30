// Represents the status of a new recruit.
// enum NewRecruitStatus { pending, passed, failed }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_recruit_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum NewRecruitStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  passed,

  @JsonValue(2)
  failed,
}

