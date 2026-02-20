// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recruit_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecruitInfo {

 String? get recruitId; String? get announcementId;@JsonKey(includeFromJson: false, includeToJson: false) RecruitmentAnnouncement? get announcement; String? get firstName; String? get fatherName; String? get grandName; Gender get gender; DateTime get birthDate; String? get motherName; String? get mobile; String? get email; Country get nationality; NewRecruitStatus get recruitStatus;
/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecruitInfoCopyWith<RecruitInfo> get copyWith => _$RecruitInfoCopyWithImpl<RecruitInfo>(this as RecruitInfo, _$identity);

  /// Serializes this RecruitInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecruitInfo&&(identical(other.recruitId, recruitId) || other.recruitId == recruitId)&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.announcement, announcement) || other.announcement == announcement)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.grandName, grandName) || other.grandName == grandName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.recruitStatus, recruitStatus) || other.recruitStatus == recruitStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recruitId,announcementId,announcement,firstName,fatherName,grandName,gender,birthDate,motherName,mobile,email,nationality,recruitStatus);

@override
String toString() {
  return 'RecruitInfo(recruitId: $recruitId, announcementId: $announcementId, announcement: $announcement, firstName: $firstName, fatherName: $fatherName, grandName: $grandName, gender: $gender, birthDate: $birthDate, motherName: $motherName, mobile: $mobile, email: $email, nationality: $nationality, recruitStatus: $recruitStatus)';
}


}

/// @nodoc
abstract mixin class $RecruitInfoCopyWith<$Res>  {
  factory $RecruitInfoCopyWith(RecruitInfo value, $Res Function(RecruitInfo) _then) = _$RecruitInfoCopyWithImpl;
@useResult
$Res call({
 String? recruitId, String? announcementId,@JsonKey(includeFromJson: false, includeToJson: false) RecruitmentAnnouncement? announcement, String? firstName, String? fatherName, String? grandName, Gender gender, DateTime birthDate, String? motherName, String? mobile, String? email, Country nationality, NewRecruitStatus recruitStatus
});


$RecruitmentAnnouncementCopyWith<$Res>? get announcement;

}
/// @nodoc
class _$RecruitInfoCopyWithImpl<$Res>
    implements $RecruitInfoCopyWith<$Res> {
  _$RecruitInfoCopyWithImpl(this._self, this._then);

  final RecruitInfo _self;
  final $Res Function(RecruitInfo) _then;

/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recruitId = freezed,Object? announcementId = freezed,Object? announcement = freezed,Object? firstName = freezed,Object? fatherName = freezed,Object? grandName = freezed,Object? gender = null,Object? birthDate = null,Object? motherName = freezed,Object? mobile = freezed,Object? email = freezed,Object? nationality = null,Object? recruitStatus = null,}) {
  return _then(_self.copyWith(
recruitId: freezed == recruitId ? _self.recruitId : recruitId // ignore: cast_nullable_to_non_nullable
as String?,announcementId: freezed == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as String?,announcement: freezed == announcement ? _self.announcement : announcement // ignore: cast_nullable_to_non_nullable
as RecruitmentAnnouncement?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,grandName: freezed == grandName ? _self.grandName : grandName // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as Country,recruitStatus: null == recruitStatus ? _self.recruitStatus : recruitStatus // ignore: cast_nullable_to_non_nullable
as NewRecruitStatus,
  ));
}
/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecruitmentAnnouncementCopyWith<$Res>? get announcement {
    if (_self.announcement == null) {
    return null;
  }

  return $RecruitmentAnnouncementCopyWith<$Res>(_self.announcement!, (value) {
    return _then(_self.copyWith(announcement: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecruitInfo].
extension RecruitInfoPatterns on RecruitInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecruitInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecruitInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecruitInfo value)  $default,){
final _that = this;
switch (_that) {
case _RecruitInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecruitInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RecruitInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? recruitId,  String? announcementId, @JsonKey(includeFromJson: false, includeToJson: false)  RecruitmentAnnouncement? announcement,  String? firstName,  String? fatherName,  String? grandName,  Gender gender,  DateTime birthDate,  String? motherName,  String? mobile,  String? email,  Country nationality,  NewRecruitStatus recruitStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecruitInfo() when $default != null:
return $default(_that.recruitId,_that.announcementId,_that.announcement,_that.firstName,_that.fatherName,_that.grandName,_that.gender,_that.birthDate,_that.motherName,_that.mobile,_that.email,_that.nationality,_that.recruitStatus);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? recruitId,  String? announcementId, @JsonKey(includeFromJson: false, includeToJson: false)  RecruitmentAnnouncement? announcement,  String? firstName,  String? fatherName,  String? grandName,  Gender gender,  DateTime birthDate,  String? motherName,  String? mobile,  String? email,  Country nationality,  NewRecruitStatus recruitStatus)  $default,) {final _that = this;
switch (_that) {
case _RecruitInfo():
return $default(_that.recruitId,_that.announcementId,_that.announcement,_that.firstName,_that.fatherName,_that.grandName,_that.gender,_that.birthDate,_that.motherName,_that.mobile,_that.email,_that.nationality,_that.recruitStatus);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? recruitId,  String? announcementId, @JsonKey(includeFromJson: false, includeToJson: false)  RecruitmentAnnouncement? announcement,  String? firstName,  String? fatherName,  String? grandName,  Gender gender,  DateTime birthDate,  String? motherName,  String? mobile,  String? email,  Country nationality,  NewRecruitStatus recruitStatus)?  $default,) {final _that = this;
switch (_that) {
case _RecruitInfo() when $default != null:
return $default(_that.recruitId,_that.announcementId,_that.announcement,_that.firstName,_that.fatherName,_that.grandName,_that.gender,_that.birthDate,_that.motherName,_that.mobile,_that.email,_that.nationality,_that.recruitStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecruitInfo implements RecruitInfo {
  const _RecruitInfo({required this.recruitId, required this.announcementId, @JsonKey(includeFromJson: false, includeToJson: false) this.announcement, required this.firstName, required this.fatherName, this.grandName, required this.gender, required this.birthDate, this.motherName, required this.mobile, this.email, this.nationality = Country.ethiopia, this.recruitStatus = NewRecruitStatus.pending});
  factory _RecruitInfo.fromJson(Map<String, dynamic> json) => _$RecruitInfoFromJson(json);

@override final  String? recruitId;
@override final  String? announcementId;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  RecruitmentAnnouncement? announcement;
@override final  String? firstName;
@override final  String? fatherName;
@override final  String? grandName;
@override final  Gender gender;
@override final  DateTime birthDate;
@override final  String? motherName;
@override final  String? mobile;
@override final  String? email;
@override@JsonKey() final  Country nationality;
@override@JsonKey() final  NewRecruitStatus recruitStatus;

/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecruitInfoCopyWith<_RecruitInfo> get copyWith => __$RecruitInfoCopyWithImpl<_RecruitInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecruitInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecruitInfo&&(identical(other.recruitId, recruitId) || other.recruitId == recruitId)&&(identical(other.announcementId, announcementId) || other.announcementId == announcementId)&&(identical(other.announcement, announcement) || other.announcement == announcement)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.grandName, grandName) || other.grandName == grandName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.recruitStatus, recruitStatus) || other.recruitStatus == recruitStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recruitId,announcementId,announcement,firstName,fatherName,grandName,gender,birthDate,motherName,mobile,email,nationality,recruitStatus);

@override
String toString() {
  return 'RecruitInfo(recruitId: $recruitId, announcementId: $announcementId, announcement: $announcement, firstName: $firstName, fatherName: $fatherName, grandName: $grandName, gender: $gender, birthDate: $birthDate, motherName: $motherName, mobile: $mobile, email: $email, nationality: $nationality, recruitStatus: $recruitStatus)';
}


}

/// @nodoc
abstract mixin class _$RecruitInfoCopyWith<$Res> implements $RecruitInfoCopyWith<$Res> {
  factory _$RecruitInfoCopyWith(_RecruitInfo value, $Res Function(_RecruitInfo) _then) = __$RecruitInfoCopyWithImpl;
@override @useResult
$Res call({
 String? recruitId, String? announcementId,@JsonKey(includeFromJson: false, includeToJson: false) RecruitmentAnnouncement? announcement, String? firstName, String? fatherName, String? grandName, Gender gender, DateTime birthDate, String? motherName, String? mobile, String? email, Country nationality, NewRecruitStatus recruitStatus
});


@override $RecruitmentAnnouncementCopyWith<$Res>? get announcement;

}
/// @nodoc
class __$RecruitInfoCopyWithImpl<$Res>
    implements _$RecruitInfoCopyWith<$Res> {
  __$RecruitInfoCopyWithImpl(this._self, this._then);

  final _RecruitInfo _self;
  final $Res Function(_RecruitInfo) _then;

/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recruitId = freezed,Object? announcementId = freezed,Object? announcement = freezed,Object? firstName = freezed,Object? fatherName = freezed,Object? grandName = freezed,Object? gender = null,Object? birthDate = null,Object? motherName = freezed,Object? mobile = freezed,Object? email = freezed,Object? nationality = null,Object? recruitStatus = null,}) {
  return _then(_RecruitInfo(
recruitId: freezed == recruitId ? _self.recruitId : recruitId // ignore: cast_nullable_to_non_nullable
as String?,announcementId: freezed == announcementId ? _self.announcementId : announcementId // ignore: cast_nullable_to_non_nullable
as String?,announcement: freezed == announcement ? _self.announcement : announcement // ignore: cast_nullable_to_non_nullable
as RecruitmentAnnouncement?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,grandName: freezed == grandName ? _self.grandName : grandName // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as Country,recruitStatus: null == recruitStatus ? _self.recruitStatus : recruitStatus // ignore: cast_nullable_to_non_nullable
as NewRecruitStatus,
  ));
}

/// Create a copy of RecruitInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecruitmentAnnouncementCopyWith<$Res>? get announcement {
    if (_self.announcement == null) {
    return null;
  }

  return $RecruitmentAnnouncementCopyWith<$Res>(_self.announcement!, (value) {
    return _then(_self.copyWith(announcement: value));
  });
}
}

// dart format on
