// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_dependant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeDependantModel {

 String? get dependantId; String get employeeId;// Changed to required based on likely admin usage
 String get dependantFullName; RelationTypes get relation; Gender get gender; DateTime get birthDate; String? get occupation; EthiopianRegion get region; String? get zone; String? get woreda; String? get kebele; String? get houseNumber; String get phoneNumber; String? get alternatePhoneNumber; String? get email; bool get enabled; String? get entryBy; DateTime? get entryDate;
/// Create a copy of EmployeeDependantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeDependantModelCopyWith<EmployeeDependantModel> get copyWith => _$EmployeeDependantModelCopyWithImpl<EmployeeDependantModel>(this as EmployeeDependantModel, _$identity);

  /// Serializes this EmployeeDependantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDependantModel&&(identical(other.dependantId, dependantId) || other.dependantId == dependantId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.dependantFullName, dependantFullName) || other.dependantFullName == dependantFullName)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.region, region) || other.region == region)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.woreda, woreda) || other.woreda == woreda)&&(identical(other.kebele, kebele) || other.kebele == kebele)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.alternatePhoneNumber, alternatePhoneNumber) || other.alternatePhoneNumber == alternatePhoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dependantId,employeeId,dependantFullName,relation,gender,birthDate,occupation,region,zone,woreda,kebele,houseNumber,phoneNumber,alternatePhoneNumber,email,enabled,entryBy,entryDate);

@override
String toString() {
  return 'EmployeeDependantModel(dependantId: $dependantId, employeeId: $employeeId, dependantFullName: $dependantFullName, relation: $relation, gender: $gender, birthDate: $birthDate, occupation: $occupation, region: $region, zone: $zone, woreda: $woreda, kebele: $kebele, houseNumber: $houseNumber, phoneNumber: $phoneNumber, alternatePhoneNumber: $alternatePhoneNumber, email: $email, enabled: $enabled, entryBy: $entryBy, entryDate: $entryDate)';
}


}

/// @nodoc
abstract mixin class $EmployeeDependantModelCopyWith<$Res>  {
  factory $EmployeeDependantModelCopyWith(EmployeeDependantModel value, $Res Function(EmployeeDependantModel) _then) = _$EmployeeDependantModelCopyWithImpl;
@useResult
$Res call({
 String? dependantId, String employeeId, String dependantFullName, RelationTypes relation, Gender gender, DateTime birthDate, String? occupation, EthiopianRegion region, String? zone, String? woreda, String? kebele, String? houseNumber, String phoneNumber, String? alternatePhoneNumber, String? email, bool enabled, String? entryBy, DateTime? entryDate
});




}
/// @nodoc
class _$EmployeeDependantModelCopyWithImpl<$Res>
    implements $EmployeeDependantModelCopyWith<$Res> {
  _$EmployeeDependantModelCopyWithImpl(this._self, this._then);

  final EmployeeDependantModel _self;
  final $Res Function(EmployeeDependantModel) _then;

/// Create a copy of EmployeeDependantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dependantId = freezed,Object? employeeId = null,Object? dependantFullName = null,Object? relation = null,Object? gender = null,Object? birthDate = null,Object? occupation = freezed,Object? region = null,Object? zone = freezed,Object? woreda = freezed,Object? kebele = freezed,Object? houseNumber = freezed,Object? phoneNumber = null,Object? alternatePhoneNumber = freezed,Object? email = freezed,Object? enabled = null,Object? entryBy = freezed,Object? entryDate = freezed,}) {
  return _then(_self.copyWith(
dependantId: freezed == dependantId ? _self.dependantId : dependantId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,dependantFullName: null == dependantFullName ? _self.dependantFullName : dependantFullName // ignore: cast_nullable_to_non_nullable
as String,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as RelationTypes,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as EthiopianRegion,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as String?,woreda: freezed == woreda ? _self.woreda : woreda // ignore: cast_nullable_to_non_nullable
as String?,kebele: freezed == kebele ? _self.kebele : kebele // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,alternatePhoneNumber: freezed == alternatePhoneNumber ? _self.alternatePhoneNumber : alternatePhoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EmployeeDependantModel implements EmployeeDependantModel {
  const _EmployeeDependantModel({this.dependantId, required this.employeeId, required this.dependantFullName, required this.relation, required this.gender, required this.birthDate, this.occupation, required this.region, this.zone, this.woreda, this.kebele, this.houseNumber, required this.phoneNumber, this.alternatePhoneNumber, this.email, this.enabled = true, this.entryBy, this.entryDate});
  factory _EmployeeDependantModel.fromJson(Map<String, dynamic> json) => _$EmployeeDependantModelFromJson(json);

@override final  String? dependantId;
@override final  String employeeId;
// Changed to required based on likely admin usage
@override final  String dependantFullName;
@override final  RelationTypes relation;
@override final  Gender gender;
@override final  DateTime birthDate;
@override final  String? occupation;
@override final  EthiopianRegion region;
@override final  String? zone;
@override final  String? woreda;
@override final  String? kebele;
@override final  String? houseNumber;
@override final  String phoneNumber;
@override final  String? alternatePhoneNumber;
@override final  String? email;
@override@JsonKey() final  bool enabled;
@override final  String? entryBy;
@override final  DateTime? entryDate;

/// Create a copy of EmployeeDependantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeDependantModelCopyWith<_EmployeeDependantModel> get copyWith => __$EmployeeDependantModelCopyWithImpl<_EmployeeDependantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeDependantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeDependantModel&&(identical(other.dependantId, dependantId) || other.dependantId == dependantId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.dependantFullName, dependantFullName) || other.dependantFullName == dependantFullName)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.region, region) || other.region == region)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.woreda, woreda) || other.woreda == woreda)&&(identical(other.kebele, kebele) || other.kebele == kebele)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.alternatePhoneNumber, alternatePhoneNumber) || other.alternatePhoneNumber == alternatePhoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.entryBy, entryBy) || other.entryBy == entryBy)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dependantId,employeeId,dependantFullName,relation,gender,birthDate,occupation,region,zone,woreda,kebele,houseNumber,phoneNumber,alternatePhoneNumber,email,enabled,entryBy,entryDate);

@override
String toString() {
  return 'EmployeeDependantModel(dependantId: $dependantId, employeeId: $employeeId, dependantFullName: $dependantFullName, relation: $relation, gender: $gender, birthDate: $birthDate, occupation: $occupation, region: $region, zone: $zone, woreda: $woreda, kebele: $kebele, houseNumber: $houseNumber, phoneNumber: $phoneNumber, alternatePhoneNumber: $alternatePhoneNumber, email: $email, enabled: $enabled, entryBy: $entryBy, entryDate: $entryDate)';
}


}

/// @nodoc
abstract mixin class _$EmployeeDependantModelCopyWith<$Res> implements $EmployeeDependantModelCopyWith<$Res> {
  factory _$EmployeeDependantModelCopyWith(_EmployeeDependantModel value, $Res Function(_EmployeeDependantModel) _then) = __$EmployeeDependantModelCopyWithImpl;
@override @useResult
$Res call({
 String? dependantId, String employeeId, String dependantFullName, RelationTypes relation, Gender gender, DateTime birthDate, String? occupation, EthiopianRegion region, String? zone, String? woreda, String? kebele, String? houseNumber, String phoneNumber, String? alternatePhoneNumber, String? email, bool enabled, String? entryBy, DateTime? entryDate
});




}
/// @nodoc
class __$EmployeeDependantModelCopyWithImpl<$Res>
    implements _$EmployeeDependantModelCopyWith<$Res> {
  __$EmployeeDependantModelCopyWithImpl(this._self, this._then);

  final _EmployeeDependantModel _self;
  final $Res Function(_EmployeeDependantModel) _then;

/// Create a copy of EmployeeDependantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dependantId = freezed,Object? employeeId = null,Object? dependantFullName = null,Object? relation = null,Object? gender = null,Object? birthDate = null,Object? occupation = freezed,Object? region = null,Object? zone = freezed,Object? woreda = freezed,Object? kebele = freezed,Object? houseNumber = freezed,Object? phoneNumber = null,Object? alternatePhoneNumber = freezed,Object? email = freezed,Object? enabled = null,Object? entryBy = freezed,Object? entryDate = freezed,}) {
  return _then(_EmployeeDependantModel(
dependantId: freezed == dependantId ? _self.dependantId : dependantId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,dependantFullName: null == dependantFullName ? _self.dependantFullName : dependantFullName // ignore: cast_nullable_to_non_nullable
as String,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as RelationTypes,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as EthiopianRegion,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as String?,woreda: freezed == woreda ? _self.woreda : woreda // ignore: cast_nullable_to_non_nullable
as String?,kebele: freezed == kebele ? _self.kebele : kebele // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,alternatePhoneNumber: freezed == alternatePhoneNumber ? _self.alternatePhoneNumber : alternatePhoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,entryBy: freezed == entryBy ? _self.entryBy : entryBy // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
