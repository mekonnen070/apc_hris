import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';

part 'placement.freezed.dart';
part 'placement.g.dart';

@freezed
abstract class Placement with _$Placement {
  const factory Placement({
    required int placementAnnouncementId,
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    // This UI-specific property will be populated by the repository
    ApplicantStatus? currentUserApplicationStatus,
  }) = _Placement;

  factory Placement.fromJson(Map<String, dynamic> json) =>
      _$PlacementFromJson(json);
}
