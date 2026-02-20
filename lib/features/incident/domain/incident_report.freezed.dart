// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidentReport {

 int get id; String get reportedById; DateTime get incidentDate; IncidentType get incidentType; String get description; IncidentStatus get status; List<String>? get involvedParties; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of IncidentReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentReportCopyWith<IncidentReport> get copyWith => _$IncidentReportCopyWithImpl<IncidentReport>(this as IncidentReport, _$identity);

  /// Serializes this IncidentReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentReport&&(identical(other.id, id) || other.id == id)&&(identical(other.reportedById, reportedById) || other.reportedById == reportedById)&&(identical(other.incidentDate, incidentDate) || other.incidentDate == incidentDate)&&(identical(other.incidentType, incidentType) || other.incidentType == incidentType)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.involvedParties, involvedParties)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportedById,incidentDate,incidentType,description,status,const DeepCollectionEquality().hash(involvedParties),createdAt,updatedAt);

@override
String toString() {
  return 'IncidentReport(id: $id, reportedById: $reportedById, incidentDate: $incidentDate, incidentType: $incidentType, description: $description, status: $status, involvedParties: $involvedParties, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $IncidentReportCopyWith<$Res>  {
  factory $IncidentReportCopyWith(IncidentReport value, $Res Function(IncidentReport) _then) = _$IncidentReportCopyWithImpl;
@useResult
$Res call({
 int id, String reportedById, DateTime incidentDate, IncidentType incidentType, String description, IncidentStatus status, List<String>? involvedParties, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$IncidentReportCopyWithImpl<$Res>
    implements $IncidentReportCopyWith<$Res> {
  _$IncidentReportCopyWithImpl(this._self, this._then);

  final IncidentReport _self;
  final $Res Function(IncidentReport) _then;

/// Create a copy of IncidentReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reportedById = null,Object? incidentDate = null,Object? incidentType = null,Object? description = null,Object? status = null,Object? involvedParties = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportedById: null == reportedById ? _self.reportedById : reportedById // ignore: cast_nullable_to_non_nullable
as String,incidentDate: null == incidentDate ? _self.incidentDate : incidentDate // ignore: cast_nullable_to_non_nullable
as DateTime,incidentType: null == incidentType ? _self.incidentType : incidentType // ignore: cast_nullable_to_non_nullable
as IncidentType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,involvedParties: freezed == involvedParties ? _self.involvedParties : involvedParties // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentReport].
extension IncidentReportPatterns on IncidentReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentReport value)  $default,){
final _that = this;
switch (_that) {
case _IncidentReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentReport value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String reportedById,  DateTime incidentDate,  IncidentType incidentType,  String description,  IncidentStatus status,  List<String>? involvedParties,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentReport() when $default != null:
return $default(_that.id,_that.reportedById,_that.incidentDate,_that.incidentType,_that.description,_that.status,_that.involvedParties,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String reportedById,  DateTime incidentDate,  IncidentType incidentType,  String description,  IncidentStatus status,  List<String>? involvedParties,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _IncidentReport():
return $default(_that.id,_that.reportedById,_that.incidentDate,_that.incidentType,_that.description,_that.status,_that.involvedParties,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String reportedById,  DateTime incidentDate,  IncidentType incidentType,  String description,  IncidentStatus status,  List<String>? involvedParties,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _IncidentReport() when $default != null:
return $default(_that.id,_that.reportedById,_that.incidentDate,_that.incidentType,_that.description,_that.status,_that.involvedParties,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidentReport implements IncidentReport {
  const _IncidentReport({required this.id, required this.reportedById, required this.incidentDate, required this.incidentType, required this.description, required this.status, final  List<String>? involvedParties, required this.createdAt, required this.updatedAt}): _involvedParties = involvedParties;
  factory _IncidentReport.fromJson(Map<String, dynamic> json) => _$IncidentReportFromJson(json);

@override final  int id;
@override final  String reportedById;
@override final  DateTime incidentDate;
@override final  IncidentType incidentType;
@override final  String description;
@override final  IncidentStatus status;
 final  List<String>? _involvedParties;
@override List<String>? get involvedParties {
  final value = _involvedParties;
  if (value == null) return null;
  if (_involvedParties is EqualUnmodifiableListView) return _involvedParties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of IncidentReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentReportCopyWith<_IncidentReport> get copyWith => __$IncidentReportCopyWithImpl<_IncidentReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentReport&&(identical(other.id, id) || other.id == id)&&(identical(other.reportedById, reportedById) || other.reportedById == reportedById)&&(identical(other.incidentDate, incidentDate) || other.incidentDate == incidentDate)&&(identical(other.incidentType, incidentType) || other.incidentType == incidentType)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._involvedParties, _involvedParties)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportedById,incidentDate,incidentType,description,status,const DeepCollectionEquality().hash(_involvedParties),createdAt,updatedAt);

@override
String toString() {
  return 'IncidentReport(id: $id, reportedById: $reportedById, incidentDate: $incidentDate, incidentType: $incidentType, description: $description, status: $status, involvedParties: $involvedParties, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$IncidentReportCopyWith<$Res> implements $IncidentReportCopyWith<$Res> {
  factory _$IncidentReportCopyWith(_IncidentReport value, $Res Function(_IncidentReport) _then) = __$IncidentReportCopyWithImpl;
@override @useResult
$Res call({
 int id, String reportedById, DateTime incidentDate, IncidentType incidentType, String description, IncidentStatus status, List<String>? involvedParties, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$IncidentReportCopyWithImpl<$Res>
    implements _$IncidentReportCopyWith<$Res> {
  __$IncidentReportCopyWithImpl(this._self, this._then);

  final _IncidentReport _self;
  final $Res Function(_IncidentReport) _then;

/// Create a copy of IncidentReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reportedById = null,Object? incidentDate = null,Object? incidentType = null,Object? description = null,Object? status = null,Object? involvedParties = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_IncidentReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportedById: null == reportedById ? _self.reportedById : reportedById // ignore: cast_nullable_to_non_nullable
as String,incidentDate: null == incidentDate ? _self.incidentDate : incidentDate // ignore: cast_nullable_to_non_nullable
as DateTime,incidentType: null == incidentType ? _self.incidentType : incidentType // ignore: cast_nullable_to_non_nullable
as IncidentType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,involvedParties: freezed == involvedParties ? _self._involvedParties : involvedParties // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
