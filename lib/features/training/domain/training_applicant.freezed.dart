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

 int? get id; String get applicantId; int get appliedFor; ApplicantStatus? get applicantStatus; double? get cgpa; int get age; String? get applicantEntryBy; DateTime? get applicantEntryDate; EmployeeInfoModel? get employee; Training? get training;@JsonKey(includeFromJson: false, includeToJson: false) List<ApplicantSelection?> get applicantSelections;
/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingApplicantCopyWith<TrainingApplicant> get copyWith => _$TrainingApplicantCopyWithImpl<TrainingApplicant>(this as TrainingApplicant, _$identity);

  /// Serializes this TrainingApplicant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingApplicant&&(identical(other.id, id) || other.id == id)&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.appliedFor, appliedFor) || other.appliedFor == appliedFor)&&(identical(other.applicantStatus, applicantStatus) || other.applicantStatus == applicantStatus)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.age, age) || other.age == age)&&(identical(other.applicantEntryBy, applicantEntryBy) || other.applicantEntryBy == applicantEntryBy)&&(identical(other.applicantEntryDate, applicantEntryDate) || other.applicantEntryDate == applicantEntryDate)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.training, training) || other.training == training)&&const DeepCollectionEquality().equals(other.applicantSelections, applicantSelections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicantId,appliedFor,applicantStatus,cgpa,age,applicantEntryBy,applicantEntryDate,employee,training,const DeepCollectionEquality().hash(applicantSelections));

@override
String toString() {
  return 'TrainingApplicant(id: $id, applicantId: $applicantId, appliedFor: $appliedFor, applicantStatus: $applicantStatus, cgpa: $cgpa, age: $age, applicantEntryBy: $applicantEntryBy, applicantEntryDate: $applicantEntryDate, employee: $employee, training: $training, applicantSelections: $applicantSelections)';
}


}

/// @nodoc
abstract mixin class $TrainingApplicantCopyWith<$Res>  {
  factory $TrainingApplicantCopyWith(TrainingApplicant value, $Res Function(TrainingApplicant) _then) = _$TrainingApplicantCopyWithImpl;
@useResult
$Res call({
 int? id, String applicantId, int appliedFor, ApplicantStatus? applicantStatus, double? cgpa, int age, String? applicantEntryBy, DateTime? applicantEntryDate, EmployeeInfoModel? employee, Training? training,@JsonKey(includeFromJson: false, includeToJson: false) List<ApplicantSelection?> applicantSelections
});


$EmployeeInfoModelCopyWith<$Res>? get employee;$TrainingCopyWith<$Res>? get training;

}
/// @nodoc
class _$TrainingApplicantCopyWithImpl<$Res>
    implements $TrainingApplicantCopyWith<$Res> {
  _$TrainingApplicantCopyWithImpl(this._self, this._then);

  final TrainingApplicant _self;
  final $Res Function(TrainingApplicant) _then;

/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? applicantId = null,Object? appliedFor = null,Object? applicantStatus = freezed,Object? cgpa = freezed,Object? age = null,Object? applicantEntryBy = freezed,Object? applicantEntryDate = freezed,Object? employee = freezed,Object? training = freezed,Object? applicantSelections = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String,appliedFor: null == appliedFor ? _self.appliedFor : appliedFor // ignore: cast_nullable_to_non_nullable
as int,applicantStatus: freezed == applicantStatus ? _self.applicantStatus : applicantStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as double?,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,applicantEntryBy: freezed == applicantEntryBy ? _self.applicantEntryBy : applicantEntryBy // ignore: cast_nullable_to_non_nullable
as String?,applicantEntryDate: freezed == applicantEntryDate ? _self.applicantEntryDate : applicantEntryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as EmployeeInfoModel?,training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as Training?,applicantSelections: null == applicantSelections ? _self.applicantSelections : applicantSelections // ignore: cast_nullable_to_non_nullable
as List<ApplicantSelection?>,
  ));
}
/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeInfoModelCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $EmployeeInfoModelCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _TrainingApplicant implements TrainingApplicant {
   _TrainingApplicant({this.id, required this.applicantId, required this.appliedFor, this.applicantStatus, this.cgpa, required this.age, this.applicantEntryBy, this.applicantEntryDate, this.employee, this.training, @JsonKey(includeFromJson: false, includeToJson: false) final  List<ApplicantSelection?> applicantSelections = const []}): _applicantSelections = applicantSelections;
  factory _TrainingApplicant.fromJson(Map<String, dynamic> json) => _$TrainingApplicantFromJson(json);

@override final  int? id;
@override final  String applicantId;
@override final  int appliedFor;
@override final  ApplicantStatus? applicantStatus;
@override final  double? cgpa;
@override final  int age;
@override final  String? applicantEntryBy;
@override final  DateTime? applicantEntryDate;
@override final  EmployeeInfoModel? employee;
@override final  Training? training;
 final  List<ApplicantSelection?> _applicantSelections;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<ApplicantSelection?> get applicantSelections {
  if (_applicantSelections is EqualUnmodifiableListView) return _applicantSelections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applicantSelections);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingApplicant&&(identical(other.id, id) || other.id == id)&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.appliedFor, appliedFor) || other.appliedFor == appliedFor)&&(identical(other.applicantStatus, applicantStatus) || other.applicantStatus == applicantStatus)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.age, age) || other.age == age)&&(identical(other.applicantEntryBy, applicantEntryBy) || other.applicantEntryBy == applicantEntryBy)&&(identical(other.applicantEntryDate, applicantEntryDate) || other.applicantEntryDate == applicantEntryDate)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.training, training) || other.training == training)&&const DeepCollectionEquality().equals(other._applicantSelections, _applicantSelections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicantId,appliedFor,applicantStatus,cgpa,age,applicantEntryBy,applicantEntryDate,employee,training,const DeepCollectionEquality().hash(_applicantSelections));

@override
String toString() {
  return 'TrainingApplicant(id: $id, applicantId: $applicantId, appliedFor: $appliedFor, applicantStatus: $applicantStatus, cgpa: $cgpa, age: $age, applicantEntryBy: $applicantEntryBy, applicantEntryDate: $applicantEntryDate, employee: $employee, training: $training, applicantSelections: $applicantSelections)';
}


}

/// @nodoc
abstract mixin class _$TrainingApplicantCopyWith<$Res> implements $TrainingApplicantCopyWith<$Res> {
  factory _$TrainingApplicantCopyWith(_TrainingApplicant value, $Res Function(_TrainingApplicant) _then) = __$TrainingApplicantCopyWithImpl;
@override @useResult
$Res call({
 int? id, String applicantId, int appliedFor, ApplicantStatus? applicantStatus, double? cgpa, int age, String? applicantEntryBy, DateTime? applicantEntryDate, EmployeeInfoModel? employee, Training? training,@JsonKey(includeFromJson: false, includeToJson: false) List<ApplicantSelection?> applicantSelections
});


@override $EmployeeInfoModelCopyWith<$Res>? get employee;@override $TrainingCopyWith<$Res>? get training;

}
/// @nodoc
class __$TrainingApplicantCopyWithImpl<$Res>
    implements _$TrainingApplicantCopyWith<$Res> {
  __$TrainingApplicantCopyWithImpl(this._self, this._then);

  final _TrainingApplicant _self;
  final $Res Function(_TrainingApplicant) _then;

/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? applicantId = null,Object? appliedFor = null,Object? applicantStatus = freezed,Object? cgpa = freezed,Object? age = null,Object? applicantEntryBy = freezed,Object? applicantEntryDate = freezed,Object? employee = freezed,Object? training = freezed,Object? applicantSelections = null,}) {
  return _then(_TrainingApplicant(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String,appliedFor: null == appliedFor ? _self.appliedFor : appliedFor // ignore: cast_nullable_to_non_nullable
as int,applicantStatus: freezed == applicantStatus ? _self.applicantStatus : applicantStatus // ignore: cast_nullable_to_non_nullable
as ApplicantStatus?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as double?,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,applicantEntryBy: freezed == applicantEntryBy ? _self.applicantEntryBy : applicantEntryBy // ignore: cast_nullable_to_non_nullable
as String?,applicantEntryDate: freezed == applicantEntryDate ? _self.applicantEntryDate : applicantEntryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as EmployeeInfoModel?,training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as Training?,applicantSelections: null == applicantSelections ? _self._applicantSelections : applicantSelections // ignore: cast_nullable_to_non_nullable
as List<ApplicantSelection?>,
  ));
}

/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeInfoModelCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $EmployeeInfoModelCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}/// Create a copy of TrainingApplicant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}
}

// dart format on
