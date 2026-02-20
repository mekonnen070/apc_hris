// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_performance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeePerformanceModel {

 int get performanceId;// C# Key, assuming int. Default 0 if new.
 String get employeeId; int get scorePoint; int get rating;// C# has default calculation, providing a base default
 String? get comments; DateTime get evaluationDate;// C# has default DateTime.Today
 String get evaluatorName; String? get keyAchievements; String? get areasForImprovement; DateTime? get fromDate; DateTime? get toDate; DateTime? get nextEvaluationDate; String? get updateBy;// Audit
 DateTime? get updateDate;
/// Create a copy of EmployeePerformanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeePerformanceModelCopyWith<EmployeePerformanceModel> get copyWith => _$EmployeePerformanceModelCopyWithImpl<EmployeePerformanceModel>(this as EmployeePerformanceModel, _$identity);

  /// Serializes this EmployeePerformanceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeePerformanceModel&&(identical(other.performanceId, performanceId) || other.performanceId == performanceId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.scorePoint, scorePoint) || other.scorePoint == scorePoint)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.evaluationDate, evaluationDate) || other.evaluationDate == evaluationDate)&&(identical(other.evaluatorName, evaluatorName) || other.evaluatorName == evaluatorName)&&(identical(other.keyAchievements, keyAchievements) || other.keyAchievements == keyAchievements)&&(identical(other.areasForImprovement, areasForImprovement) || other.areasForImprovement == areasForImprovement)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.nextEvaluationDate, nextEvaluationDate) || other.nextEvaluationDate == nextEvaluationDate)&&(identical(other.updateBy, updateBy) || other.updateBy == updateBy)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,performanceId,employeeId,scorePoint,rating,comments,evaluationDate,evaluatorName,keyAchievements,areasForImprovement,fromDate,toDate,nextEvaluationDate,updateBy,updateDate);

@override
String toString() {
  return 'EmployeePerformanceModel(performanceId: $performanceId, employeeId: $employeeId, scorePoint: $scorePoint, rating: $rating, comments: $comments, evaluationDate: $evaluationDate, evaluatorName: $evaluatorName, keyAchievements: $keyAchievements, areasForImprovement: $areasForImprovement, fromDate: $fromDate, toDate: $toDate, nextEvaluationDate: $nextEvaluationDate, updateBy: $updateBy, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class $EmployeePerformanceModelCopyWith<$Res>  {
  factory $EmployeePerformanceModelCopyWith(EmployeePerformanceModel value, $Res Function(EmployeePerformanceModel) _then) = _$EmployeePerformanceModelCopyWithImpl;
@useResult
$Res call({
 int performanceId, String employeeId, int scorePoint, int rating, String? comments, DateTime evaluationDate, String evaluatorName, String? keyAchievements, String? areasForImprovement, DateTime? fromDate, DateTime? toDate, DateTime? nextEvaluationDate, String? updateBy, DateTime? updateDate
});




}
/// @nodoc
class _$EmployeePerformanceModelCopyWithImpl<$Res>
    implements $EmployeePerformanceModelCopyWith<$Res> {
  _$EmployeePerformanceModelCopyWithImpl(this._self, this._then);

  final EmployeePerformanceModel _self;
  final $Res Function(EmployeePerformanceModel) _then;

/// Create a copy of EmployeePerformanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? performanceId = null,Object? employeeId = null,Object? scorePoint = null,Object? rating = null,Object? comments = freezed,Object? evaluationDate = null,Object? evaluatorName = null,Object? keyAchievements = freezed,Object? areasForImprovement = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? nextEvaluationDate = freezed,Object? updateBy = freezed,Object? updateDate = freezed,}) {
  return _then(_self.copyWith(
performanceId: null == performanceId ? _self.performanceId : performanceId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,scorePoint: null == scorePoint ? _self.scorePoint : scorePoint // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,evaluationDate: null == evaluationDate ? _self.evaluationDate : evaluationDate // ignore: cast_nullable_to_non_nullable
as DateTime,evaluatorName: null == evaluatorName ? _self.evaluatorName : evaluatorName // ignore: cast_nullable_to_non_nullable
as String,keyAchievements: freezed == keyAchievements ? _self.keyAchievements : keyAchievements // ignore: cast_nullable_to_non_nullable
as String?,areasForImprovement: freezed == areasForImprovement ? _self.areasForImprovement : areasForImprovement // ignore: cast_nullable_to_non_nullable
as String?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextEvaluationDate: freezed == nextEvaluationDate ? _self.nextEvaluationDate : nextEvaluationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updateBy: freezed == updateBy ? _self.updateBy : updateBy // ignore: cast_nullable_to_non_nullable
as String?,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeePerformanceModel].
extension EmployeePerformanceModelPatterns on EmployeePerformanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeePerformanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeePerformanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeePerformanceModel value)  $default,){
final _that = this;
switch (_that) {
case _EmployeePerformanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeePerformanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeePerformanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int performanceId,  String employeeId,  int scorePoint,  int rating,  String? comments,  DateTime evaluationDate,  String evaluatorName,  String? keyAchievements,  String? areasForImprovement,  DateTime? fromDate,  DateTime? toDate,  DateTime? nextEvaluationDate,  String? updateBy,  DateTime? updateDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeePerformanceModel() when $default != null:
return $default(_that.performanceId,_that.employeeId,_that.scorePoint,_that.rating,_that.comments,_that.evaluationDate,_that.evaluatorName,_that.keyAchievements,_that.areasForImprovement,_that.fromDate,_that.toDate,_that.nextEvaluationDate,_that.updateBy,_that.updateDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int performanceId,  String employeeId,  int scorePoint,  int rating,  String? comments,  DateTime evaluationDate,  String evaluatorName,  String? keyAchievements,  String? areasForImprovement,  DateTime? fromDate,  DateTime? toDate,  DateTime? nextEvaluationDate,  String? updateBy,  DateTime? updateDate)  $default,) {final _that = this;
switch (_that) {
case _EmployeePerformanceModel():
return $default(_that.performanceId,_that.employeeId,_that.scorePoint,_that.rating,_that.comments,_that.evaluationDate,_that.evaluatorName,_that.keyAchievements,_that.areasForImprovement,_that.fromDate,_that.toDate,_that.nextEvaluationDate,_that.updateBy,_that.updateDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int performanceId,  String employeeId,  int scorePoint,  int rating,  String? comments,  DateTime evaluationDate,  String evaluatorName,  String? keyAchievements,  String? areasForImprovement,  DateTime? fromDate,  DateTime? toDate,  DateTime? nextEvaluationDate,  String? updateBy,  DateTime? updateDate)?  $default,) {final _that = this;
switch (_that) {
case _EmployeePerformanceModel() when $default != null:
return $default(_that.performanceId,_that.employeeId,_that.scorePoint,_that.rating,_that.comments,_that.evaluationDate,_that.evaluatorName,_that.keyAchievements,_that.areasForImprovement,_that.fromDate,_that.toDate,_that.nextEvaluationDate,_that.updateBy,_that.updateDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmployeePerformanceModel implements EmployeePerformanceModel {
  const _EmployeePerformanceModel({this.performanceId = 0, required this.employeeId, required this.scorePoint, this.rating = 1, this.comments, required this.evaluationDate, required this.evaluatorName, this.keyAchievements, this.areasForImprovement, this.fromDate, this.toDate, this.nextEvaluationDate, this.updateBy, this.updateDate});
  factory _EmployeePerformanceModel.fromJson(Map<String, dynamic> json) => _$EmployeePerformanceModelFromJson(json);

@override@JsonKey() final  int performanceId;
// C# Key, assuming int. Default 0 if new.
@override final  String employeeId;
@override final  int scorePoint;
@override@JsonKey() final  int rating;
// C# has default calculation, providing a base default
@override final  String? comments;
@override final  DateTime evaluationDate;
// C# has default DateTime.Today
@override final  String evaluatorName;
@override final  String? keyAchievements;
@override final  String? areasForImprovement;
@override final  DateTime? fromDate;
@override final  DateTime? toDate;
@override final  DateTime? nextEvaluationDate;
@override final  String? updateBy;
// Audit
@override final  DateTime? updateDate;

/// Create a copy of EmployeePerformanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeePerformanceModelCopyWith<_EmployeePerformanceModel> get copyWith => __$EmployeePerformanceModelCopyWithImpl<_EmployeePerformanceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeePerformanceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeePerformanceModel&&(identical(other.performanceId, performanceId) || other.performanceId == performanceId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.scorePoint, scorePoint) || other.scorePoint == scorePoint)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.evaluationDate, evaluationDate) || other.evaluationDate == evaluationDate)&&(identical(other.evaluatorName, evaluatorName) || other.evaluatorName == evaluatorName)&&(identical(other.keyAchievements, keyAchievements) || other.keyAchievements == keyAchievements)&&(identical(other.areasForImprovement, areasForImprovement) || other.areasForImprovement == areasForImprovement)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.nextEvaluationDate, nextEvaluationDate) || other.nextEvaluationDate == nextEvaluationDate)&&(identical(other.updateBy, updateBy) || other.updateBy == updateBy)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,performanceId,employeeId,scorePoint,rating,comments,evaluationDate,evaluatorName,keyAchievements,areasForImprovement,fromDate,toDate,nextEvaluationDate,updateBy,updateDate);

@override
String toString() {
  return 'EmployeePerformanceModel(performanceId: $performanceId, employeeId: $employeeId, scorePoint: $scorePoint, rating: $rating, comments: $comments, evaluationDate: $evaluationDate, evaluatorName: $evaluatorName, keyAchievements: $keyAchievements, areasForImprovement: $areasForImprovement, fromDate: $fromDate, toDate: $toDate, nextEvaluationDate: $nextEvaluationDate, updateBy: $updateBy, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class _$EmployeePerformanceModelCopyWith<$Res> implements $EmployeePerformanceModelCopyWith<$Res> {
  factory _$EmployeePerformanceModelCopyWith(_EmployeePerformanceModel value, $Res Function(_EmployeePerformanceModel) _then) = __$EmployeePerformanceModelCopyWithImpl;
@override @useResult
$Res call({
 int performanceId, String employeeId, int scorePoint, int rating, String? comments, DateTime evaluationDate, String evaluatorName, String? keyAchievements, String? areasForImprovement, DateTime? fromDate, DateTime? toDate, DateTime? nextEvaluationDate, String? updateBy, DateTime? updateDate
});




}
/// @nodoc
class __$EmployeePerformanceModelCopyWithImpl<$Res>
    implements _$EmployeePerformanceModelCopyWith<$Res> {
  __$EmployeePerformanceModelCopyWithImpl(this._self, this._then);

  final _EmployeePerformanceModel _self;
  final $Res Function(_EmployeePerformanceModel) _then;

/// Create a copy of EmployeePerformanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? performanceId = null,Object? employeeId = null,Object? scorePoint = null,Object? rating = null,Object? comments = freezed,Object? evaluationDate = null,Object? evaluatorName = null,Object? keyAchievements = freezed,Object? areasForImprovement = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? nextEvaluationDate = freezed,Object? updateBy = freezed,Object? updateDate = freezed,}) {
  return _then(_EmployeePerformanceModel(
performanceId: null == performanceId ? _self.performanceId : performanceId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,scorePoint: null == scorePoint ? _self.scorePoint : scorePoint // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,evaluationDate: null == evaluationDate ? _self.evaluationDate : evaluationDate // ignore: cast_nullable_to_non_nullable
as DateTime,evaluatorName: null == evaluatorName ? _self.evaluatorName : evaluatorName // ignore: cast_nullable_to_non_nullable
as String,keyAchievements: freezed == keyAchievements ? _self.keyAchievements : keyAchievements // ignore: cast_nullable_to_non_nullable
as String?,areasForImprovement: freezed == areasForImprovement ? _self.areasForImprovement : areasForImprovement // ignore: cast_nullable_to_non_nullable
as String?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextEvaluationDate: freezed == nextEvaluationDate ? _self.nextEvaluationDate : nextEvaluationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updateBy: freezed == updateBy ? _self.updateBy : updateBy // ignore: cast_nullable_to_non_nullable
as String?,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
