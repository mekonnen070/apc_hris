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

 int get applicantId; int get pAnnouncementId; String get employeeId; DateTime get entryDate; String get entryBy; int get policeTitle; ApplicantStatus get applicantStatus;
/// Create a copy of PlacementApplicant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlacementApplicantCopyWith<PlacementApplicant> get copyWith => _$PlacementApplicantCopyWithImpl<PlacementApplicant>(this as PlacementApplicant, _$identity);

  /// Serializes this PlacementApplicant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlacementApplicant&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.pAnnouncementId, pAnnouncementId) || other.pAnnouncementId == pAnnouncementId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.policeTitle, policeTitle) || other.policeTitle == policeTitle)&&(identical(other.applicantStatus, applicantStatus) || other.applicantStatus == applicantStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicantId,pAnnouncementId,employeeId,entryDate,entryBy,policeTitle,applicantStatus);

@override
String toString() {
  return 'PlacementApplicant(applicantId: $applicantId, pAnnouncementId: $pAnnouncementId, employeeId: $employeeId, entryDate: $entryDate, entryBy: $entryBy, policeTitle: $policeTitle, applicantStatus: $applicantStatus)';
}


}

/// @nodoc
abstract mixin class $PlacementApplicantCopyWith<$Res>  {
  factory $PlacementApplicantCopyWith(PlacementApplicant value, $Res Function(PlacementApplicant) _then) = _$PlacementApplicantCopyWithImpl;
@useResult
$Res call({
 int applicantId, int pAnnouncementId, String employeeId, DateTime entryDate, String entryBy, int policeTitle, ApplicantStatus applicantStatus
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
@pragma('vm:prefer-inline') @override $Res call({Object? applicantId = null,Object? pAnnouncementId = null,Object? employeeId = null,Object? entryDate = null,Object? entryBy = null,Object? policeTitle = null,Object? applicantStatus = null,}) {
  return _then(_self.copyWith(
applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as int,pAnnouncementId: null == pAnnouncementId ? _self.pAnnouncementId : pAnnouncementId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,entryDate: null == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime,entryBy: null == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String,policeTitle: null == policeTitle ? _self.policeTitle : policeTitle // ignore: cast_nullable_to_non_nullable
as int,applicantStatus: null == applicantStatus ? _self.applicantStatus : applicantStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PlacementApplicant implements PlacementApplicant {
  const _PlacementApplicant({required this.applicantId, required this.pAnnouncementId, required this.employeeId, required this.entryDate, required this.entryBy, required this.policeTitle, required this.applicantStatus});
  factory _PlacementApplicant.fromJson(Map<String, dynamic> json) => _$PlacementApplicantFromJson(json);

@override final  int applicantId;
@override final  int pAnnouncementId;
@override final  String employeeId;
@override final  DateTime entryDate;
@override final  String entryBy;
@override final  int policeTitle;
@override final  ApplicantStatus applicantStatus;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlacementApplicant&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.pAnnouncementId, pAnnouncementId) || other.pAnnouncementId == pAnnouncementId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.policeTitle, policeTitle) || other.policeTitle == policeTitle)&&(identical(other.applicantStatus, applicantStatus) || other.applicantStatus == applicantStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicantId,pAnnouncementId,employeeId,entryDate,entryBy,policeTitle,applicantStatus);

@override
String toString() {
  return 'PlacementApplicant(applicantId: $applicantId, pAnnouncementId: $pAnnouncementId, employeeId: $employeeId, entryDate: $entryDate, entryBy: $entryBy, policeTitle: $policeTitle, applicantStatus: $applicantStatus)';
}


}

/// @nodoc
abstract mixin class _$PlacementApplicantCopyWith<$Res> implements $PlacementApplicantCopyWith<$Res> {
  factory _$PlacementApplicantCopyWith(_PlacementApplicant value, $Res Function(_PlacementApplicant) _then) = __$PlacementApplicantCopyWithImpl;
@override @useResult
$Res call({
 int applicantId, int pAnnouncementId, String employeeId, DateTime entryDate, String entryBy, int policeTitle, ApplicantStatus applicantStatus
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
@override @pragma('vm:prefer-inline') $Res call({Object? applicantId = null,Object? pAnnouncementId = null,Object? employeeId = null,Object? entryDate = null,Object? entryBy = null,Object? policeTitle = null,Object? applicantStatus = null,}) {
  return _then(_PlacementApplicant(
applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as int,pAnnouncementId: null == pAnnouncementId ? _self.pAnnouncementId : pAnnouncementId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,entryDate: null == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime,entryBy: null == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String,policeTitle: null == policeTitle ? _self.policeTitle : policeTitle // ignore: cast_nullable_to_non_nullable
as int,applicantStatus: null == applicantStatus ? _self.applicantStatus : applicantStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,
  ));
}


}

// dart format on
