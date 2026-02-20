// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicant_evaluation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApplicantEvaluation {

 int get selectionId; String get employeeId; double? get performanceScore; double? get performanceExpectation; double? get serviceScore; double? get serviceExpectation; double? get educationScore; double? get educationExpectation; double? get trainingRelevanceScore; double? get trainingRelevanceExpectation; double? get ageScore; double? get ageExpectation; double? get profileQualityScore; double? get profileQualityExpectation; double? get affirmativeScore; Gender? get affirmativeExpectation; bool get hasPriority; double get totalScore; String get comments; ApplicantStatus? get evaluationStatus; String get enteredBy; DateTime get entryDate; ApplicantSelection? get selectedApplicant; bool get meetsMinimumRequirements; double get calculateWeightedTotal;
/// Create a copy of ApplicantEvaluation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicantEvaluationCopyWith<ApplicantEvaluation> get copyWith => _$ApplicantEvaluationCopyWithImpl<ApplicantEvaluation>(this as ApplicantEvaluation, _$identity);

  /// Serializes this ApplicantEvaluation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicantEvaluation&&(identical(other.selectionId, selectionId) || other.selectionId == selectionId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.performanceScore, performanceScore) || other.performanceScore == performanceScore)&&(identical(other.performanceExpectation, performanceExpectation) || other.performanceExpectation == performanceExpectation)&&(identical(other.serviceScore, serviceScore) || other.serviceScore == serviceScore)&&(identical(other.serviceExpectation, serviceExpectation) || other.serviceExpectation == serviceExpectation)&&(identical(other.educationScore, educationScore) || other.educationScore == educationScore)&&(identical(other.educationExpectation, educationExpectation) || other.educationExpectation == educationExpectation)&&(identical(other.trainingRelevanceScore, trainingRelevanceScore) || other.trainingRelevanceScore == trainingRelevanceScore)&&(identical(other.trainingRelevanceExpectation, trainingRelevanceExpectation) || other.trainingRelevanceExpectation == trainingRelevanceExpectation)&&(identical(other.ageScore, ageScore) || other.ageScore == ageScore)&&(identical(other.ageExpectation, ageExpectation) || other.ageExpectation == ageExpectation)&&(identical(other.profileQualityScore, profileQualityScore) || other.profileQualityScore == profileQualityScore)&&(identical(other.profileQualityExpectation, profileQualityExpectation) || other.profileQualityExpectation == profileQualityExpectation)&&(identical(other.affirmativeScore, affirmativeScore) || other.affirmativeScore == affirmativeScore)&&(identical(other.affirmativeExpectation, affirmativeExpectation) || other.affirmativeExpectation == affirmativeExpectation)&&(identical(other.hasPriority, hasPriority) || other.hasPriority == hasPriority)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.evaluationStatus, evaluationStatus) || other.evaluationStatus == evaluationStatus)&&(identical(other.enteredBy, enteredBy) || other.enteredBy == enteredBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.selectedApplicant, selectedApplicant) || other.selectedApplicant == selectedApplicant)&&(identical(other.meetsMinimumRequirements, meetsMinimumRequirements) || other.meetsMinimumRequirements == meetsMinimumRequirements)&&(identical(other.calculateWeightedTotal, calculateWeightedTotal) || other.calculateWeightedTotal == calculateWeightedTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,selectionId,employeeId,performanceScore,performanceExpectation,serviceScore,serviceExpectation,educationScore,educationExpectation,trainingRelevanceScore,trainingRelevanceExpectation,ageScore,ageExpectation,profileQualityScore,profileQualityExpectation,affirmativeScore,affirmativeExpectation,hasPriority,totalScore,comments,evaluationStatus,enteredBy,entryDate,selectedApplicant,meetsMinimumRequirements,calculateWeightedTotal]);

@override
String toString() {
  return 'ApplicantEvaluation(selectionId: $selectionId, employeeId: $employeeId, performanceScore: $performanceScore, performanceExpectation: $performanceExpectation, serviceScore: $serviceScore, serviceExpectation: $serviceExpectation, educationScore: $educationScore, educationExpectation: $educationExpectation, trainingRelevanceScore: $trainingRelevanceScore, trainingRelevanceExpectation: $trainingRelevanceExpectation, ageScore: $ageScore, ageExpectation: $ageExpectation, profileQualityScore: $profileQualityScore, profileQualityExpectation: $profileQualityExpectation, affirmativeScore: $affirmativeScore, affirmativeExpectation: $affirmativeExpectation, hasPriority: $hasPriority, totalScore: $totalScore, comments: $comments, evaluationStatus: $evaluationStatus, enteredBy: $enteredBy, entryDate: $entryDate, selectedApplicant: $selectedApplicant, meetsMinimumRequirements: $meetsMinimumRequirements, calculateWeightedTotal: $calculateWeightedTotal)';
}


}

/// @nodoc
abstract mixin class $ApplicantEvaluationCopyWith<$Res>  {
  factory $ApplicantEvaluationCopyWith(ApplicantEvaluation value, $Res Function(ApplicantEvaluation) _then) = _$ApplicantEvaluationCopyWithImpl;
@useResult
$Res call({
 int selectionId, String employeeId, double? performanceScore, double? performanceExpectation, double? serviceScore, double? serviceExpectation, double? educationScore, double? educationExpectation, double? trainingRelevanceScore, double? trainingRelevanceExpectation, double? ageScore, double? ageExpectation, double? profileQualityScore, double? profileQualityExpectation, double? affirmativeScore, Gender? affirmativeExpectation, bool hasPriority, double totalScore, String comments, ApplicantStatus? evaluationStatus, String enteredBy, DateTime entryDate, ApplicantSelection? selectedApplicant, bool meetsMinimumRequirements, double calculateWeightedTotal
});


$ApplicantSelectionCopyWith<$Res>? get selectedApplicant;

}
/// @nodoc
class _$ApplicantEvaluationCopyWithImpl<$Res>
    implements $ApplicantEvaluationCopyWith<$Res> {
  _$ApplicantEvaluationCopyWithImpl(this._self, this._then);

  final ApplicantEvaluation _self;
  final $Res Function(ApplicantEvaluation) _then;

/// Create a copy of ApplicantEvaluation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectionId = null,Object? employeeId = null,Object? performanceScore = freezed,Object? performanceExpectation = freezed,Object? serviceScore = freezed,Object? serviceExpectation = freezed,Object? educationScore = freezed,Object? educationExpectation = freezed,Object? trainingRelevanceScore = freezed,Object? trainingRelevanceExpectation = freezed,Object? ageScore = freezed,Object? ageExpectation = freezed,Object? profileQualityScore = freezed,Object? profileQualityExpectation = freezed,Object? affirmativeScore = freezed,Object? affirmativeExpectation = freezed,Object? hasPriority = null,Object? totalScore = null,Object? comments = null,Object? evaluationStatus = freezed,Object? enteredBy = null,Object? entryDate = null,Object? selectedApplicant = freezed,Object? meetsMinimumRequirements = null,Object? calculateWeightedTotal = null,}) {
  return _then(_self.copyWith(
selectionId: null == selectionId ? _self.selectionId : selectionId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,performanceScore: freezed == performanceScore ? _self.performanceScore : performanceScore // ignore: cast_nullable_to_non_nullable
as double?,performanceExpectation: freezed == performanceExpectation ? _self.performanceExpectation : performanceExpectation // ignore: cast_nullable_to_non_nullable
as double?,serviceScore: freezed == serviceScore ? _self.serviceScore : serviceScore // ignore: cast_nullable_to_non_nullable
as double?,serviceExpectation: freezed == serviceExpectation ? _self.serviceExpectation : serviceExpectation // ignore: cast_nullable_to_non_nullable
as double?,educationScore: freezed == educationScore ? _self.educationScore : educationScore // ignore: cast_nullable_to_non_nullable
as double?,educationExpectation: freezed == educationExpectation ? _self.educationExpectation : educationExpectation // ignore: cast_nullable_to_non_nullable
as double?,trainingRelevanceScore: freezed == trainingRelevanceScore ? _self.trainingRelevanceScore : trainingRelevanceScore // ignore: cast_nullable_to_non_nullable
as double?,trainingRelevanceExpectation: freezed == trainingRelevanceExpectation ? _self.trainingRelevanceExpectation : trainingRelevanceExpectation // ignore: cast_nullable_to_non_nullable
as double?,ageScore: freezed == ageScore ? _self.ageScore : ageScore // ignore: cast_nullable_to_non_nullable
as double?,ageExpectation: freezed == ageExpectation ? _self.ageExpectation : ageExpectation // ignore: cast_nullable_to_non_nullable
as double?,profileQualityScore: freezed == profileQualityScore ? _self.profileQualityScore : profileQualityScore // ignore: cast_nullable_to_non_nullable
as double?,profileQualityExpectation: freezed == profileQualityExpectation ? _self.profileQualityExpectation : profileQualityExpectation // ignore: cast_nullable_to_non_nullable
as double?,affirmativeScore: freezed == affirmativeScore ? _self.affirmativeScore : affirmativeScore // ignore: cast_nullable_to_non_nullable
as double?,affirmativeExpectation: freezed == affirmativeExpectation ? _self.affirmativeExpectation : affirmativeExpectation // ignore: cast_nullable_to_non_nullable
as Gender?,hasPriority: null == hasPriority ? _self.hasPriority : hasPriority // ignore: cast_nullable_to_non_nullable
as bool,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as double,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String,evaluationStatus: freezed == evaluationStatus ? _self.evaluationStatus : evaluationStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,enteredBy: null == enteredBy ? _self.enteredBy : enteredBy // ignore: cast_nullable_to_non_nullable
as String,entryDate: null == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime,selectedApplicant: freezed == selectedApplicant ? _self.selectedApplicant : selectedApplicant // ignore: cast_nullable_to_non_nullable
as ApplicantSelection?,meetsMinimumRequirements: null == meetsMinimumRequirements ? _self.meetsMinimumRequirements : meetsMinimumRequirements // ignore: cast_nullable_to_non_nullable
as bool,calculateWeightedTotal: null == calculateWeightedTotal ? _self.calculateWeightedTotal : calculateWeightedTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of ApplicantEvaluation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantSelectionCopyWith<$Res>? get selectedApplicant {
    if (_self.selectedApplicant == null) {
    return null;
  }

  return $ApplicantSelectionCopyWith<$Res>(_self.selectedApplicant!, (value) {
    return _then(_self.copyWith(selectedApplicant: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplicantEvaluation].
extension ApplicantEvaluationPatterns on ApplicantEvaluation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicantEvaluation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicantEvaluation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicantEvaluation value)  $default,){
final _that = this;
switch (_that) {
case _ApplicantEvaluation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicantEvaluation value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicantEvaluation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectionId,  String employeeId,  double? performanceScore,  double? performanceExpectation,  double? serviceScore,  double? serviceExpectation,  double? educationScore,  double? educationExpectation,  double? trainingRelevanceScore,  double? trainingRelevanceExpectation,  double? ageScore,  double? ageExpectation,  double? profileQualityScore,  double? profileQualityExpectation,  double? affirmativeScore,  Gender? affirmativeExpectation,  bool hasPriority,  double totalScore,  String comments,  ApplicantStatus? evaluationStatus,  String enteredBy,  DateTime entryDate,  ApplicantSelection? selectedApplicant,  bool meetsMinimumRequirements,  double calculateWeightedTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicantEvaluation() when $default != null:
return $default(_that.selectionId,_that.employeeId,_that.performanceScore,_that.performanceExpectation,_that.serviceScore,_that.serviceExpectation,_that.educationScore,_that.educationExpectation,_that.trainingRelevanceScore,_that.trainingRelevanceExpectation,_that.ageScore,_that.ageExpectation,_that.profileQualityScore,_that.profileQualityExpectation,_that.affirmativeScore,_that.affirmativeExpectation,_that.hasPriority,_that.totalScore,_that.comments,_that.evaluationStatus,_that.enteredBy,_that.entryDate,_that.selectedApplicant,_that.meetsMinimumRequirements,_that.calculateWeightedTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectionId,  String employeeId,  double? performanceScore,  double? performanceExpectation,  double? serviceScore,  double? serviceExpectation,  double? educationScore,  double? educationExpectation,  double? trainingRelevanceScore,  double? trainingRelevanceExpectation,  double? ageScore,  double? ageExpectation,  double? profileQualityScore,  double? profileQualityExpectation,  double? affirmativeScore,  Gender? affirmativeExpectation,  bool hasPriority,  double totalScore,  String comments,  ApplicantStatus? evaluationStatus,  String enteredBy,  DateTime entryDate,  ApplicantSelection? selectedApplicant,  bool meetsMinimumRequirements,  double calculateWeightedTotal)  $default,) {final _that = this;
switch (_that) {
case _ApplicantEvaluation():
return $default(_that.selectionId,_that.employeeId,_that.performanceScore,_that.performanceExpectation,_that.serviceScore,_that.serviceExpectation,_that.educationScore,_that.educationExpectation,_that.trainingRelevanceScore,_that.trainingRelevanceExpectation,_that.ageScore,_that.ageExpectation,_that.profileQualityScore,_that.profileQualityExpectation,_that.affirmativeScore,_that.affirmativeExpectation,_that.hasPriority,_that.totalScore,_that.comments,_that.evaluationStatus,_that.enteredBy,_that.entryDate,_that.selectedApplicant,_that.meetsMinimumRequirements,_that.calculateWeightedTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectionId,  String employeeId,  double? performanceScore,  double? performanceExpectation,  double? serviceScore,  double? serviceExpectation,  double? educationScore,  double? educationExpectation,  double? trainingRelevanceScore,  double? trainingRelevanceExpectation,  double? ageScore,  double? ageExpectation,  double? profileQualityScore,  double? profileQualityExpectation,  double? affirmativeScore,  Gender? affirmativeExpectation,  bool hasPriority,  double totalScore,  String comments,  ApplicantStatus? evaluationStatus,  String enteredBy,  DateTime entryDate,  ApplicantSelection? selectedApplicant,  bool meetsMinimumRequirements,  double calculateWeightedTotal)?  $default,) {final _that = this;
switch (_that) {
case _ApplicantEvaluation() when $default != null:
return $default(_that.selectionId,_that.employeeId,_that.performanceScore,_that.performanceExpectation,_that.serviceScore,_that.serviceExpectation,_that.educationScore,_that.educationExpectation,_that.trainingRelevanceScore,_that.trainingRelevanceExpectation,_that.ageScore,_that.ageExpectation,_that.profileQualityScore,_that.profileQualityExpectation,_that.affirmativeScore,_that.affirmativeExpectation,_that.hasPriority,_that.totalScore,_that.comments,_that.evaluationStatus,_that.enteredBy,_that.entryDate,_that.selectedApplicant,_that.meetsMinimumRequirements,_that.calculateWeightedTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplicantEvaluation implements ApplicantEvaluation {
   _ApplicantEvaluation({required this.selectionId, required this.employeeId, this.performanceScore, this.performanceExpectation, this.serviceScore, this.serviceExpectation, this.educationScore, this.educationExpectation, this.trainingRelevanceScore, this.trainingRelevanceExpectation, this.ageScore, this.ageExpectation, this.profileQualityScore, this.profileQualityExpectation, this.affirmativeScore, this.affirmativeExpectation, this.hasPriority = false, this.totalScore = 0.0, this.comments = '', this.evaluationStatus, required this.enteredBy, required this.entryDate, this.selectedApplicant, this.meetsMinimumRequirements = false, this.calculateWeightedTotal = 0.0});
  factory _ApplicantEvaluation.fromJson(Map<String, dynamic> json) => _$ApplicantEvaluationFromJson(json);

@override final  int selectionId;
@override final  String employeeId;
@override final  double? performanceScore;
@override final  double? performanceExpectation;
@override final  double? serviceScore;
@override final  double? serviceExpectation;
@override final  double? educationScore;
@override final  double? educationExpectation;
@override final  double? trainingRelevanceScore;
@override final  double? trainingRelevanceExpectation;
@override final  double? ageScore;
@override final  double? ageExpectation;
@override final  double? profileQualityScore;
@override final  double? profileQualityExpectation;
@override final  double? affirmativeScore;
@override final  Gender? affirmativeExpectation;
@override@JsonKey() final  bool hasPriority;
@override@JsonKey() final  double totalScore;
@override@JsonKey() final  String comments;
@override final  ApplicantStatus? evaluationStatus;
@override final  String enteredBy;
@override final  DateTime entryDate;
@override final  ApplicantSelection? selectedApplicant;
@override@JsonKey() final  bool meetsMinimumRequirements;
@override@JsonKey() final  double calculateWeightedTotal;

/// Create a copy of ApplicantEvaluation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicantEvaluationCopyWith<_ApplicantEvaluation> get copyWith => __$ApplicantEvaluationCopyWithImpl<_ApplicantEvaluation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicantEvaluationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicantEvaluation&&(identical(other.selectionId, selectionId) || other.selectionId == selectionId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.performanceScore, performanceScore) || other.performanceScore == performanceScore)&&(identical(other.performanceExpectation, performanceExpectation) || other.performanceExpectation == performanceExpectation)&&(identical(other.serviceScore, serviceScore) || other.serviceScore == serviceScore)&&(identical(other.serviceExpectation, serviceExpectation) || other.serviceExpectation == serviceExpectation)&&(identical(other.educationScore, educationScore) || other.educationScore == educationScore)&&(identical(other.educationExpectation, educationExpectation) || other.educationExpectation == educationExpectation)&&(identical(other.trainingRelevanceScore, trainingRelevanceScore) || other.trainingRelevanceScore == trainingRelevanceScore)&&(identical(other.trainingRelevanceExpectation, trainingRelevanceExpectation) || other.trainingRelevanceExpectation == trainingRelevanceExpectation)&&(identical(other.ageScore, ageScore) || other.ageScore == ageScore)&&(identical(other.ageExpectation, ageExpectation) || other.ageExpectation == ageExpectation)&&(identical(other.profileQualityScore, profileQualityScore) || other.profileQualityScore == profileQualityScore)&&(identical(other.profileQualityExpectation, profileQualityExpectation) || other.profileQualityExpectation == profileQualityExpectation)&&(identical(other.affirmativeScore, affirmativeScore) || other.affirmativeScore == affirmativeScore)&&(identical(other.affirmativeExpectation, affirmativeExpectation) || other.affirmativeExpectation == affirmativeExpectation)&&(identical(other.hasPriority, hasPriority) || other.hasPriority == hasPriority)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.evaluationStatus, evaluationStatus) || other.evaluationStatus == evaluationStatus)&&(identical(other.enteredBy, enteredBy) || other.enteredBy == enteredBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.selectedApplicant, selectedApplicant) || other.selectedApplicant == selectedApplicant)&&(identical(other.meetsMinimumRequirements, meetsMinimumRequirements) || other.meetsMinimumRequirements == meetsMinimumRequirements)&&(identical(other.calculateWeightedTotal, calculateWeightedTotal) || other.calculateWeightedTotal == calculateWeightedTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,selectionId,employeeId,performanceScore,performanceExpectation,serviceScore,serviceExpectation,educationScore,educationExpectation,trainingRelevanceScore,trainingRelevanceExpectation,ageScore,ageExpectation,profileQualityScore,profileQualityExpectation,affirmativeScore,affirmativeExpectation,hasPriority,totalScore,comments,evaluationStatus,enteredBy,entryDate,selectedApplicant,meetsMinimumRequirements,calculateWeightedTotal]);

@override
String toString() {
  return 'ApplicantEvaluation(selectionId: $selectionId, employeeId: $employeeId, performanceScore: $performanceScore, performanceExpectation: $performanceExpectation, serviceScore: $serviceScore, serviceExpectation: $serviceExpectation, educationScore: $educationScore, educationExpectation: $educationExpectation, trainingRelevanceScore: $trainingRelevanceScore, trainingRelevanceExpectation: $trainingRelevanceExpectation, ageScore: $ageScore, ageExpectation: $ageExpectation, profileQualityScore: $profileQualityScore, profileQualityExpectation: $profileQualityExpectation, affirmativeScore: $affirmativeScore, affirmativeExpectation: $affirmativeExpectation, hasPriority: $hasPriority, totalScore: $totalScore, comments: $comments, evaluationStatus: $evaluationStatus, enteredBy: $enteredBy, entryDate: $entryDate, selectedApplicant: $selectedApplicant, meetsMinimumRequirements: $meetsMinimumRequirements, calculateWeightedTotal: $calculateWeightedTotal)';
}


}

/// @nodoc
abstract mixin class _$ApplicantEvaluationCopyWith<$Res> implements $ApplicantEvaluationCopyWith<$Res> {
  factory _$ApplicantEvaluationCopyWith(_ApplicantEvaluation value, $Res Function(_ApplicantEvaluation) _then) = __$ApplicantEvaluationCopyWithImpl;
@override @useResult
$Res call({
 int selectionId, String employeeId, double? performanceScore, double? performanceExpectation, double? serviceScore, double? serviceExpectation, double? educationScore, double? educationExpectation, double? trainingRelevanceScore, double? trainingRelevanceExpectation, double? ageScore, double? ageExpectation, double? profileQualityScore, double? profileQualityExpectation, double? affirmativeScore, Gender? affirmativeExpectation, bool hasPriority, double totalScore, String comments, ApplicantStatus? evaluationStatus, String enteredBy, DateTime entryDate, ApplicantSelection? selectedApplicant, bool meetsMinimumRequirements, double calculateWeightedTotal
});


@override $ApplicantSelectionCopyWith<$Res>? get selectedApplicant;

}
/// @nodoc
class __$ApplicantEvaluationCopyWithImpl<$Res>
    implements _$ApplicantEvaluationCopyWith<$Res> {
  __$ApplicantEvaluationCopyWithImpl(this._self, this._then);

  final _ApplicantEvaluation _self;
  final $Res Function(_ApplicantEvaluation) _then;

/// Create a copy of ApplicantEvaluation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectionId = null,Object? employeeId = null,Object? performanceScore = freezed,Object? performanceExpectation = freezed,Object? serviceScore = freezed,Object? serviceExpectation = freezed,Object? educationScore = freezed,Object? educationExpectation = freezed,Object? trainingRelevanceScore = freezed,Object? trainingRelevanceExpectation = freezed,Object? ageScore = freezed,Object? ageExpectation = freezed,Object? profileQualityScore = freezed,Object? profileQualityExpectation = freezed,Object? affirmativeScore = freezed,Object? affirmativeExpectation = freezed,Object? hasPriority = null,Object? totalScore = null,Object? comments = null,Object? evaluationStatus = freezed,Object? enteredBy = null,Object? entryDate = null,Object? selectedApplicant = freezed,Object? meetsMinimumRequirements = null,Object? calculateWeightedTotal = null,}) {
  return _then(_ApplicantEvaluation(
selectionId: null == selectionId ? _self.selectionId : selectionId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,performanceScore: freezed == performanceScore ? _self.performanceScore : performanceScore // ignore: cast_nullable_to_non_nullable
as double?,performanceExpectation: freezed == performanceExpectation ? _self.performanceExpectation : performanceExpectation // ignore: cast_nullable_to_non_nullable
as double?,serviceScore: freezed == serviceScore ? _self.serviceScore : serviceScore // ignore: cast_nullable_to_non_nullable
as double?,serviceExpectation: freezed == serviceExpectation ? _self.serviceExpectation : serviceExpectation // ignore: cast_nullable_to_non_nullable
as double?,educationScore: freezed == educationScore ? _self.educationScore : educationScore // ignore: cast_nullable_to_non_nullable
as double?,educationExpectation: freezed == educationExpectation ? _self.educationExpectation : educationExpectation // ignore: cast_nullable_to_non_nullable
as double?,trainingRelevanceScore: freezed == trainingRelevanceScore ? _self.trainingRelevanceScore : trainingRelevanceScore // ignore: cast_nullable_to_non_nullable
as double?,trainingRelevanceExpectation: freezed == trainingRelevanceExpectation ? _self.trainingRelevanceExpectation : trainingRelevanceExpectation // ignore: cast_nullable_to_non_nullable
as double?,ageScore: freezed == ageScore ? _self.ageScore : ageScore // ignore: cast_nullable_to_non_nullable
as double?,ageExpectation: freezed == ageExpectation ? _self.ageExpectation : ageExpectation // ignore: cast_nullable_to_non_nullable
as double?,profileQualityScore: freezed == profileQualityScore ? _self.profileQualityScore : profileQualityScore // ignore: cast_nullable_to_non_nullable
as double?,profileQualityExpectation: freezed == profileQualityExpectation ? _self.profileQualityExpectation : profileQualityExpectation // ignore: cast_nullable_to_non_nullable
as double?,affirmativeScore: freezed == affirmativeScore ? _self.affirmativeScore : affirmativeScore // ignore: cast_nullable_to_non_nullable
as double?,affirmativeExpectation: freezed == affirmativeExpectation ? _self.affirmativeExpectation : affirmativeExpectation // ignore: cast_nullable_to_non_nullable
as Gender?,hasPriority: null == hasPriority ? _self.hasPriority : hasPriority // ignore: cast_nullable_to_non_nullable
as bool,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as double,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String,evaluationStatus: freezed == evaluationStatus ? _self.evaluationStatus : evaluationStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,enteredBy: null == enteredBy ? _self.enteredBy : enteredBy // ignore: cast_nullable_to_non_nullable
as String,entryDate: null == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime,selectedApplicant: freezed == selectedApplicant ? _self.selectedApplicant : selectedApplicant // ignore: cast_nullable_to_non_nullable
as ApplicantSelection?,meetsMinimumRequirements: null == meetsMinimumRequirements ? _self.meetsMinimumRequirements : meetsMinimumRequirements // ignore: cast_nullable_to_non_nullable
as bool,calculateWeightedTotal: null == calculateWeightedTotal ? _self.calculateWeightedTotal : calculateWeightedTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of ApplicantEvaluation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantSelectionCopyWith<$Res>? get selectedApplicant {
    if (_self.selectedApplicant == null) {
    return null;
  }

  return $ApplicantSelectionCopyWith<$Res>(_self.selectedApplicant!, (value) {
    return _then(_self.copyWith(selectedApplicant: value));
  });
}
}

// dart format on
