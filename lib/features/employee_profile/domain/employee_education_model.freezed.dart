// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_education_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeEducationModel {

 String? get educationId; String get employeeId;// C# has 'string? Education'. Using EducationLevel enum for type safety in Dart.
// If backend JSON strictly uses string for 'Education', a JsonConverter will be needed.
 EducationLevel get educationLevel; EthiopianUniversity get university; String? get cgpa; FieldOfStudy get fieldOfStudy; DateTime get startDate; DateTime? get endDate; EducationStatus get educationStatus; String? get entryBy;// C# is 'string? EntryBy' but marked [Required]
 DateTime? get entryDate;// C# is 'DateTime EntryDate', made nullable
 bool get isApproved;
/// Create a copy of EmployeeEducationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeEducationModelCopyWith<EmployeeEducationModel> get copyWith => _$EmployeeEducationModelCopyWithImpl<EmployeeEducationModel>(this as EmployeeEducationModel, _$identity);

  /// Serializes this EmployeeEducationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeEducationModel&&(identical(other.educationId, educationId) || other.educationId == educationId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.university, university) || other.university == university)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.fieldOfStudy, fieldOfStudy) || other.fieldOfStudy == fieldOfStudy)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.educationStatus, educationStatus) || other.educationStatus == educationStatus)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,educationId,employeeId,educationLevel,university,cgpa,fieldOfStudy,startDate,endDate,educationStatus,entryBy,entryDate,isApproved);

@override
String toString() {
  return 'EmployeeEducationModel(educationId: $educationId, employeeId: $employeeId, educationLevel: $educationLevel, university: $university, cgpa: $cgpa, fieldOfStudy: $fieldOfStudy, startDate: $startDate, endDate: $endDate, educationStatus: $educationStatus, entryBy: $entryBy, entryDate: $entryDate, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class $EmployeeEducationModelCopyWith<$Res>  {
  factory $EmployeeEducationModelCopyWith(EmployeeEducationModel value, $Res Function(EmployeeEducationModel) _then) = _$EmployeeEducationModelCopyWithImpl;
@useResult
$Res call({
 String? educationId, String employeeId, EducationLevel educationLevel, EthiopianUniversity university, String? cgpa, FieldOfStudy fieldOfStudy, DateTime startDate, DateTime? endDate, EducationStatus educationStatus, String? entryBy, DateTime? entryDate, bool isApproved
});




}
/// @nodoc
class _$EmployeeEducationModelCopyWithImpl<$Res>
    implements $EmployeeEducationModelCopyWith<$Res> {
  _$EmployeeEducationModelCopyWithImpl(this._self, this._then);

  final EmployeeEducationModel _self;
  final $Res Function(EmployeeEducationModel) _then;

/// Create a copy of EmployeeEducationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? educationId = freezed,Object? employeeId = null,Object? educationLevel = null,Object? university = null,Object? cgpa = freezed,Object? fieldOfStudy = null,Object? startDate = null,Object? endDate = freezed,Object? educationStatus = null,Object? entryBy = freezed,Object? entryDate = freezed,Object? isApproved = null,}) {
  return _then(_self.copyWith(
educationId: freezed == educationId ? _self.educationId : educationId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as EducationLevel,university: null == university ? _self.university : university // ignore: cast_nullable_to_non_nullable
as EthiopianUniversity,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,fieldOfStudy: null == fieldOfStudy ? _self.fieldOfStudy : fieldOfStudy // ignore: cast_nullable_to_non_nullable
as FieldOfStudy,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,educationStatus: null == educationStatus ? _self.educationStatus : educationStatus // ignore: cast_nullable_to_non_nullable
as EducationStatus,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeeEducationModel].
extension EmployeeEducationModelPatterns on EmployeeEducationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeEducationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeEducationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeEducationModel value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeEducationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeEducationModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeEducationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? educationId,  String employeeId,  EducationLevel educationLevel,  EthiopianUniversity university,  String? cgpa,  FieldOfStudy fieldOfStudy,  DateTime startDate,  DateTime? endDate,  EducationStatus educationStatus,  String? entryBy,  DateTime? entryDate,  bool isApproved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeEducationModel() when $default != null:
return $default(_that.educationId,_that.employeeId,_that.educationLevel,_that.university,_that.cgpa,_that.fieldOfStudy,_that.startDate,_that.endDate,_that.educationStatus,_that.entryBy,_that.entryDate,_that.isApproved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? educationId,  String employeeId,  EducationLevel educationLevel,  EthiopianUniversity university,  String? cgpa,  FieldOfStudy fieldOfStudy,  DateTime startDate,  DateTime? endDate,  EducationStatus educationStatus,  String? entryBy,  DateTime? entryDate,  bool isApproved)  $default,) {final _that = this;
switch (_that) {
case _EmployeeEducationModel():
return $default(_that.educationId,_that.employeeId,_that.educationLevel,_that.university,_that.cgpa,_that.fieldOfStudy,_that.startDate,_that.endDate,_that.educationStatus,_that.entryBy,_that.entryDate,_that.isApproved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? educationId,  String employeeId,  EducationLevel educationLevel,  EthiopianUniversity university,  String? cgpa,  FieldOfStudy fieldOfStudy,  DateTime startDate,  DateTime? endDate,  EducationStatus educationStatus,  String? entryBy,  DateTime? entryDate,  bool isApproved)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeEducationModel() when $default != null:
return $default(_that.educationId,_that.employeeId,_that.educationLevel,_that.university,_that.cgpa,_that.fieldOfStudy,_that.startDate,_that.endDate,_that.educationStatus,_that.entryBy,_that.entryDate,_that.isApproved);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmployeeEducationModel implements EmployeeEducationModel {
  const _EmployeeEducationModel({this.educationId, required this.employeeId, required this.educationLevel, required this.university, this.cgpa, required this.fieldOfStudy, required this.startDate, this.endDate, required this.educationStatus, this.entryBy, this.entryDate, this.isApproved = false});
  factory _EmployeeEducationModel.fromJson(Map<String, dynamic> json) => _$EmployeeEducationModelFromJson(json);

@override final  String? educationId;
@override final  String employeeId;
// C# has 'string? Education'. Using EducationLevel enum for type safety in Dart.
// If backend JSON strictly uses string for 'Education', a JsonConverter will be needed.
@override final  EducationLevel educationLevel;
@override final  EthiopianUniversity university;
@override final  String? cgpa;
@override final  FieldOfStudy fieldOfStudy;
@override final  DateTime startDate;
@override final  DateTime? endDate;
@override final  EducationStatus educationStatus;
@override final  String? entryBy;
// C# is 'string? EntryBy' but marked [Required]
@override final  DateTime? entryDate;
// C# is 'DateTime EntryDate', made nullable
@override@JsonKey() final  bool isApproved;

/// Create a copy of EmployeeEducationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeEducationModelCopyWith<_EmployeeEducationModel> get copyWith => __$EmployeeEducationModelCopyWithImpl<_EmployeeEducationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeEducationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeEducationModel&&(identical(other.educationId, educationId) || other.educationId == educationId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.university, university) || other.university == university)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.fieldOfStudy, fieldOfStudy) || other.fieldOfStudy == fieldOfStudy)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.educationStatus, educationStatus) || other.educationStatus == educationStatus)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,educationId,employeeId,educationLevel,university,cgpa,fieldOfStudy,startDate,endDate,educationStatus,entryBy,entryDate,isApproved);

@override
String toString() {
  return 'EmployeeEducationModel(educationId: $educationId, employeeId: $employeeId, educationLevel: $educationLevel, university: $university, cgpa: $cgpa, fieldOfStudy: $fieldOfStudy, startDate: $startDate, endDate: $endDate, educationStatus: $educationStatus, entryBy: $entryBy, entryDate: $entryDate, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class _$EmployeeEducationModelCopyWith<$Res> implements $EmployeeEducationModelCopyWith<$Res> {
  factory _$EmployeeEducationModelCopyWith(_EmployeeEducationModel value, $Res Function(_EmployeeEducationModel) _then) = __$EmployeeEducationModelCopyWithImpl;
@override @useResult
$Res call({
 String? educationId, String employeeId, EducationLevel educationLevel, EthiopianUniversity university, String? cgpa, FieldOfStudy fieldOfStudy, DateTime startDate, DateTime? endDate, EducationStatus educationStatus, String? entryBy, DateTime? entryDate, bool isApproved
});




}
/// @nodoc
class __$EmployeeEducationModelCopyWithImpl<$Res>
    implements _$EmployeeEducationModelCopyWith<$Res> {
  __$EmployeeEducationModelCopyWithImpl(this._self, this._then);

  final _EmployeeEducationModel _self;
  final $Res Function(_EmployeeEducationModel) _then;

/// Create a copy of EmployeeEducationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? educationId = freezed,Object? employeeId = null,Object? educationLevel = null,Object? university = null,Object? cgpa = freezed,Object? fieldOfStudy = null,Object? startDate = null,Object? endDate = freezed,Object? educationStatus = null,Object? entryBy = freezed,Object? entryDate = freezed,Object? isApproved = null,}) {
  return _then(_EmployeeEducationModel(
educationId: freezed == educationId ? _self.educationId : educationId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as EducationLevel,university: null == university ? _self.university : university // ignore: cast_nullable_to_non_nullable
as EthiopianUniversity,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,fieldOfStudy: null == fieldOfStudy ? _self.fieldOfStudy : fieldOfStudy // ignore: cast_nullable_to_non_nullable
as FieldOfStudy,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,educationStatus: null == educationStatus ? _self.educationStatus : educationStatus // ignore: cast_nullable_to_non_nullable
as EducationStatus,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
