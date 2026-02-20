// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placement_application_edit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlacementApplicationEdit {

// This model exactly matches the JSON body for the Edit endpoint
 int get applicantId; int get pAnnouncementId; String get employeeId; DateTime get entryDate; String get entryBy; int get policeTitle; ApplicantStatus get applicantStatus;
/// Create a copy of PlacementApplicationEdit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlacementApplicationEditCopyWith<PlacementApplicationEdit> get copyWith => _$PlacementApplicationEditCopyWithImpl<PlacementApplicationEdit>(this as PlacementApplicationEdit, _$identity);

  /// Serializes this PlacementApplicationEdit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlacementApplicationEdit&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.pAnnouncementId, pAnnouncementId) || other.pAnnouncementId == pAnnouncementId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.policeTitle, policeTitle) || other.policeTitle == policeTitle)&&(identical(other.applicantStatus, applicantStatus) || other.applicantStatus == applicantStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicantId,pAnnouncementId,employeeId,entryDate,entryBy,policeTitle,applicantStatus);

@override
String toString() {
  return 'PlacementApplicationEdit(applicantId: $applicantId, pAnnouncementId: $pAnnouncementId, employeeId: $employeeId, entryDate: $entryDate, entryBy: $entryBy, policeTitle: $policeTitle, applicantStatus: $applicantStatus)';
}


}

/// @nodoc
abstract mixin class $PlacementApplicationEditCopyWith<$Res>  {
  factory $PlacementApplicationEditCopyWith(PlacementApplicationEdit value, $Res Function(PlacementApplicationEdit) _then) = _$PlacementApplicationEditCopyWithImpl;
@useResult
$Res call({
 int applicantId, int pAnnouncementId, String employeeId, DateTime entryDate, String entryBy, int policeTitle, ApplicantStatus applicantStatus
});




}
/// @nodoc
class _$PlacementApplicationEditCopyWithImpl<$Res>
    implements $PlacementApplicationEditCopyWith<$Res> {
  _$PlacementApplicationEditCopyWithImpl(this._self, this._then);

  final PlacementApplicationEdit _self;
  final $Res Function(PlacementApplicationEdit) _then;

/// Create a copy of PlacementApplicationEdit
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


/// Adds pattern-matching-related methods to [PlacementApplicationEdit].
extension PlacementApplicationEditPatterns on PlacementApplicationEdit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlacementApplicationEdit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlacementApplicationEdit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlacementApplicationEdit value)  $default,){
final _that = this;
switch (_that) {
case _PlacementApplicationEdit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlacementApplicationEdit value)?  $default,){
final _that = this;
switch (_that) {
case _PlacementApplicationEdit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int applicantId,  int pAnnouncementId,  String employeeId,  DateTime entryDate,  String entryBy,  int policeTitle,  ApplicantStatus applicantStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlacementApplicationEdit() when $default != null:
return $default(_that.applicantId,_that.pAnnouncementId,_that.employeeId,_that.entryDate,_that.entryBy,_that.policeTitle,_that.applicantStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int applicantId,  int pAnnouncementId,  String employeeId,  DateTime entryDate,  String entryBy,  int policeTitle,  ApplicantStatus applicantStatus)  $default,) {final _that = this;
switch (_that) {
case _PlacementApplicationEdit():
return $default(_that.applicantId,_that.pAnnouncementId,_that.employeeId,_that.entryDate,_that.entryBy,_that.policeTitle,_that.applicantStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int applicantId,  int pAnnouncementId,  String employeeId,  DateTime entryDate,  String entryBy,  int policeTitle,  ApplicantStatus applicantStatus)?  $default,) {final _that = this;
switch (_that) {
case _PlacementApplicationEdit() when $default != null:
return $default(_that.applicantId,_that.pAnnouncementId,_that.employeeId,_that.entryDate,_that.entryBy,_that.policeTitle,_that.applicantStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlacementApplicationEdit implements PlacementApplicationEdit {
  const _PlacementApplicationEdit({required this.applicantId, required this.pAnnouncementId, required this.employeeId, required this.entryDate, required this.entryBy, required this.policeTitle, required this.applicantStatus});
  factory _PlacementApplicationEdit.fromJson(Map<String, dynamic> json) => _$PlacementApplicationEditFromJson(json);

// This model exactly matches the JSON body for the Edit endpoint
@override final  int applicantId;
@override final  int pAnnouncementId;
@override final  String employeeId;
@override final  DateTime entryDate;
@override final  String entryBy;
@override final  int policeTitle;
@override final  ApplicantStatus applicantStatus;

/// Create a copy of PlacementApplicationEdit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlacementApplicationEditCopyWith<_PlacementApplicationEdit> get copyWith => __$PlacementApplicationEditCopyWithImpl<_PlacementApplicationEdit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlacementApplicationEditToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlacementApplicationEdit&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.pAnnouncementId, pAnnouncementId) || other.pAnnouncementId == pAnnouncementId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.policeTitle, policeTitle) || other.policeTitle == policeTitle)&&(identical(other.applicantStatus, applicantStatus) || other.applicantStatus == applicantStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicantId,pAnnouncementId,employeeId,entryDate,entryBy,policeTitle,applicantStatus);

@override
String toString() {
  return 'PlacementApplicationEdit(applicantId: $applicantId, pAnnouncementId: $pAnnouncementId, employeeId: $employeeId, entryDate: $entryDate, entryBy: $entryBy, policeTitle: $policeTitle, applicantStatus: $applicantStatus)';
}


}

/// @nodoc
abstract mixin class _$PlacementApplicationEditCopyWith<$Res> implements $PlacementApplicationEditCopyWith<$Res> {
  factory _$PlacementApplicationEditCopyWith(_PlacementApplicationEdit value, $Res Function(_PlacementApplicationEdit) _then) = __$PlacementApplicationEditCopyWithImpl;
@override @useResult
$Res call({
 int applicantId, int pAnnouncementId, String employeeId, DateTime entryDate, String entryBy, int policeTitle, ApplicantStatus applicantStatus
});




}
/// @nodoc
class __$PlacementApplicationEditCopyWithImpl<$Res>
    implements _$PlacementApplicationEditCopyWith<$Res> {
  __$PlacementApplicationEditCopyWithImpl(this._self, this._then);

  final _PlacementApplicationEdit _self;
  final $Res Function(_PlacementApplicationEdit) _then;

/// Create a copy of PlacementApplicationEdit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicantId = null,Object? pAnnouncementId = null,Object? employeeId = null,Object? entryDate = null,Object? entryBy = null,Object? policeTitle = null,Object? applicantStatus = null,}) {
  return _then(_PlacementApplicationEdit(
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
