// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Training {

 int get trainingId; String get trainingName; String get description; DateTime get startDate; DateTime get endDate; int get duration; String get organizedBy; String get trainingCenter; String? get certificate;// This field will tell the UI if the current user has already applied.
// It's not part of the C# model but is a helpful UI-specific property.
 ApplicantStatus? get currentUserApplicationStatus;
/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingCopyWith<Training> get copyWith => _$TrainingCopyWithImpl<Training>(this as Training, _$identity);

  /// Serializes this Training to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Training&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.trainingName, trainingName) || other.trainingName == trainingName)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.organizedBy, organizedBy) || other.organizedBy == organizedBy)&&(identical(other.trainingCenter, trainingCenter) || other.trainingCenter == trainingCenter)&&(identical(other.certificate, certificate) || other.certificate == certificate)&&(identical(other.currentUserApplicationStatus, currentUserApplicationStatus) || other.currentUserApplicationStatus == currentUserApplicationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainingId,trainingName,description,startDate,endDate,duration,organizedBy,trainingCenter,certificate,currentUserApplicationStatus);

@override
String toString() {
  return 'Training(trainingId: $trainingId, trainingName: $trainingName, description: $description, startDate: $startDate, endDate: $endDate, duration: $duration, organizedBy: $organizedBy, trainingCenter: $trainingCenter, certificate: $certificate, currentUserApplicationStatus: $currentUserApplicationStatus)';
}


}

/// @nodoc
abstract mixin class $TrainingCopyWith<$Res>  {
  factory $TrainingCopyWith(Training value, $Res Function(Training) _then) = _$TrainingCopyWithImpl;
@useResult
$Res call({
 int trainingId, String trainingName, String description, DateTime startDate, DateTime endDate, int duration, String organizedBy, String trainingCenter, String? certificate, ApplicantStatus? currentUserApplicationStatus
});




}
/// @nodoc
class _$TrainingCopyWithImpl<$Res>
    implements $TrainingCopyWith<$Res> {
  _$TrainingCopyWithImpl(this._self, this._then);

  final Training _self;
  final $Res Function(Training) _then;

/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainingId = null,Object? trainingName = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? duration = null,Object? organizedBy = null,Object? trainingCenter = null,Object? certificate = freezed,Object? currentUserApplicationStatus = freezed,}) {
  return _then(_self.copyWith(
trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as int,trainingName: null == trainingName ? _self.trainingName : trainingName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,organizedBy: null == organizedBy ? _self.organizedBy : organizedBy // ignore: cast_nullable_to_non_nullable
as String,trainingCenter: null == trainingCenter ? _self.trainingCenter : trainingCenter // ignore: cast_nullable_to_non_nullable
as String,certificate: freezed == certificate ? _self.certificate : certificate // ignore: cast_nullable_to_non_nullable
as String?,currentUserApplicationStatus: freezed == currentUserApplicationStatus ? _self.currentUserApplicationStatus : currentUserApplicationStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Training implements Training {
  const _Training({required this.trainingId, required this.trainingName, required this.description, required this.startDate, required this.endDate, required this.duration, required this.organizedBy, required this.trainingCenter, required this.certificate, this.currentUserApplicationStatus});
  factory _Training.fromJson(Map<String, dynamic> json) => _$TrainingFromJson(json);

@override final  int trainingId;
@override final  String trainingName;
@override final  String description;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  int duration;
@override final  String organizedBy;
@override final  String trainingCenter;
@override final  String? certificate;
// This field will tell the UI if the current user has already applied.
// It's not part of the C# model but is a helpful UI-specific property.
@override final  ApplicantStatus? currentUserApplicationStatus;

/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingCopyWith<_Training> get copyWith => __$TrainingCopyWithImpl<_Training>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Training&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.trainingName, trainingName) || other.trainingName == trainingName)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.organizedBy, organizedBy) || other.organizedBy == organizedBy)&&(identical(other.trainingCenter, trainingCenter) || other.trainingCenter == trainingCenter)&&(identical(other.certificate, certificate) || other.certificate == certificate)&&(identical(other.currentUserApplicationStatus, currentUserApplicationStatus) || other.currentUserApplicationStatus == currentUserApplicationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainingId,trainingName,description,startDate,endDate,duration,organizedBy,trainingCenter,certificate,currentUserApplicationStatus);

@override
String toString() {
  return 'Training(trainingId: $trainingId, trainingName: $trainingName, description: $description, startDate: $startDate, endDate: $endDate, duration: $duration, organizedBy: $organizedBy, trainingCenter: $trainingCenter, certificate: $certificate, currentUserApplicationStatus: $currentUserApplicationStatus)';
}


}

/// @nodoc
abstract mixin class _$TrainingCopyWith<$Res> implements $TrainingCopyWith<$Res> {
  factory _$TrainingCopyWith(_Training value, $Res Function(_Training) _then) = __$TrainingCopyWithImpl;
@override @useResult
$Res call({
 int trainingId, String trainingName, String description, DateTime startDate, DateTime endDate, int duration, String organizedBy, String trainingCenter, String? certificate, ApplicantStatus? currentUserApplicationStatus
});




}
/// @nodoc
class __$TrainingCopyWithImpl<$Res>
    implements _$TrainingCopyWith<$Res> {
  __$TrainingCopyWithImpl(this._self, this._then);

  final _Training _self;
  final $Res Function(_Training) _then;

/// Create a copy of Training
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainingId = null,Object? trainingName = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? duration = null,Object? organizedBy = null,Object? trainingCenter = null,Object? certificate = freezed,Object? currentUserApplicationStatus = freezed,}) {
  return _then(_Training(
trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as int,trainingName: null == trainingName ? _self.trainingName : trainingName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,organizedBy: null == organizedBy ? _self.organizedBy : organizedBy // ignore: cast_nullable_to_non_nullable
as String,trainingCenter: null == trainingCenter ? _self.trainingCenter : trainingCenter // ignore: cast_nullable_to_non_nullable
as String,certificate: freezed == certificate ? _self.certificate : certificate // ignore: cast_nullable_to_non_nullable
as String?,currentUserApplicationStatus: freezed == currentUserApplicationStatus ? _self.currentUserApplicationStatus : currentUserApplicationStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,
  ));
}


}

// dart format on
