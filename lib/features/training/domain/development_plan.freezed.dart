// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'development_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DevelopmentPlan {

 String? get planId; String get planName; TrainingTypes get planType; String get planDescription; double get planCost; double get usedCost; Currency get planCurrency; DevelopmentSource get developmentSource; GeneralStatus get planStatus; String? get planEntryBy; DateTime? get planEntryDate;@JsonKey(includeFromJson: false, includeToJson: false) List<Training?> get trainingList;
/// Create a copy of DevelopmentPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevelopmentPlanCopyWith<DevelopmentPlan> get copyWith => _$DevelopmentPlanCopyWithImpl<DevelopmentPlan>(this as DevelopmentPlan, _$identity);

  /// Serializes this DevelopmentPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevelopmentPlan&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.planType, planType) || other.planType == planType)&&(identical(other.planDescription, planDescription) || other.planDescription == planDescription)&&(identical(other.planCost, planCost) || other.planCost == planCost)&&(identical(other.usedCost, usedCost) || other.usedCost == usedCost)&&(identical(other.planCurrency, planCurrency) || other.planCurrency == planCurrency)&&(identical(other.developmentSource, developmentSource) || other.developmentSource == developmentSource)&&(identical(other.planStatus, planStatus) || other.planStatus == planStatus)&&(identical(other.planEntryBy, planEntryBy) || other.planEntryBy == planEntryBy)&&(identical(other.planEntryDate, planEntryDate) || other.planEntryDate == planEntryDate)&&const DeepCollectionEquality().equals(other.trainingList, trainingList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,planId,planName,planType,planDescription,planCost,usedCost,planCurrency,developmentSource,planStatus,planEntryBy,planEntryDate,const DeepCollectionEquality().hash(trainingList));

@override
String toString() {
  return 'DevelopmentPlan(planId: $planId, planName: $planName, planType: $planType, planDescription: $planDescription, planCost: $planCost, usedCost: $usedCost, planCurrency: $planCurrency, developmentSource: $developmentSource, planStatus: $planStatus, planEntryBy: $planEntryBy, planEntryDate: $planEntryDate, trainingList: $trainingList)';
}


}

/// @nodoc
abstract mixin class $DevelopmentPlanCopyWith<$Res>  {
  factory $DevelopmentPlanCopyWith(DevelopmentPlan value, $Res Function(DevelopmentPlan) _then) = _$DevelopmentPlanCopyWithImpl;
@useResult
$Res call({
 String? planId, String planName, TrainingTypes planType, String planDescription, double planCost, double usedCost, Currency planCurrency, DevelopmentSource developmentSource, GeneralStatus planStatus, String? planEntryBy, DateTime? planEntryDate,@JsonKey(includeFromJson: false, includeToJson: false) List<Training?> trainingList
});




}
/// @nodoc
class _$DevelopmentPlanCopyWithImpl<$Res>
    implements $DevelopmentPlanCopyWith<$Res> {
  _$DevelopmentPlanCopyWithImpl(this._self, this._then);

  final DevelopmentPlan _self;
  final $Res Function(DevelopmentPlan) _then;

/// Create a copy of DevelopmentPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planId = freezed,Object? planName = null,Object? planType = null,Object? planDescription = null,Object? planCost = null,Object? usedCost = null,Object? planCurrency = null,Object? developmentSource = null,Object? planStatus = null,Object? planEntryBy = freezed,Object? planEntryDate = freezed,Object? trainingList = null,}) {
  return _then(_self.copyWith(
planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String?,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,planType: null == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as TrainingTypes,planDescription: null == planDescription ? _self.planDescription : planDescription // ignore: cast_nullable_to_non_nullable
as String,planCost: null == planCost ? _self.planCost : planCost // ignore: cast_nullable_to_non_nullable
as double,usedCost: null == usedCost ? _self.usedCost : usedCost // ignore: cast_nullable_to_non_nullable
as double,planCurrency: null == planCurrency ? _self.planCurrency : planCurrency // ignore: cast_nullable_to_non_nullable
as Currency,developmentSource: null == developmentSource ? _self.developmentSource : developmentSource // ignore: cast_nullable_to_non_nullable
as DevelopmentSource,planStatus: null == planStatus ? _self.planStatus : planStatus // ignore: cast_nullable_to_non_nullable
as GeneralStatus,planEntryBy: freezed == planEntryBy ? _self.planEntryBy : planEntryBy // ignore: cast_nullable_to_non_nullable
as String?,planEntryDate: freezed == planEntryDate ? _self.planEntryDate : planEntryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,trainingList: null == trainingList ? _self.trainingList : trainingList // ignore: cast_nullable_to_non_nullable
as List<Training?>,
  ));
}

}


/// Adds pattern-matching-related methods to [DevelopmentPlan].
extension DevelopmentPlanPatterns on DevelopmentPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevelopmentPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevelopmentPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevelopmentPlan value)  $default,){
final _that = this;
switch (_that) {
case _DevelopmentPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevelopmentPlan value)?  $default,){
final _that = this;
switch (_that) {
case _DevelopmentPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? planId,  String planName,  TrainingTypes planType,  String planDescription,  double planCost,  double usedCost,  Currency planCurrency,  DevelopmentSource developmentSource,  GeneralStatus planStatus,  String? planEntryBy,  DateTime? planEntryDate, @JsonKey(includeFromJson: false, includeToJson: false)  List<Training?> trainingList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevelopmentPlan() when $default != null:
return $default(_that.planId,_that.planName,_that.planType,_that.planDescription,_that.planCost,_that.usedCost,_that.planCurrency,_that.developmentSource,_that.planStatus,_that.planEntryBy,_that.planEntryDate,_that.trainingList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? planId,  String planName,  TrainingTypes planType,  String planDescription,  double planCost,  double usedCost,  Currency planCurrency,  DevelopmentSource developmentSource,  GeneralStatus planStatus,  String? planEntryBy,  DateTime? planEntryDate, @JsonKey(includeFromJson: false, includeToJson: false)  List<Training?> trainingList)  $default,) {final _that = this;
switch (_that) {
case _DevelopmentPlan():
return $default(_that.planId,_that.planName,_that.planType,_that.planDescription,_that.planCost,_that.usedCost,_that.planCurrency,_that.developmentSource,_that.planStatus,_that.planEntryBy,_that.planEntryDate,_that.trainingList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? planId,  String planName,  TrainingTypes planType,  String planDescription,  double planCost,  double usedCost,  Currency planCurrency,  DevelopmentSource developmentSource,  GeneralStatus planStatus,  String? planEntryBy,  DateTime? planEntryDate, @JsonKey(includeFromJson: false, includeToJson: false)  List<Training?> trainingList)?  $default,) {final _that = this;
switch (_that) {
case _DevelopmentPlan() when $default != null:
return $default(_that.planId,_that.planName,_that.planType,_that.planDescription,_that.planCost,_that.usedCost,_that.planCurrency,_that.developmentSource,_that.planStatus,_that.planEntryBy,_that.planEntryDate,_that.trainingList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DevelopmentPlan implements DevelopmentPlan {
   _DevelopmentPlan({this.planId, required this.planName, required this.planType, required this.planDescription, required this.planCost, required this.usedCost, required this.planCurrency, required this.developmentSource, required this.planStatus, this.planEntryBy, this.planEntryDate, @JsonKey(includeFromJson: false, includeToJson: false) final  List<Training?> trainingList = const []}): _trainingList = trainingList;
  factory _DevelopmentPlan.fromJson(Map<String, dynamic> json) => _$DevelopmentPlanFromJson(json);

@override final  String? planId;
@override final  String planName;
@override final  TrainingTypes planType;
@override final  String planDescription;
@override final  double planCost;
@override final  double usedCost;
@override final  Currency planCurrency;
@override final  DevelopmentSource developmentSource;
@override final  GeneralStatus planStatus;
@override final  String? planEntryBy;
@override final  DateTime? planEntryDate;
 final  List<Training?> _trainingList;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<Training?> get trainingList {
  if (_trainingList is EqualUnmodifiableListView) return _trainingList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainingList);
}


/// Create a copy of DevelopmentPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevelopmentPlanCopyWith<_DevelopmentPlan> get copyWith => __$DevelopmentPlanCopyWithImpl<_DevelopmentPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevelopmentPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevelopmentPlan&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.planType, planType) || other.planType == planType)&&(identical(other.planDescription, planDescription) || other.planDescription == planDescription)&&(identical(other.planCost, planCost) || other.planCost == planCost)&&(identical(other.usedCost, usedCost) || other.usedCost == usedCost)&&(identical(other.planCurrency, planCurrency) || other.planCurrency == planCurrency)&&(identical(other.developmentSource, developmentSource) || other.developmentSource == developmentSource)&&(identical(other.planStatus, planStatus) || other.planStatus == planStatus)&&(identical(other.planEntryBy, planEntryBy) || other.planEntryBy == planEntryBy)&&(identical(other.planEntryDate, planEntryDate) || other.planEntryDate == planEntryDate)&&const DeepCollectionEquality().equals(other._trainingList, _trainingList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,planId,planName,planType,planDescription,planCost,usedCost,planCurrency,developmentSource,planStatus,planEntryBy,planEntryDate,const DeepCollectionEquality().hash(_trainingList));

@override
String toString() {
  return 'DevelopmentPlan(planId: $planId, planName: $planName, planType: $planType, planDescription: $planDescription, planCost: $planCost, usedCost: $usedCost, planCurrency: $planCurrency, developmentSource: $developmentSource, planStatus: $planStatus, planEntryBy: $planEntryBy, planEntryDate: $planEntryDate, trainingList: $trainingList)';
}


}

/// @nodoc
abstract mixin class _$DevelopmentPlanCopyWith<$Res> implements $DevelopmentPlanCopyWith<$Res> {
  factory _$DevelopmentPlanCopyWith(_DevelopmentPlan value, $Res Function(_DevelopmentPlan) _then) = __$DevelopmentPlanCopyWithImpl;
@override @useResult
$Res call({
 String? planId, String planName, TrainingTypes planType, String planDescription, double planCost, double usedCost, Currency planCurrency, DevelopmentSource developmentSource, GeneralStatus planStatus, String? planEntryBy, DateTime? planEntryDate,@JsonKey(includeFromJson: false, includeToJson: false) List<Training?> trainingList
});




}
/// @nodoc
class __$DevelopmentPlanCopyWithImpl<$Res>
    implements _$DevelopmentPlanCopyWith<$Res> {
  __$DevelopmentPlanCopyWithImpl(this._self, this._then);

  final _DevelopmentPlan _self;
  final $Res Function(_DevelopmentPlan) _then;

/// Create a copy of DevelopmentPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = freezed,Object? planName = null,Object? planType = null,Object? planDescription = null,Object? planCost = null,Object? usedCost = null,Object? planCurrency = null,Object? developmentSource = null,Object? planStatus = null,Object? planEntryBy = freezed,Object? planEntryDate = freezed,Object? trainingList = null,}) {
  return _then(_DevelopmentPlan(
planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String?,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,planType: null == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as TrainingTypes,planDescription: null == planDescription ? _self.planDescription : planDescription // ignore: cast_nullable_to_non_nullable
as String,planCost: null == planCost ? _self.planCost : planCost // ignore: cast_nullable_to_non_nullable
as double,usedCost: null == usedCost ? _self.usedCost : usedCost // ignore: cast_nullable_to_non_nullable
as double,planCurrency: null == planCurrency ? _self.planCurrency : planCurrency // ignore: cast_nullable_to_non_nullable
as Currency,developmentSource: null == developmentSource ? _self.developmentSource : developmentSource // ignore: cast_nullable_to_non_nullable
as DevelopmentSource,planStatus: null == planStatus ? _self.planStatus : planStatus // ignore: cast_nullable_to_non_nullable
as GeneralStatus,planEntryBy: freezed == planEntryBy ? _self.planEntryBy : planEntryBy // ignore: cast_nullable_to_non_nullable
as String?,planEntryDate: freezed == planEntryDate ? _self.planEntryDate : planEntryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,trainingList: null == trainingList ? _self._trainingList : trainingList // ignore: cast_nullable_to_non_nullable
as List<Training?>,
  ));
}


}

// dart format on
