// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_application_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingApplicationRequest {

// id can be omitted if the backend generates it
 String get applicantId; int get appliedFor; ApplicantStatus get applicantStatus; double? get cgpa; int get age; String? get applicantEntryBy; DateTime? get applicantEntryDate;
/// Create a copy of TrainingApplicationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingApplicationRequestCopyWith<TrainingApplicationRequest> get copyWith => _$TrainingApplicationRequestCopyWithImpl<TrainingApplicationRequest>(this as TrainingApplicationRequest, _$identity);

  /// Serializes this TrainingApplicationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingApplicationRequest&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.appliedFor, appliedFor) || other.appliedFor == appliedFor)&&(identical(other.applicantStatus, applicantStatus) || other.applicantStatus == applicantStatus)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.age, age) || other.age == age)&&(identical(other.applicantEntryBy, applicantEntryBy) || other.applicantEntryBy == applicantEntryBy)&&(identical(other.applicantEntryDate, applicantEntryDate) || other.applicantEntryDate == applicantEntryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicantId,appliedFor,applicantStatus,cgpa,age,applicantEntryBy,applicantEntryDate);

@override
String toString() {
  return 'TrainingApplicationRequest(applicantId: $applicantId, appliedFor: $appliedFor, applicantStatus: $applicantStatus, cgpa: $cgpa, age: $age, applicantEntryBy: $applicantEntryBy, applicantEntryDate: $applicantEntryDate)';
}


}

/// @nodoc
abstract mixin class $TrainingApplicationRequestCopyWith<$Res>  {
  factory $TrainingApplicationRequestCopyWith(TrainingApplicationRequest value, $Res Function(TrainingApplicationRequest) _then) = _$TrainingApplicationRequestCopyWithImpl;
@useResult
$Res call({
 String applicantId, int appliedFor, ApplicantStatus applicantStatus, double? cgpa, int age, String? applicantEntryBy, DateTime? applicantEntryDate
});




}
/// @nodoc
class _$TrainingApplicationRequestCopyWithImpl<$Res>
    implements $TrainingApplicationRequestCopyWith<$Res> {
  _$TrainingApplicationRequestCopyWithImpl(this._self, this._then);

  final TrainingApplicationRequest _self;
  final $Res Function(TrainingApplicationRequest) _then;

/// Create a copy of TrainingApplicationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicantId = null,Object? appliedFor = null,Object? applicantStatus = null,Object? cgpa = freezed,Object? age = null,Object? applicantEntryBy = freezed,Object? applicantEntryDate = freezed,}) {
  return _then(_self.copyWith(
applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String,appliedFor: null == appliedFor ? _self.appliedFor : appliedFor // ignore: cast_nullable_to_non_nullable
as int,applicantStatus: null == applicantStatus ? _self.applicantStatus : applicantStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as double?,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,applicantEntryBy: freezed == applicantEntryBy ? _self.applicantEntryBy : applicantEntryBy // ignore: cast_nullable_to_non_nullable
as String?,applicantEntryDate: freezed == applicantEntryDate ? _self.applicantEntryDate : applicantEntryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TrainingApplicationRequest implements TrainingApplicationRequest {
   _TrainingApplicationRequest({required this.applicantId, required this.appliedFor, required this.applicantStatus, this.cgpa, required this.age, this.applicantEntryBy, this.applicantEntryDate});
  factory _TrainingApplicationRequest.fromJson(Map<String, dynamic> json) => _$TrainingApplicationRequestFromJson(json);

// id can be omitted if the backend generates it
@override final  String applicantId;
@override final  int appliedFor;
@override final  ApplicantStatus applicantStatus;
@override final  double? cgpa;
@override final  int age;
@override final  String? applicantEntryBy;
@override final  DateTime? applicantEntryDate;

/// Create a copy of TrainingApplicationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingApplicationRequestCopyWith<_TrainingApplicationRequest> get copyWith => __$TrainingApplicationRequestCopyWithImpl<_TrainingApplicationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingApplicationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingApplicationRequest&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.appliedFor, appliedFor) || other.appliedFor == appliedFor)&&(identical(other.applicantStatus, applicantStatus) || other.applicantStatus == applicantStatus)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.age, age) || other.age == age)&&(identical(other.applicantEntryBy, applicantEntryBy) || other.applicantEntryBy == applicantEntryBy)&&(identical(other.applicantEntryDate, applicantEntryDate) || other.applicantEntryDate == applicantEntryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicantId,appliedFor,applicantStatus,cgpa,age,applicantEntryBy,applicantEntryDate);

@override
String toString() {
  return 'TrainingApplicationRequest(applicantId: $applicantId, appliedFor: $appliedFor, applicantStatus: $applicantStatus, cgpa: $cgpa, age: $age, applicantEntryBy: $applicantEntryBy, applicantEntryDate: $applicantEntryDate)';
}


}

/// @nodoc
abstract mixin class _$TrainingApplicationRequestCopyWith<$Res> implements $TrainingApplicationRequestCopyWith<$Res> {
  factory _$TrainingApplicationRequestCopyWith(_TrainingApplicationRequest value, $Res Function(_TrainingApplicationRequest) _then) = __$TrainingApplicationRequestCopyWithImpl;
@override @useResult
$Res call({
 String applicantId, int appliedFor, ApplicantStatus applicantStatus, double? cgpa, int age, String? applicantEntryBy, DateTime? applicantEntryDate
});




}
/// @nodoc
class __$TrainingApplicationRequestCopyWithImpl<$Res>
    implements _$TrainingApplicationRequestCopyWith<$Res> {
  __$TrainingApplicationRequestCopyWithImpl(this._self, this._then);

  final _TrainingApplicationRequest _self;
  final $Res Function(_TrainingApplicationRequest) _then;

/// Create a copy of TrainingApplicationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicantId = null,Object? appliedFor = null,Object? applicantStatus = null,Object? cgpa = freezed,Object? age = null,Object? applicantEntryBy = freezed,Object? applicantEntryDate = freezed,}) {
  return _then(_TrainingApplicationRequest(
applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String,appliedFor: null == appliedFor ? _self.appliedFor : appliedFor // ignore: cast_nullable_to_non_nullable
as int,applicantStatus: null == applicantStatus ? _self.applicantStatus : applicantStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as double?,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,applicantEntryBy: freezed == applicantEntryBy ? _self.applicantEntryBy : applicantEntryBy // ignore: cast_nullable_to_non_nullable
as String?,applicantEntryDate: freezed == applicantEntryDate ? _self.applicantEntryDate : applicantEntryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
