// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'retirement_eligibility_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RetirementEligibilityState {

 DateTime? get dateOfBirth; int? get customRetirementAge;// User can override the default
 int? get calculatedAge; bool? get isEligible; String? get eligibilityMessage; bool get isLoading; String? get errorMessage;
/// Create a copy of RetirementEligibilityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RetirementEligibilityStateCopyWith<RetirementEligibilityState> get copyWith => _$RetirementEligibilityStateCopyWithImpl<RetirementEligibilityState>(this as RetirementEligibilityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RetirementEligibilityState&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.customRetirementAge, customRetirementAge) || other.customRetirementAge == customRetirementAge)&&(identical(other.calculatedAge, calculatedAge) || other.calculatedAge == calculatedAge)&&(identical(other.isEligible, isEligible) || other.isEligible == isEligible)&&(identical(other.eligibilityMessage, eligibilityMessage) || other.eligibilityMessage == eligibilityMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,dateOfBirth,customRetirementAge,calculatedAge,isEligible,eligibilityMessage,isLoading,errorMessage);

@override
String toString() {
  return 'RetirementEligibilityState(dateOfBirth: $dateOfBirth, customRetirementAge: $customRetirementAge, calculatedAge: $calculatedAge, isEligible: $isEligible, eligibilityMessage: $eligibilityMessage, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $RetirementEligibilityStateCopyWith<$Res>  {
  factory $RetirementEligibilityStateCopyWith(RetirementEligibilityState value, $Res Function(RetirementEligibilityState) _then) = _$RetirementEligibilityStateCopyWithImpl;
@useResult
$Res call({
 DateTime? dateOfBirth, int? customRetirementAge, int? calculatedAge, bool? isEligible, String? eligibilityMessage, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$RetirementEligibilityStateCopyWithImpl<$Res>
    implements $RetirementEligibilityStateCopyWith<$Res> {
  _$RetirementEligibilityStateCopyWithImpl(this._self, this._then);

  final RetirementEligibilityState _self;
  final $Res Function(RetirementEligibilityState) _then;

/// Create a copy of RetirementEligibilityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateOfBirth = freezed,Object? customRetirementAge = freezed,Object? calculatedAge = freezed,Object? isEligible = freezed,Object? eligibilityMessage = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,customRetirementAge: freezed == customRetirementAge ? _self.customRetirementAge : customRetirementAge // ignore: cast_nullable_to_non_nullable
as int?,calculatedAge: freezed == calculatedAge ? _self.calculatedAge : calculatedAge // ignore: cast_nullable_to_non_nullable
as int?,isEligible: freezed == isEligible ? _self.isEligible : isEligible // ignore: cast_nullable_to_non_nullable
as bool?,eligibilityMessage: freezed == eligibilityMessage ? _self.eligibilityMessage : eligibilityMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _RetirementEligibilityState implements RetirementEligibilityState {
  const _RetirementEligibilityState({this.dateOfBirth, this.customRetirementAge, this.calculatedAge, this.isEligible, this.eligibilityMessage, this.isLoading = false, this.errorMessage});
  

@override final  DateTime? dateOfBirth;
@override final  int? customRetirementAge;
// User can override the default
@override final  int? calculatedAge;
@override final  bool? isEligible;
@override final  String? eligibilityMessage;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of RetirementEligibilityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetirementEligibilityStateCopyWith<_RetirementEligibilityState> get copyWith => __$RetirementEligibilityStateCopyWithImpl<_RetirementEligibilityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetirementEligibilityState&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.customRetirementAge, customRetirementAge) || other.customRetirementAge == customRetirementAge)&&(identical(other.calculatedAge, calculatedAge) || other.calculatedAge == calculatedAge)&&(identical(other.isEligible, isEligible) || other.isEligible == isEligible)&&(identical(other.eligibilityMessage, eligibilityMessage) || other.eligibilityMessage == eligibilityMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,dateOfBirth,customRetirementAge,calculatedAge,isEligible,eligibilityMessage,isLoading,errorMessage);

@override
String toString() {
  return 'RetirementEligibilityState(dateOfBirth: $dateOfBirth, customRetirementAge: $customRetirementAge, calculatedAge: $calculatedAge, isEligible: $isEligible, eligibilityMessage: $eligibilityMessage, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$RetirementEligibilityStateCopyWith<$Res> implements $RetirementEligibilityStateCopyWith<$Res> {
  factory _$RetirementEligibilityStateCopyWith(_RetirementEligibilityState value, $Res Function(_RetirementEligibilityState) _then) = __$RetirementEligibilityStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime? dateOfBirth, int? customRetirementAge, int? calculatedAge, bool? isEligible, String? eligibilityMessage, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$RetirementEligibilityStateCopyWithImpl<$Res>
    implements _$RetirementEligibilityStateCopyWith<$Res> {
  __$RetirementEligibilityStateCopyWithImpl(this._self, this._then);

  final _RetirementEligibilityState _self;
  final $Res Function(_RetirementEligibilityState) _then;

/// Create a copy of RetirementEligibilityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateOfBirth = freezed,Object? customRetirementAge = freezed,Object? calculatedAge = freezed,Object? isEligible = freezed,Object? eligibilityMessage = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_RetirementEligibilityState(
dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,customRetirementAge: freezed == customRetirementAge ? _self.customRetirementAge : customRetirementAge // ignore: cast_nullable_to_non_nullable
as int?,calculatedAge: freezed == calculatedAge ? _self.calculatedAge : calculatedAge // ignore: cast_nullable_to_non_nullable
as int?,isEligible: freezed == isEligible ? _self.isEligible : isEligible // ignore: cast_nullable_to_non_nullable
as bool?,eligibilityMessage: freezed == eligibilityMessage ? _self.eligibilityMessage : eligibilityMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
