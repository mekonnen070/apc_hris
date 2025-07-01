// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_applicant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingApplicant {

 int get trainingApplicantId; int get trainingId; String get employeeId; String? get employeeFullName; String? get employeePhotoPath; DateTime get appliedDate; ApplicantStatus get status; String? get reasonForRejection; String? get appealReason; DateTime? get appealDate;
/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingApplicantCopyWith<TrainingApplicant> get copyWith => _$TrainingApplicantCopyWithImpl<TrainingApplicant>(this as TrainingApplicant, _$identity);

  /// Serializes this TrainingApplicant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingApplicant&&(identical(other.trainingApplicantId, trainingApplicantId) || other.trainingApplicantId == trainingApplicantId)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.employeeFullName, employeeFullName) || other.employeeFullName == employeeFullName)&&(identical(other.employeePhotoPath, employeePhotoPath) || other.employeePhotoPath == employeePhotoPath)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.reasonForRejection, reasonForRejection) || other.reasonForRejection == reasonForRejection)&&(identical(other.appealReason, appealReason) || other.appealReason == appealReason)&&(identical(other.appealDate, appealDate) || other.appealDate == appealDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainingApplicantId,trainingId,employeeId,employeeFullName,employeePhotoPath,appliedDate,status,reasonForRejection,appealReason,appealDate);

@override
String toString() {
  return 'TrainingApplicant(trainingApplicantId: $trainingApplicantId, trainingId: $trainingId, employeeId: $employeeId, employeeFullName: $employeeFullName, employeePhotoPath: $employeePhotoPath, appliedDate: $appliedDate, status: $status, reasonForRejection: $reasonForRejection, appealReason: $appealReason, appealDate: $appealDate)';
}


}

/// @nodoc
abstract mixin class $TrainingApplicantCopyWith<$Res>  {
  factory $TrainingApplicantCopyWith(TrainingApplicant value, $Res Function(TrainingApplicant) _then) = _$TrainingApplicantCopyWithImpl;
@useResult
$Res call({
 int trainingApplicantId, int trainingId, String employeeId, String? employeeFullName, String? employeePhotoPath, DateTime appliedDate, ApplicantStatus status, String? reasonForRejection, String? appealReason, DateTime? appealDate
});




}
/// @nodoc
class _$TrainingApplicantCopyWithImpl<$Res>
    implements $TrainingApplicantCopyWith<$Res> {
  _$TrainingApplicantCopyWithImpl(this._self, this._then);

  final TrainingApplicant _self;
  final $Res Function(TrainingApplicant) _then;

/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainingApplicantId = null,Object? trainingId = null,Object? employeeId = null,Object? employeeFullName = freezed,Object? employeePhotoPath = freezed,Object? appliedDate = null,Object? status = null,Object? reasonForRejection = freezed,Object? appealReason = freezed,Object? appealDate = freezed,}) {
  return _then(_self.copyWith(
trainingApplicantId: null == trainingApplicantId ? _self.trainingApplicantId : trainingApplicantId // ignore: cast_nullable_to_non_nullable
as int,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,employeeFullName: freezed == employeeFullName ? _self.employeeFullName : employeeFullName // ignore: cast_nullable_to_non_nullable
as String?,employeePhotoPath: freezed == employeePhotoPath ? _self.employeePhotoPath : employeePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,appliedDate: null == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,reasonForRejection: freezed == reasonForRejection ? _self.reasonForRejection : reasonForRejection // ignore: cast_nullable_to_non_nullable
as String?,appealReason: freezed == appealReason ? _self.appealReason : appealReason // ignore: cast_nullable_to_non_nullable
as String?,appealDate: freezed == appealDate ? _self.appealDate : appealDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TrainingApplicant implements TrainingApplicant {
  const _TrainingApplicant({required this.trainingApplicantId, required this.trainingId, required this.employeeId, this.employeeFullName, this.employeePhotoPath, required this.appliedDate, required this.status, this.reasonForRejection, this.appealReason, this.appealDate});
  factory _TrainingApplicant.fromJson(Map<String, dynamic> json) => _$TrainingApplicantFromJson(json);

@override final  int trainingApplicantId;
@override final  int trainingId;
@override final  String employeeId;
@override final  String? employeeFullName;
@override final  String? employeePhotoPath;
@override final  DateTime appliedDate;
@override final  ApplicantStatus status;
@override final  String? reasonForRejection;
@override final  String? appealReason;
@override final  DateTime? appealDate;

/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingApplicantCopyWith<_TrainingApplicant> get copyWith => __$TrainingApplicantCopyWithImpl<_TrainingApplicant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingApplicantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingApplicant&&(identical(other.trainingApplicantId, trainingApplicantId) || other.trainingApplicantId == trainingApplicantId)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.employeeFullName, employeeFullName) || other.employeeFullName == employeeFullName)&&(identical(other.employeePhotoPath, employeePhotoPath) || other.employeePhotoPath == employeePhotoPath)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.reasonForRejection, reasonForRejection) || other.reasonForRejection == reasonForRejection)&&(identical(other.appealReason, appealReason) || other.appealReason == appealReason)&&(identical(other.appealDate, appealDate) || other.appealDate == appealDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainingApplicantId,trainingId,employeeId,employeeFullName,employeePhotoPath,appliedDate,status,reasonForRejection,appealReason,appealDate);

@override
String toString() {
  return 'TrainingApplicant(trainingApplicantId: $trainingApplicantId, trainingId: $trainingId, employeeId: $employeeId, employeeFullName: $employeeFullName, employeePhotoPath: $employeePhotoPath, appliedDate: $appliedDate, status: $status, reasonForRejection: $reasonForRejection, appealReason: $appealReason, appealDate: $appealDate)';
}


}

/// @nodoc
abstract mixin class _$TrainingApplicantCopyWith<$Res> implements $TrainingApplicantCopyWith<$Res> {
  factory _$TrainingApplicantCopyWith(_TrainingApplicant value, $Res Function(_TrainingApplicant) _then) = __$TrainingApplicantCopyWithImpl;
@override @useResult
$Res call({
 int trainingApplicantId, int trainingId, String employeeId, String? employeeFullName, String? employeePhotoPath, DateTime appliedDate, ApplicantStatus status, String? reasonForRejection, String? appealReason, DateTime? appealDate
});




}
/// @nodoc
class __$TrainingApplicantCopyWithImpl<$Res>
    implements _$TrainingApplicantCopyWith<$Res> {
  __$TrainingApplicantCopyWithImpl(this._self, this._then);

  final _TrainingApplicant _self;
  final $Res Function(_TrainingApplicant) _then;

/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainingApplicantId = null,Object? trainingId = null,Object? employeeId = null,Object? employeeFullName = freezed,Object? employeePhotoPath = freezed,Object? appliedDate = null,Object? status = null,Object? reasonForRejection = freezed,Object? appealReason = freezed,Object? appealDate = freezed,}) {
  return _then(_TrainingApplicant(
trainingApplicantId: null == trainingApplicantId ? _self.trainingApplicantId : trainingApplicantId // ignore: cast_nullable_to_non_nullable
as int,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,employeeFullName: freezed == employeeFullName ? _self.employeeFullName : employeeFullName // ignore: cast_nullable_to_non_nullable
as String?,employeePhotoPath: freezed == employeePhotoPath ? _self.employeePhotoPath : employeePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,appliedDate: null == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApplicantStatus,reasonForRejection: freezed == reasonForRejection ? _self.reasonForRejection : reasonForRejection // ignore: cast_nullable_to_non_nullable
as String?,appealReason: freezed == appealReason ? _self.appealReason : appealReason // ignore: cast_nullable_to_non_nullable
as String?,appealDate: freezed == appealDate ? _self.appealDate : appealDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
