// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'academic_qualification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AcademicQualification {

 String get id;// Unique identifier for the qualification
 String get institutionName; String get degreeOrCertificate; String get fieldOfStudy; DateTime? get graduationDate;@FileConverter() File? get certificateFile;// Local file before upload
 String? get certificateUrl;
/// Create a copy of AcademicQualification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcademicQualificationCopyWith<AcademicQualification> get copyWith => _$AcademicQualificationCopyWithImpl<AcademicQualification>(this as AcademicQualification, _$identity);

  /// Serializes this AcademicQualification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcademicQualification&&(identical(other.id, id) || other.id == id)&&(identical(other.institutionName, institutionName) || other.institutionName == institutionName)&&(identical(other.degreeOrCertificate, degreeOrCertificate) || other.degreeOrCertificate == degreeOrCertificate)&&(identical(other.fieldOfStudy, fieldOfStudy) || other.fieldOfStudy == fieldOfStudy)&&(identical(other.graduationDate, graduationDate) || other.graduationDate == graduationDate)&&(identical(other.certificateFile, certificateFile) || other.certificateFile == certificateFile)&&(identical(other.certificateUrl, certificateUrl) || other.certificateUrl == certificateUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,institutionName,degreeOrCertificate,fieldOfStudy,graduationDate,certificateFile,certificateUrl);

@override
String toString() {
  return 'AcademicQualification(id: $id, institutionName: $institutionName, degreeOrCertificate: $degreeOrCertificate, fieldOfStudy: $fieldOfStudy, graduationDate: $graduationDate, certificateFile: $certificateFile, certificateUrl: $certificateUrl)';
}


}

/// @nodoc
abstract mixin class $AcademicQualificationCopyWith<$Res>  {
  factory $AcademicQualificationCopyWith(AcademicQualification value, $Res Function(AcademicQualification) _then) = _$AcademicQualificationCopyWithImpl;
@useResult
$Res call({
 String id, String institutionName, String degreeOrCertificate, String fieldOfStudy, DateTime? graduationDate,@FileConverter() File? certificateFile, String? certificateUrl
});




}
/// @nodoc
class _$AcademicQualificationCopyWithImpl<$Res>
    implements $AcademicQualificationCopyWith<$Res> {
  _$AcademicQualificationCopyWithImpl(this._self, this._then);

  final AcademicQualification _self;
  final $Res Function(AcademicQualification) _then;

/// Create a copy of AcademicQualification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? institutionName = null,Object? degreeOrCertificate = null,Object? fieldOfStudy = null,Object? graduationDate = freezed,Object? certificateFile = freezed,Object? certificateUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,institutionName: null == institutionName ? _self.institutionName : institutionName // ignore: cast_nullable_to_non_nullable
as String,degreeOrCertificate: null == degreeOrCertificate ? _self.degreeOrCertificate : degreeOrCertificate // ignore: cast_nullable_to_non_nullable
as String,fieldOfStudy: null == fieldOfStudy ? _self.fieldOfStudy : fieldOfStudy // ignore: cast_nullable_to_non_nullable
as String,graduationDate: freezed == graduationDate ? _self.graduationDate : graduationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,certificateFile: freezed == certificateFile ? _self.certificateFile : certificateFile // ignore: cast_nullable_to_non_nullable
as File?,certificateUrl: freezed == certificateUrl ? _self.certificateUrl : certificateUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AcademicQualification].
extension AcademicQualificationPatterns on AcademicQualification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AcademicQualification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AcademicQualification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AcademicQualification value)  $default,){
final _that = this;
switch (_that) {
case _AcademicQualification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AcademicQualification value)?  $default,){
final _that = this;
switch (_that) {
case _AcademicQualification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String institutionName,  String degreeOrCertificate,  String fieldOfStudy,  DateTime? graduationDate, @FileConverter()  File? certificateFile,  String? certificateUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AcademicQualification() when $default != null:
return $default(_that.id,_that.institutionName,_that.degreeOrCertificate,_that.fieldOfStudy,_that.graduationDate,_that.certificateFile,_that.certificateUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String institutionName,  String degreeOrCertificate,  String fieldOfStudy,  DateTime? graduationDate, @FileConverter()  File? certificateFile,  String? certificateUrl)  $default,) {final _that = this;
switch (_that) {
case _AcademicQualification():
return $default(_that.id,_that.institutionName,_that.degreeOrCertificate,_that.fieldOfStudy,_that.graduationDate,_that.certificateFile,_that.certificateUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String institutionName,  String degreeOrCertificate,  String fieldOfStudy,  DateTime? graduationDate, @FileConverter()  File? certificateFile,  String? certificateUrl)?  $default,) {final _that = this;
switch (_that) {
case _AcademicQualification() when $default != null:
return $default(_that.id,_that.institutionName,_that.degreeOrCertificate,_that.fieldOfStudy,_that.graduationDate,_that.certificateFile,_that.certificateUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AcademicQualification implements AcademicQualification {
   _AcademicQualification({required this.id, required this.institutionName, required this.degreeOrCertificate, required this.fieldOfStudy, this.graduationDate, @FileConverter() this.certificateFile, this.certificateUrl});
  factory _AcademicQualification.fromJson(Map<String, dynamic> json) => _$AcademicQualificationFromJson(json);

@override final  String id;
// Unique identifier for the qualification
@override final  String institutionName;
@override final  String degreeOrCertificate;
@override final  String fieldOfStudy;
@override final  DateTime? graduationDate;
@override@FileConverter() final  File? certificateFile;
// Local file before upload
@override final  String? certificateUrl;

/// Create a copy of AcademicQualification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcademicQualificationCopyWith<_AcademicQualification> get copyWith => __$AcademicQualificationCopyWithImpl<_AcademicQualification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AcademicQualificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcademicQualification&&(identical(other.id, id) || other.id == id)&&(identical(other.institutionName, institutionName) || other.institutionName == institutionName)&&(identical(other.degreeOrCertificate, degreeOrCertificate) || other.degreeOrCertificate == degreeOrCertificate)&&(identical(other.fieldOfStudy, fieldOfStudy) || other.fieldOfStudy == fieldOfStudy)&&(identical(other.graduationDate, graduationDate) || other.graduationDate == graduationDate)&&(identical(other.certificateFile, certificateFile) || other.certificateFile == certificateFile)&&(identical(other.certificateUrl, certificateUrl) || other.certificateUrl == certificateUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,institutionName,degreeOrCertificate,fieldOfStudy,graduationDate,certificateFile,certificateUrl);

@override
String toString() {
  return 'AcademicQualification(id: $id, institutionName: $institutionName, degreeOrCertificate: $degreeOrCertificate, fieldOfStudy: $fieldOfStudy, graduationDate: $graduationDate, certificateFile: $certificateFile, certificateUrl: $certificateUrl)';
}


}

/// @nodoc
abstract mixin class _$AcademicQualificationCopyWith<$Res> implements $AcademicQualificationCopyWith<$Res> {
  factory _$AcademicQualificationCopyWith(_AcademicQualification value, $Res Function(_AcademicQualification) _then) = __$AcademicQualificationCopyWithImpl;
@override @useResult
$Res call({
 String id, String institutionName, String degreeOrCertificate, String fieldOfStudy, DateTime? graduationDate,@FileConverter() File? certificateFile, String? certificateUrl
});




}
/// @nodoc
class __$AcademicQualificationCopyWithImpl<$Res>
    implements _$AcademicQualificationCopyWith<$Res> {
  __$AcademicQualificationCopyWithImpl(this._self, this._then);

  final _AcademicQualification _self;
  final $Res Function(_AcademicQualification) _then;

/// Create a copy of AcademicQualification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? institutionName = null,Object? degreeOrCertificate = null,Object? fieldOfStudy = null,Object? graduationDate = freezed,Object? certificateFile = freezed,Object? certificateUrl = freezed,}) {
  return _then(_AcademicQualification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,institutionName: null == institutionName ? _self.institutionName : institutionName // ignore: cast_nullable_to_non_nullable
as String,degreeOrCertificate: null == degreeOrCertificate ? _self.degreeOrCertificate : degreeOrCertificate // ignore: cast_nullable_to_non_nullable
as String,fieldOfStudy: null == fieldOfStudy ? _self.fieldOfStudy : fieldOfStudy // ignore: cast_nullable_to_non_nullable
as String,graduationDate: freezed == graduationDate ? _self.graduationDate : graduationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,certificateFile: freezed == certificateFile ? _self.certificateFile : certificateFile // ignore: cast_nullable_to_non_nullable
as File?,certificateUrl: freezed == certificateUrl ? _self.certificateUrl : certificateUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
