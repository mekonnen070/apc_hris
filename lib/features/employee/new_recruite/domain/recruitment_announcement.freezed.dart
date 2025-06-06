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

 int get id; String get title; String get content; DateTime get startDate; DateTime get endDate;
/// Create a copy of RecruitmentAnnouncement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecruitmentAnnouncementCopyWith<RecruitmentAnnouncement> get copyWith => _$RecruitmentAnnouncementCopyWithImpl<RecruitmentAnnouncement>(this as RecruitmentAnnouncement, _$identity);

  /// Serializes this RecruitmentAnnouncement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecruitmentAnnouncement&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,startDate,endDate);

@override
String toString() {
  return 'RecruitmentAnnouncement(id: $id, title: $title, content: $content, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $RecruitmentAnnouncementCopyWith<$Res>  {
  factory $RecruitmentAnnouncementCopyWith(RecruitmentAnnouncement value, $Res Function(RecruitmentAnnouncement) _then) = _$RecruitmentAnnouncementCopyWithImpl;
@useResult
$Res call({
 int id, String title, String content, DateTime startDate, DateTime endDate
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecruitmentAnnouncement implements RecruitmentAnnouncement {
  const _RecruitmentAnnouncement({required this.id, required this.title, required this.content, required this.startDate, required this.endDate});
  factory _RecruitmentAnnouncement.fromJson(Map<String, dynamic> json) => _$RecruitmentAnnouncementFromJson(json);

@override final  int id;
@override final  String title;
@override final  String content;
@override final  DateTime startDate;
@override final  DateTime endDate;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecruitmentAnnouncement&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,startDate,endDate);

@override
String toString() {
  return 'RecruitmentAnnouncement(id: $id, title: $title, content: $content, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$RecruitmentAnnouncementCopyWith<$Res> implements $RecruitmentAnnouncementCopyWith<$Res> {
  factory _$RecruitmentAnnouncementCopyWith(_RecruitmentAnnouncement value, $Res Function(_RecruitmentAnnouncement) _then) = __$RecruitmentAnnouncementCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String content, DateTime startDate, DateTime endDate
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_RecruitmentAnnouncement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
