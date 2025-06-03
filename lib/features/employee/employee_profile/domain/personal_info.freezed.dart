// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonalInfo {

 String get fullName; String get address; String get phoneNumber; String get email; DateTime? get dateOfBirth; String? get gender; String? get maritalStatus;
/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<PersonalInfo> get copyWith => _$PersonalInfoCopyWithImpl<PersonalInfo>(this as PersonalInfo, _$identity);

  /// Serializes this PersonalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalInfo&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,address,phoneNumber,email,dateOfBirth,gender,maritalStatus);

@override
String toString() {
  return 'PersonalInfo(fullName: $fullName, address: $address, phoneNumber: $phoneNumber, email: $email, dateOfBirth: $dateOfBirth, gender: $gender, maritalStatus: $maritalStatus)';
}


}

/// @nodoc
abstract mixin class $PersonalInfoCopyWith<$Res>  {
  factory $PersonalInfoCopyWith(PersonalInfo value, $Res Function(PersonalInfo) _then) = _$PersonalInfoCopyWithImpl;
@useResult
$Res call({
 String fullName, String address, String phoneNumber, String email, DateTime? dateOfBirth, String? gender, String? maritalStatus
});




}
/// @nodoc
class _$PersonalInfoCopyWithImpl<$Res>
    implements $PersonalInfoCopyWith<$Res> {
  _$PersonalInfoCopyWithImpl(this._self, this._then);

  final PersonalInfo _self;
  final $Res Function(PersonalInfo) _then;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? address = null,Object? phoneNumber = null,Object? email = null,Object? dateOfBirth = freezed,Object? gender = freezed,Object? maritalStatus = freezed,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,maritalStatus: freezed == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PersonalInfo implements PersonalInfo {
   _PersonalInfo({required this.fullName, required this.address, required this.phoneNumber, required this.email, required this.dateOfBirth, required this.gender, required this.maritalStatus});
  factory _PersonalInfo.fromJson(Map<String, dynamic> json) => _$PersonalInfoFromJson(json);

@override final  String fullName;
@override final  String address;
@override final  String phoneNumber;
@override final  String email;
@override final  DateTime? dateOfBirth;
@override final  String? gender;
@override final  String? maritalStatus;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalInfoCopyWith<_PersonalInfo> get copyWith => __$PersonalInfoCopyWithImpl<_PersonalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalInfo&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.maritalStatus, maritalStatus) || other.maritalStatus == maritalStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,address,phoneNumber,email,dateOfBirth,gender,maritalStatus);

@override
String toString() {
  return 'PersonalInfo(fullName: $fullName, address: $address, phoneNumber: $phoneNumber, email: $email, dateOfBirth: $dateOfBirth, gender: $gender, maritalStatus: $maritalStatus)';
}


}

/// @nodoc
abstract mixin class _$PersonalInfoCopyWith<$Res> implements $PersonalInfoCopyWith<$Res> {
  factory _$PersonalInfoCopyWith(_PersonalInfo value, $Res Function(_PersonalInfo) _then) = __$PersonalInfoCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String address, String phoneNumber, String email, DateTime? dateOfBirth, String? gender, String? maritalStatus
});




}
/// @nodoc
class __$PersonalInfoCopyWithImpl<$Res>
    implements _$PersonalInfoCopyWith<$Res> {
  __$PersonalInfoCopyWithImpl(this._self, this._then);

  final _PersonalInfo _self;
  final $Res Function(_PersonalInfo) _then;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? address = null,Object? phoneNumber = null,Object? email = null,Object? dateOfBirth = freezed,Object? gender = freezed,Object? maritalStatus = freezed,}) {
  return _then(_PersonalInfo(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,maritalStatus: freezed == maritalStatus ? _self.maritalStatus : maritalStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
