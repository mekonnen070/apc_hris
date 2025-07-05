import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_data.freezed.dart';
part 'location_data.g.dart';

@freezed
abstract class LocationData with _$LocationData {
  const factory LocationData({
    required String location,
    required String locationId,
    required String department,
    required String position,
  }) = _LocationData;

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);
}