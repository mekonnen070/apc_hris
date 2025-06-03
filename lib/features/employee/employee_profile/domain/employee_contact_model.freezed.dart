// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeContactModel {

 String? get contactId; String get employeeId; String get fullName; RelationTypes get relationship; String? get address; String get phone; String? get mobile; String? get email; bool get isPrimary; bool get isActive; String? get createdBy; DateTime? get createdDate;// Changed to nullable to align with typical backend generation
 String? get modifiedBy; DateTime? get modifiedDate;
/// Create a copy of EmployeeContactModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeContactModelCopyWith<EmployeeContactModel> get copyWith => _$EmployeeContactModelCopyWithImpl<EmployeeContactModel>(this as EmployeeContactModel, _$identity);

  /// Serializes this EmployeeContactModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeContactModel&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.modifiedDate, modifiedDate) || other.modifiedDate == modifiedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,employeeId,fullName,relationship,address,phone,mobile,email,isPrimary,isActive,createdBy,createdDate,modifiedBy,modifiedDate);

@override
String toString() {
  return 'EmployeeContactModel(contactId: $contactId, employeeId: $employeeId, fullName: $fullName, relationship: $relationship, address: $address, phone: $phone, mobile: $mobile, email: $email, isPrimary: $isPrimary, isActive: $isActive, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate)';
}


}

/// @nodoc
abstract mixin class $EmployeeContactModelCopyWith<$Res>  {
  factory $EmployeeContactModelCopyWith(EmployeeContactModel value, $Res Function(EmployeeContactModel) _then) = _$EmployeeContactModelCopyWithImpl;
@useResult
$Res call({
 String? contactId, String employeeId, String fullName, RelationTypes relationship, String? address, String phone, String? mobile, String? email, bool isPrimary, bool isActive, String? createdBy, DateTime? createdDate, String? modifiedBy, DateTime? modifiedDate
});




}
/// @nodoc
class _$EmployeeContactModelCopyWithImpl<$Res>
    implements $EmployeeContactModelCopyWith<$Res> {
  _$EmployeeContactModelCopyWithImpl(this._self, this._then);

  final EmployeeContactModel _self;
  final $Res Function(EmployeeContactModel) _then;

/// Create a copy of EmployeeContactModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contactId = freezed,Object? employeeId = null,Object? fullName = null,Object? relationship = null,Object? address = freezed,Object? phone = null,Object? mobile = freezed,Object? email = freezed,Object? isPrimary = null,Object? isActive = null,Object? createdBy = freezed,Object? createdDate = freezed,Object? modifiedBy = freezed,Object? modifiedDate = freezed,}) {
  return _then(_self.copyWith(
contactId: freezed == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as RelationTypes,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,modifiedDate: freezed == modifiedDate ? _self.modifiedDate : modifiedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EmployeeContactModel implements EmployeeContactModel {
  const _EmployeeContactModel({this.contactId, required this.employeeId, required this.fullName, required this.relationship, this.address, required this.phone, this.mobile, this.email, this.isPrimary = false, this.isActive = true, this.createdBy, this.createdDate, this.modifiedBy, this.modifiedDate});
  factory _EmployeeContactModel.fromJson(Map<String, dynamic> json) => _$EmployeeContactModelFromJson(json);

@override final  String? contactId;
@override final  String employeeId;
@override final  String fullName;
@override final  RelationTypes relationship;
@override final  String? address;
@override final  String phone;
@override final  String? mobile;
@override final  String? email;
@override@JsonKey() final  bool isPrimary;
@override@JsonKey() final  bool isActive;
@override final  String? createdBy;
@override final  DateTime? createdDate;
// Changed to nullable to align with typical backend generation
@override final  String? modifiedBy;
@override final  DateTime? modifiedDate;

/// Create a copy of EmployeeContactModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeContactModelCopyWith<_EmployeeContactModel> get copyWith => __$EmployeeContactModelCopyWithImpl<_EmployeeContactModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeContactModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeContactModel&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.modifiedDate, modifiedDate) || other.modifiedDate == modifiedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,employeeId,fullName,relationship,address,phone,mobile,email,isPrimary,isActive,createdBy,createdDate,modifiedBy,modifiedDate);

@override
String toString() {
  return 'EmployeeContactModel(contactId: $contactId, employeeId: $employeeId, fullName: $fullName, relationship: $relationship, address: $address, phone: $phone, mobile: $mobile, email: $email, isPrimary: $isPrimary, isActive: $isActive, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate)';
}


}

/// @nodoc
abstract mixin class _$EmployeeContactModelCopyWith<$Res> implements $EmployeeContactModelCopyWith<$Res> {
  factory _$EmployeeContactModelCopyWith(_EmployeeContactModel value, $Res Function(_EmployeeContactModel) _then) = __$EmployeeContactModelCopyWithImpl;
@override @useResult
$Res call({
 String? contactId, String employeeId, String fullName, RelationTypes relationship, String? address, String phone, String? mobile, String? email, bool isPrimary, bool isActive, String? createdBy, DateTime? createdDate, String? modifiedBy, DateTime? modifiedDate
});




}
/// @nodoc
class __$EmployeeContactModelCopyWithImpl<$Res>
    implements _$EmployeeContactModelCopyWith<$Res> {
  __$EmployeeContactModelCopyWithImpl(this._self, this._then);

  final _EmployeeContactModel _self;
  final $Res Function(_EmployeeContactModel) _then;

/// Create a copy of EmployeeContactModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contactId = freezed,Object? employeeId = null,Object? fullName = null,Object? relationship = null,Object? address = freezed,Object? phone = null,Object? mobile = freezed,Object? email = freezed,Object? isPrimary = null,Object? isActive = null,Object? createdBy = freezed,Object? createdDate = freezed,Object? modifiedBy = freezed,Object? modifiedDate = freezed,}) {
  return _then(_EmployeeContactModel(
contactId: freezed == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as RelationTypes,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,modifiedDate: freezed == modifiedDate ? _self.modifiedDate : modifiedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
