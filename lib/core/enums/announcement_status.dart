import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum AnnouncementStatus {
  @JsonValue(0)
  created,

  @JsonValue(1)
  posted,

  @JsonValue(2)
  expired,
}
