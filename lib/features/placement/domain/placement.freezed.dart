// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Placement {

 int get placementAnnouncementId; String get title; String get description; DateTime get startDate; DateTime get endDate; String get location;// This UI-specific property will be populated by the repository
 ApplicantStatus? get currentUserApplicationStatus;
/// Create a copy of Placement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlacementCopyWith<Placement> get copyWith => _$PlacementCopyWithImpl<Placement>(this as Placement, _$identity);

  /// Serializes this Placement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Placement&&(identical(other.placementAnnouncementId, placementAnnouncementId) || other.placementAnnouncementId == placementAnnouncementId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.location, location) || other.location == location)&&(identical(other.currentUserApplicationStatus, currentUserApplicationStatus) || other.currentUserApplicationStatus == currentUserApplicationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placementAnnouncementId,title,description,startDate,endDate,location,currentUserApplicationStatus);

@override
String toString() {
  return 'Placement(placementAnnouncementId: $placementAnnouncementId, title: $title, description: $description, startDate: $startDate, endDate: $endDate, location: $location, currentUserApplicationStatus: $currentUserApplicationStatus)';
}


}

/// @nodoc
abstract mixin class $PlacementCopyWith<$Res>  {
  factory $PlacementCopyWith(Placement value, $Res Function(Placement) _then) = _$PlacementCopyWithImpl;
@useResult
$Res call({
 int placementAnnouncementId, String title, String description, DateTime startDate, DateTime endDate, String location, ApplicantStatus? currentUserApplicationStatus
});




}
/// @nodoc
class _$PlacementCopyWithImpl<$Res>
    implements $PlacementCopyWith<$Res> {
  _$PlacementCopyWithImpl(this._self, this._then);

  final Placement _self;
  final $Res Function(Placement) _then;

/// Create a copy of Placement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placementAnnouncementId = null,Object? title = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? location = null,Object? currentUserApplicationStatus = freezed,}) {
  return _then(_self.copyWith(
placementAnnouncementId: null == placementAnnouncementId ? _self.placementAnnouncementId : placementAnnouncementId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,currentUserApplicationStatus: freezed == currentUserApplicationStatus ? _self.currentUserApplicationStatus : currentUserApplicationStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Placement implements Placement {
  const _Placement({required this.placementAnnouncementId, required this.title, required this.description, required this.startDate, required this.endDate, required this.location, this.currentUserApplicationStatus});
  factory _Placement.fromJson(Map<String, dynamic> json) => _$PlacementFromJson(json);

@override final  int placementAnnouncementId;
@override final  String title;
@override final  String description;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String location;
// This UI-specific property will be populated by the repository
@override final  ApplicantStatus? currentUserApplicationStatus;

/// Create a copy of Placement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlacementCopyWith<_Placement> get copyWith => __$PlacementCopyWithImpl<_Placement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlacementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Placement&&(identical(other.placementAnnouncementId, placementAnnouncementId) || other.placementAnnouncementId == placementAnnouncementId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.location, location) || other.location == location)&&(identical(other.currentUserApplicationStatus, currentUserApplicationStatus) || other.currentUserApplicationStatus == currentUserApplicationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placementAnnouncementId,title,description,startDate,endDate,location,currentUserApplicationStatus);

@override
String toString() {
  return 'Placement(placementAnnouncementId: $placementAnnouncementId, title: $title, description: $description, startDate: $startDate, endDate: $endDate, location: $location, currentUserApplicationStatus: $currentUserApplicationStatus)';
}


}

/// @nodoc
abstract mixin class _$PlacementCopyWith<$Res> implements $PlacementCopyWith<$Res> {
  factory _$PlacementCopyWith(_Placement value, $Res Function(_Placement) _then) = __$PlacementCopyWithImpl;
@override @useResult
$Res call({
 int placementAnnouncementId, String title, String description, DateTime startDate, DateTime endDate, String location, ApplicantStatus? currentUserApplicationStatus
});




}
/// @nodoc
class __$PlacementCopyWithImpl<$Res>
    implements _$PlacementCopyWith<$Res> {
  __$PlacementCopyWithImpl(this._self, this._then);

  final _Placement _self;
  final $Res Function(_Placement) _then;

/// Create a copy of Placement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placementAnnouncementId = null,Object? title = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? location = null,Object? currentUserApplicationStatus = freezed,}) {
  return _then(_Placement(
placementAnnouncementId: null == placementAnnouncementId ? _self.placementAnnouncementId : placementAnnouncementId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,currentUserApplicationStatus: freezed == currentUserApplicationStatus ? _self.currentUserApplicationStatus : currentUserApplicationStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,
  ));
}


}

// dart format on
