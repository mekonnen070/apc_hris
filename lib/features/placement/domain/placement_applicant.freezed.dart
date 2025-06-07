// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placement_applicant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlacementApplicant {

 int get placementApplicantId; int get placementAnnouncementId; String get employeeId; String? get employeeFullName; String? get employeePhotoPath; DateTime get appliedDate; ApplicantStatus get status; String? get reasonForRejection; String? get appealReason; DateTime? get appealDate;
/// Create a copy of PlacementApplicant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlacementApplicantCopyWith<PlacementApplicant> get copyWith => _$PlacementApplicantCopyWithImpl<PlacementApplicant>(this as PlacementApplicant, _$identity);

  /// Serializes this PlacementApplicant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlacementApplicant&&(identical(other.placementApplicantId, placementApplicantId) || other.placementApplicantId == placementApplicantId)&&(identical(other.placementAnnouncementId, placementAnnouncementId) || other.placementAnnouncementId == placementAnnouncementId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.employeeFullName, employeeFullName) || other.employeeFullName == employeeFullName)&&(identical(other.employeePhotoPath, employeePhotoPath) || other.employeePhotoPath == employeePhotoPath)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.reasonForRejection, reasonForRejection) || other.reasonForRejection == reasonForRejection)&&(identical(other.appealReason, appealReason) || other.appealReason == appealReason)&&(identical(other.appealDate, appealDate) || other.appealDate == appealDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placementApplicantId,placementAnnouncementId,employeeId,employeeFullName,employeePhotoPath,appliedDate,status,reasonForRejection,appealReason,appealDate);

@override
String toString() {
  return 'PlacementApplicant(placementApplicantId: $placementApplicantId, placementAnnouncementId: $placementAnnouncementId, employeeId: $employeeId, employeeFullName: $employeeFullName, employeePhotoPath: $employeePhotoPath, appliedDate: $appliedDate, status: $status, reasonForRejection: $reasonForRejection, appealReason: $appealReason, appealDate: $appealDate)';
}


}

/// @nodoc
abstract mixin class $PlacementApplicantCopyWith<$Res>  {
  factory $PlacementApplicantCopyWith(PlacementApplicant value, $Res Function(PlacementApplicant) _then) = _$PlacementApplicantCopyWithImpl;
@useResult
$Res call({
 int placementApplicantId, int placementAnnouncementId, String employeeId, String? employeeFullName, String? employeePhotoPath, DateTime appliedDate, ApplicantStatus status, String? reasonForRejection, String? appealReason, DateTime? appealDate
});




}
/// @nodoc
class _$PlacementApplicantCopyWithImpl<$Res>
    implements $PlacementApplicantCopyWith<$Res> {
  _$PlacementApplicantCopyWithImpl(this._self, this._then);

  final PlacementApplicant _self;
  final $Res Function(PlacementApplicant) _then;

/// Create a copy of PlacementApplicant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placementApplicantId = null,Object? placementAnnouncementId = null,Object? employeeId = null,Object? employeeFullName = freezed,Object? employeePhotoPath = freezed,Object? appliedDate = null,Object? status = null,Object? reasonForRejection = freezed,Object? appealReason = freezed,Object? appealDate = freezed,}) {
  return _then(_self.copyWith(
placementApplicantId: null == placementApplicantId ? _self.placementApplicantId : placementApplicantId // ignore: cast_nullable_to_non_nullable
as int,placementAnnouncementId: null == placementAnnouncementId ? _self.placementAnnouncementId : placementAnnouncementId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,employeeFullName: freezed == employeeFullName ? _self.employeeFullName : employeeFullName // ignore: cast_nullable_to_non_nullable
as String?,employeePhotoPath: freezed == employeePhotoPath ? _self.employeePhotoPath : employeePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,appliedDate: null == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,reasonForRejection: freezed == reasonForRejection ? _self.reasonForRejection : reasonForRejection // ignore: cast_nullable_to_non_nullable
as String?,appealReason: freezed == appealReason ? _self.appealReason : appealReason // ignore: cast_nullable_to_non_nullable
as String?,appealDate: freezed == appealDate ? _self.appealDate : appealDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PlacementApplicant implements PlacementApplicant {
  const _PlacementApplicant({required this.placementApplicantId, required this.placementAnnouncementId, required this.employeeId, this.employeeFullName, this.employeePhotoPath, required this.appliedDate, required this.status, this.reasonForRejection, this.appealReason, this.appealDate});
  factory _PlacementApplicant.fromJson(Map<String, dynamic> json) => _$PlacementApplicantFromJson(json);

@override final  int placementApplicantId;
@override final  int placementAnnouncementId;
@override final  String employeeId;
@override final  String? employeeFullName;
@override final  String? employeePhotoPath;
@override final  DateTime appliedDate;
@override final  ApplicantStatus status;
@override final  String? reasonForRejection;
@override final  String? appealReason;
@override final  DateTime? appealDate;

/// Create a copy of PlacementApplicant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlacementApplicantCopyWith<_PlacementApplicant> get copyWith => __$PlacementApplicantCopyWithImpl<_PlacementApplicant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlacementApplicantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlacementApplicant&&(identical(other.placementApplicantId, placementApplicantId) || other.placementApplicantId == placementApplicantId)&&(identical(other.placementAnnouncementId, placementAnnouncementId) || other.placementAnnouncementId == placementAnnouncementId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.employeeFullName, employeeFullName) || other.employeeFullName == employeeFullName)&&(identical(other.employeePhotoPath, employeePhotoPath) || other.employeePhotoPath == employeePhotoPath)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.reasonForRejection, reasonForRejection) || other.reasonForRejection == reasonForRejection)&&(identical(other.appealReason, appealReason) || other.appealReason == appealReason)&&(identical(other.appealDate, appealDate) || other.appealDate == appealDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placementApplicantId,placementAnnouncementId,employeeId,employeeFullName,employeePhotoPath,appliedDate,status,reasonForRejection,appealReason,appealDate);

@override
String toString() {
  return 'PlacementApplicant(placementApplicantId: $placementApplicantId, placementAnnouncementId: $placementAnnouncementId, employeeId: $employeeId, employeeFullName: $employeeFullName, employeePhotoPath: $employeePhotoPath, appliedDate: $appliedDate, status: $status, reasonForRejection: $reasonForRejection, appealReason: $appealReason, appealDate: $appealDate)';
}


}

/// @nodoc
abstract mixin class _$PlacementApplicantCopyWith<$Res> implements $PlacementApplicantCopyWith<$Res> {
  factory _$PlacementApplicantCopyWith(_PlacementApplicant value, $Res Function(_PlacementApplicant) _then) = __$PlacementApplicantCopyWithImpl;
@override @useResult
$Res call({
 int placementApplicantId, int placementAnnouncementId, String employeeId, String? employeeFullName, String? employeePhotoPath, DateTime appliedDate, ApplicantStatus status, String? reasonForRejection, String? appealReason, DateTime? appealDate
});




}
/// @nodoc
class __$PlacementApplicantCopyWithImpl<$Res>
    implements _$PlacementApplicantCopyWith<$Res> {
  __$PlacementApplicantCopyWithImpl(this._self, this._then);

  final _PlacementApplicant _self;
  final $Res Function(_PlacementApplicant) _then;

/// Create a copy of PlacementApplicant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placementApplicantId = null,Object? placementAnnouncementId = null,Object? employeeId = null,Object? employeeFullName = freezed,Object? employeePhotoPath = freezed,Object? appliedDate = null,Object? status = null,Object? reasonForRejection = freezed,Object? appealReason = freezed,Object? appealDate = freezed,}) {
  return _then(_PlacementApplicant(
placementApplicantId: null == placementApplicantId ? _self.placementApplicantId : placementApplicantId // ignore: cast_nullable_to_non_nullable
as int,placementAnnouncementId: null == placementAnnouncementId ? _self.placementAnnouncementId : placementAnnouncementId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,employeeFullName: freezed == employeeFullName ? _self.employeeFullName : employeeFullName // ignore: cast_nullable_to_non_nullable
as String?,employeePhotoPath: freezed == employeePhotoPath ? _self.employeePhotoPath : employeePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,appliedDate: null == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,reasonForRejection: freezed == reasonForRejection ? _self.reasonForRejection : reasonForRejection // ignore: cast_nullable_to_non_nullable
as String?,appealReason: freezed == appealReason ? _self.appealReason : appealReason // ignore: cast_nullable_to_non_nullable
as String?,appealDate: freezed == appealDate ? _self.appealDate : appealDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
