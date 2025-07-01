// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placement_announcement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlacementAnnouncement {

 int get announcementId; String get announcementTitle; String get location; String get department; String get positionId; int get requiredExperience; PlacementEducation get requiredEducation; int get requiredApplicants; DateTime get createdDate; String get createdBy; DateTime get expiryDate; bool get budgeted; ApplicantStatus get announcementStatus;
/// Create a copy of PlacementAnnouncement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlacementAnnouncementCopyWith<PlacementAnnouncement> get copyWith => _$PlacementAnnouncementCopyWithImpl<PlacementAnnouncement>(this as PlacementAnnouncement, _$identity);

  /// Serializes this PlacementAnnouncement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlacementAnnouncement&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.announcementTitle, announcementTitle) || other.announcementTitle == announcementTitle)&&(identical(other.location, location) || other.location == location)&&(identical(other.department, department) || other.department == department)&&(identical(other.positionId, positionId) || other.positionId == positionId)&&(identical(other.requiredExperience, requiredExperience) || other.requiredExperience == requiredExperience)&&(identical(other.requiredEducation, requiredEducation) || other.requiredEducation == requiredEducation)&&(identical(other.requiredApplicants, requiredApplicants) || other.requiredApplicants == requiredApplicants)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.budgeted, budgeted) || other.budgeted == budgeted)&&(identical(other.announcementStatus, announcementStatus) || other.announcementStatus == announcementStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,announcementId,announcementTitle,location,department,positionId,requiredExperience,requiredEducation,requiredApplicants,createdDate,createdBy,expiryDate,budgeted,announcementStatus);

@override
String toString() {
  return 'PlacementAnnouncement(announcementId: $announcementId, announcementTitle: $announcementTitle, location: $location, department: $department, positionId: $positionId, requiredExperience: $requiredExperience, requiredEducation: $requiredEducation, requiredApplicants: $requiredApplicants, createdDate: $createdDate, createdBy: $createdBy, expiryDate: $expiryDate, budgeted: $budgeted, announcementStatus: $announcementStatus)';
}


}

/// @nodoc
abstract mixin class $PlacementAnnouncementCopyWith<$Res>  {
  factory $PlacementAnnouncementCopyWith(PlacementAnnouncement value, $Res Function(PlacementAnnouncement) _then) = _$PlacementAnnouncementCopyWithImpl;
@useResult
$Res call({
 int announcementId, String announcementTitle, String location, String department, String positionId, int requiredExperience, PlacementEducation requiredEducation, int requiredApplicants, DateTime createdDate, String createdBy, DateTime expiryDate, bool budgeted, ApplicantStatus announcementStatus
});




}
/// @nodoc
class _$PlacementAnnouncementCopyWithImpl<$Res>
    implements $PlacementAnnouncementCopyWith<$Res> {
  _$PlacementAnnouncementCopyWithImpl(this._self, this._then);

  final PlacementAnnouncement _self;
  final $Res Function(PlacementAnnouncement) _then;

/// Create a copy of PlacementAnnouncement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? announcementId = null,Object? announcementTitle = null,Object? location = null,Object? department = null,Object? positionId = null,Object? requiredExperience = null,Object? requiredEducation = null,Object? requiredApplicants = null,Object? createdDate = null,Object? createdBy = null,Object? expiryDate = null,Object? budgeted = null,Object? announcementStatus = null,}) {
  return _then(_self.copyWith(
announcementId: null == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as int,announcementTitle: null == announcementTitle ? _self.announcementTitle : announcementTitle // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,positionId: null == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as String,requiredExperience: null == requiredExperience ? _self.requiredExperience : requiredExperience // ignore: cast_nullable_to_non_nullable
as int,requiredEducation: null == requiredEducation ? _self.requiredEducation : requiredEducation // ignore: cast_nullable_to_non_nullable
as PlacementEducation,requiredApplicants: null == requiredApplicants ? _self.requiredApplicants : requiredApplicants // ignore: cast_nullable_to_non_nullable
as int,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,budgeted: null == budgeted ? _self.budgeted : budgeted // ignore: cast_nullable_to_non_nullable
as bool,announcementStatus: null == announcementStatus ? _self.announcementStatus : announcementStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PlacementAnnouncement implements PlacementAnnouncement {
   _PlacementAnnouncement({required this.announcementId, required this.announcementTitle, required this.location, required this.department, required this.positionId, required this.requiredExperience, required this.requiredEducation, required this.requiredApplicants, required this.createdDate, required this.createdBy, required this.expiryDate, required this.budgeted, required this.announcementStatus});
  factory _PlacementAnnouncement.fromJson(Map<String, dynamic> json) => _$PlacementAnnouncementFromJson(json);

@override final  int announcementId;
@override final  String announcementTitle;
@override final  String location;
@override final  String department;
@override final  String positionId;
@override final  int requiredExperience;
@override final  PlacementEducation requiredEducation;
@override final  int requiredApplicants;
@override final  DateTime createdDate;
@override final  String createdBy;
@override final  DateTime expiryDate;
@override final  bool budgeted;
@override final  ApplicantStatus announcementStatus;

/// Create a copy of PlacementAnnouncement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlacementAnnouncementCopyWith<_PlacementAnnouncement> get copyWith => __$PlacementAnnouncementCopyWithImpl<_PlacementAnnouncement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlacementAnnouncementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlacementAnnouncement&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.announcementTitle, announcementTitle) || other.announcementTitle == announcementTitle)&&(identical(other.location, location) || other.location == location)&&(identical(other.department, department) || other.department == department)&&(identical(other.positionId, positionId) || other.positionId == positionId)&&(identical(other.requiredExperience, requiredExperience) || other.requiredExperience == requiredExperience)&&(identical(other.requiredEducation, requiredEducation) || other.requiredEducation == requiredEducation)&&(identical(other.requiredApplicants, requiredApplicants) || other.requiredApplicants == requiredApplicants)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.budgeted, budgeted) || other.budgeted == budgeted)&&(identical(other.announcementStatus, announcementStatus) || other.announcementStatus == announcementStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,announcementId,announcementTitle,location,department,positionId,requiredExperience,requiredEducation,requiredApplicants,createdDate,createdBy,expiryDate,budgeted,announcementStatus);

@override
String toString() {
  return 'PlacementAnnouncement(announcementId: $announcementId, announcementTitle: $announcementTitle, location: $location, department: $department, positionId: $positionId, requiredExperience: $requiredExperience, requiredEducation: $requiredEducation, requiredApplicants: $requiredApplicants, createdDate: $createdDate, createdBy: $createdBy, expiryDate: $expiryDate, budgeted: $budgeted, announcementStatus: $announcementStatus)';
}


}

/// @nodoc
abstract mixin class _$PlacementAnnouncementCopyWith<$Res> implements $PlacementAnnouncementCopyWith<$Res> {
  factory _$PlacementAnnouncementCopyWith(_PlacementAnnouncement value, $Res Function(_PlacementAnnouncement) _then) = __$PlacementAnnouncementCopyWithImpl;
@override @useResult
$Res call({
 int announcementId, String announcementTitle, String location, String department, String positionId, int requiredExperience, PlacementEducation requiredEducation, int requiredApplicants, DateTime createdDate, String createdBy, DateTime expiryDate, bool budgeted, ApplicantStatus announcementStatus
});




}
/// @nodoc
class __$PlacementAnnouncementCopyWithImpl<$Res>
    implements _$PlacementAnnouncementCopyWith<$Res> {
  __$PlacementAnnouncementCopyWithImpl(this._self, this._then);

  final _PlacementAnnouncement _self;
  final $Res Function(_PlacementAnnouncement) _then;

/// Create a copy of PlacementAnnouncement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? announcementId = null,Object? announcementTitle = null,Object? location = null,Object? department = null,Object? positionId = null,Object? requiredExperience = null,Object? requiredEducation = null,Object? requiredApplicants = null,Object? createdDate = null,Object? createdBy = null,Object? expiryDate = null,Object? budgeted = null,Object? announcementStatus = null,}) {
  return _then(_PlacementAnnouncement(
announcementId: null == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as int,announcementTitle: null == announcementTitle ? _self.announcementTitle : announcementTitle // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,positionId: null == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as String,requiredExperience: null == requiredExperience ? _self.requiredExperience : requiredExperience // ignore: cast_nullable_to_non_nullable
as int,requiredEducation: null == requiredEducation ? _self.requiredEducation : requiredEducation // ignore: cast_nullable_to_non_nullable
as PlacementEducation,requiredApplicants: null == requiredApplicants ? _self.requiredApplicants : requiredApplicants // ignore: cast_nullable_to_non_nullable
as int,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,budgeted: null == budgeted ? _self.budgeted : budgeted // ignore: cast_nullable_to_non_nullable
as bool,announcementStatus: null == announcementStatus ? _self.announcementStatus : announcementStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,
  ));
}


}

// dart format on
