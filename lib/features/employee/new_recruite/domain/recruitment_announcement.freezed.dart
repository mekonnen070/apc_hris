// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recruitment_announcement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecruitmentAnnouncement {

 String get announcementId; String get announcementTitle; String get announcementDescription; int get requiredApplicants; String get round; DateTime? get createdDate; String? get createdBy; DateTime? get expiryDate; AnnouncementStatus? get status; DateTime? get postedDate; String? get postedBy;
/// Create a copy of RecruitmentAnnouncement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecruitmentAnnouncementCopyWith<RecruitmentAnnouncement> get copyWith => _$RecruitmentAnnouncementCopyWithImpl<RecruitmentAnnouncement>(this as RecruitmentAnnouncement, _$identity);

  /// Serializes this RecruitmentAnnouncement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecruitmentAnnouncement&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.announcementTitle, announcementTitle) || other.announcementTitle == announcementTitle)&&(identical(other.announcementDescription, announcementDescription) || other.announcementDescription == announcementDescription)&&(identical(other.requiredApplicants, requiredApplicants) || other.requiredApplicants == requiredApplicants)&&(identical(other.round, round) || other.round == round)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.postedDate, postedDate) || other.postedDate == postedDate)&&(identical(other.postedBy, postedBy) || other.postedBy == postedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,announcementId,announcementTitle,announcementDescription,requiredApplicants,round,createdDate,createdBy,expiryDate,status,postedDate,postedBy);

@override
String toString() {
  return 'RecruitmentAnnouncement(announcementId: $announcementId, announcementTitle: $announcementTitle, announcementDescription: $announcementDescription, requiredApplicants: $requiredApplicants, round: $round, createdDate: $createdDate, createdBy: $createdBy, expiryDate: $expiryDate, status: $status, postedDate: $postedDate, postedBy: $postedBy)';
}


}

/// @nodoc
abstract mixin class $RecruitmentAnnouncementCopyWith<$Res>  {
  factory $RecruitmentAnnouncementCopyWith(RecruitmentAnnouncement value, $Res Function(RecruitmentAnnouncement) _then) = _$RecruitmentAnnouncementCopyWithImpl;
@useResult
$Res call({
 String announcementId, String announcementTitle, String announcementDescription, int requiredApplicants, String round, DateTime? createdDate, String? createdBy, DateTime? expiryDate, AnnouncementStatus? status, DateTime? postedDate, String? postedBy
});




}
/// @nodoc
class _$RecruitmentAnnouncementCopyWithImpl<$Res>
    implements $RecruitmentAnnouncementCopyWith<$Res> {
  _$RecruitmentAnnouncementCopyWithImpl(this._self, this._then);

  final RecruitmentAnnouncement _self;
  final $Res Function(RecruitmentAnnouncement) _then;

/// Create a copy of RecruitmentAnnouncement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? announcementId = null,Object? announcementTitle = null,Object? announcementDescription = null,Object? requiredApplicants = null,Object? round = null,Object? createdDate = freezed,Object? createdBy = freezed,Object? expiryDate = freezed,Object? status = freezed,Object? postedDate = freezed,Object? postedBy = freezed,}) {
  return _then(_self.copyWith(
announcementId: null == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as String,announcementTitle: null == announcementTitle ? _self.announcementTitle : announcementTitle // ignore: cast_nullable_to_non_nullable
as String,announcementDescription: null == announcementDescription ? _self.announcementDescription : announcementDescription // ignore: cast_nullable_to_non_nullable
as String,requiredApplicants: null == requiredApplicants ? _self.requiredApplicants : requiredApplicants // ignore: cast_nullable_to_non_nullable
as int,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnouncementStatus?,postedDate: freezed == postedDate ? _self.postedDate : postedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,postedBy: freezed == postedBy ? _self.postedBy : postedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecruitmentAnnouncement implements RecruitmentAnnouncement {
  const _RecruitmentAnnouncement({required this.announcementId, required this.announcementTitle, required this.announcementDescription, required this.requiredApplicants, required this.round, required this.createdDate, this.createdBy, required this.expiryDate, this.status, this.postedDate, this.postedBy});
  factory _RecruitmentAnnouncement.fromJson(Map<String, dynamic> json) => _$RecruitmentAnnouncementFromJson(json);

@override final  String announcementId;
@override final  String announcementTitle;
@override final  String announcementDescription;
@override final  int requiredApplicants;
@override final  String round;
@override final  DateTime? createdDate;
@override final  String? createdBy;
@override final  DateTime? expiryDate;
@override final  AnnouncementStatus? status;
@override final  DateTime? postedDate;
@override final  String? postedBy;

/// Create a copy of RecruitmentAnnouncement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecruitmentAnnouncementCopyWith<_RecruitmentAnnouncement> get copyWith => __$RecruitmentAnnouncementCopyWithImpl<_RecruitmentAnnouncement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecruitmentAnnouncementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecruitmentAnnouncement&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.announcementTitle, announcementTitle) || other.announcementTitle == announcementTitle)&&(identical(other.announcementDescription, announcementDescription) || other.announcementDescription == announcementDescription)&&(identical(other.requiredApplicants, requiredApplicants) || other.requiredApplicants == requiredApplicants)&&(identical(other.round, round) || other.round == round)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.postedDate, postedDate) || other.postedDate == postedDate)&&(identical(other.postedBy, postedBy) || other.postedBy == postedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,announcementId,announcementTitle,announcementDescription,requiredApplicants,round,createdDate,createdBy,expiryDate,status,postedDate,postedBy);

@override
String toString() {
  return 'RecruitmentAnnouncement(announcementId: $announcementId, announcementTitle: $announcementTitle, announcementDescription: $announcementDescription, requiredApplicants: $requiredApplicants, round: $round, createdDate: $createdDate, createdBy: $createdBy, expiryDate: $expiryDate, status: $status, postedDate: $postedDate, postedBy: $postedBy)';
}


}

/// @nodoc
abstract mixin class _$RecruitmentAnnouncementCopyWith<$Res> implements $RecruitmentAnnouncementCopyWith<$Res> {
  factory _$RecruitmentAnnouncementCopyWith(_RecruitmentAnnouncement value, $Res Function(_RecruitmentAnnouncement) _then) = __$RecruitmentAnnouncementCopyWithImpl;
@override @useResult
$Res call({
 String announcementId, String announcementTitle, String announcementDescription, int requiredApplicants, String round, DateTime? createdDate, String? createdBy, DateTime? expiryDate, AnnouncementStatus? status, DateTime? postedDate, String? postedBy
});




}
/// @nodoc
class __$RecruitmentAnnouncementCopyWithImpl<$Res>
    implements _$RecruitmentAnnouncementCopyWith<$Res> {
  __$RecruitmentAnnouncementCopyWithImpl(this._self, this._then);

  final _RecruitmentAnnouncement _self;
  final $Res Function(_RecruitmentAnnouncement) _then;

/// Create a copy of RecruitmentAnnouncement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? announcementId = null,Object? announcementTitle = null,Object? announcementDescription = null,Object? requiredApplicants = null,Object? round = null,Object? createdDate = freezed,Object? createdBy = freezed,Object? expiryDate = freezed,Object? status = freezed,Object? postedDate = freezed,Object? postedBy = freezed,}) {
  return _then(_RecruitmentAnnouncement(
announcementId: null == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as String,announcementTitle: null == announcementTitle ? _self.announcementTitle : announcementTitle // ignore: cast_nullable_to_non_nullable
as String,announcementDescription: null == announcementDescription ? _self.announcementDescription : announcementDescription // ignore: cast_nullable_to_non_nullable
as String,requiredApplicants: null == requiredApplicants ? _self.requiredApplicants : requiredApplicants // ignore: cast_nullable_to_non_nullable
as int,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnouncementStatus?,postedDate: freezed == postedDate ? _self.postedDate : postedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,postedBy: freezed == postedBy ? _self.postedBy : postedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
