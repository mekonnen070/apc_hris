// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_spouse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeSpouseModel {

 String? get spouseId;// C# is not nullable but has Guid.NewGuid().ToString() in comment
 String get employeeId; StaffTitle? get title;// Title of spouse (e.g., Mr., Mrs.)
 String get spouseFullName; Gender get gender;// Added based on C# properties
 DateTime get spouseBirthDate; String? get spousePhone;// C# is not nullable, made nullable as it might be optional
 String? get spouseOccupation;// C# is not nullable, made nullable
 String? get motherName;// C# is not nullable, made nullable
 String get address; DateTime? get anniversaryDate;// C# is not nullable, made nullable
 String? get retirementNumber;// C# is not nullable, made nullable
 String? get tin;
/// Create a copy of EmployeeSpouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeSpouseModelCopyWith<EmployeeSpouseModel> get copyWith => _$EmployeeSpouseModelCopyWithImpl<EmployeeSpouseModel>(this as EmployeeSpouseModel, _$identity);

  /// Serializes this EmployeeSpouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeSpouseModel&&(identical(other.spouseId, spouseId) || other.spouseId == spouseId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.spouseFullName, spouseFullName) || other.spouseFullName == spouseFullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.spouseBirthDate, spouseBirthDate) || other.spouseBirthDate == spouseBirthDate)&&(identical(other.spousePhone, spousePhone) || other.spousePhone == spousePhone)&&(identical(other.spouseOccupation, spouseOccupation) || other.spouseOccupation == spouseOccupation)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.address, address) || other.address == address)&&(identical(other.anniversaryDate, anniversaryDate) || other.anniversaryDate == anniversaryDate)&&(identical(other.retirementNumber, retirementNumber) || other.retirementNumber == retirementNumber)&&(identical(other.tin, tin) || other.tin == tin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,spouseId,employeeId,title,spouseFullName,gender,spouseBirthDate,spousePhone,spouseOccupation,motherName,address,anniversaryDate,retirementNumber,tin);

@override
String toString() {
  return 'EmployeeSpouseModel(spouseId: $spouseId, employeeId: $employeeId, title: $title, spouseFullName: $spouseFullName, gender: $gender, spouseBirthDate: $spouseBirthDate, spousePhone: $spousePhone, spouseOccupation: $spouseOccupation, motherName: $motherName, address: $address, anniversaryDate: $anniversaryDate, retirementNumber: $retirementNumber, tin: $tin)';
}


}

/// @nodoc
abstract mixin class $EmployeeSpouseModelCopyWith<$Res>  {
  factory $EmployeeSpouseModelCopyWith(EmployeeSpouseModel value, $Res Function(EmployeeSpouseModel) _then) = _$EmployeeSpouseModelCopyWithImpl;
@useResult
$Res call({
 String? spouseId, String employeeId, StaffTitle? title, String spouseFullName, Gender gender, DateTime spouseBirthDate, String? spousePhone, String? spouseOccupation, String? motherName, String address, DateTime? anniversaryDate, String? retirementNumber, String? tin
});




}
/// @nodoc
class _$EmployeeSpouseModelCopyWithImpl<$Res>
    implements $EmployeeSpouseModelCopyWith<$Res> {
  _$EmployeeSpouseModelCopyWithImpl(this._self, this._then);

  final EmployeeSpouseModel _self;
  final $Res Function(EmployeeSpouseModel) _then;

/// Create a copy of EmployeeSpouseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? spouseId = freezed,Object? employeeId = null,Object? title = freezed,Object? spouseFullName = null,Object? gender = null,Object? spouseBirthDate = null,Object? spousePhone = freezed,Object? spouseOccupation = freezed,Object? motherName = freezed,Object? address = null,Object? anniversaryDate = freezed,Object? retirementNumber = freezed,Object? tin = freezed,}) {
  return _then(_self.copyWith(
spouseId: freezed == spouseId ? _self.spouseId : spouseId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as StaffTitle?,spouseFullName: null == spouseFullName ? _self.spouseFullName : spouseFullName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,spouseBirthDate: null == spouseBirthDate ? _self.spouseBirthDate : spouseBirthDate // ignore: cast_nullable_to_non_nullable
as DateTime,spousePhone: freezed == spousePhone ? _self.spousePhone : spousePhone // ignore: cast_nullable_to_non_nullable
as String?,spouseOccupation: freezed == spouseOccupation ? _self.spouseOccupation : spouseOccupation // ignore: cast_nullable_to_non_nullable
as String?,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,anniversaryDate: freezed == anniversaryDate ? _self.anniversaryDate : anniversaryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,retirementNumber: freezed == retirementNumber ? _self.retirementNumber : retirementNumber // ignore: cast_nullable_to_non_nullable
as String?,tin: freezed == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeeSpouseModel].
extension EmployeeSpouseModelPatterns on EmployeeSpouseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeSpouseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeSpouseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeSpouseModel value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeSpouseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeSpouseModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeSpouseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? spouseId,  String employeeId,  StaffTitle? title,  String spouseFullName,  Gender gender,  DateTime spouseBirthDate,  String? spousePhone,  String? spouseOccupation,  String? motherName,  String address,  DateTime? anniversaryDate,  String? retirementNumber,  String? tin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeSpouseModel() when $default != null:
return $default(_that.spouseId,_that.employeeId,_that.title,_that.spouseFullName,_that.gender,_that.spouseBirthDate,_that.spousePhone,_that.spouseOccupation,_that.motherName,_that.address,_that.anniversaryDate,_that.retirementNumber,_that.tin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? spouseId,  String employeeId,  StaffTitle? title,  String spouseFullName,  Gender gender,  DateTime spouseBirthDate,  String? spousePhone,  String? spouseOccupation,  String? motherName,  String address,  DateTime? anniversaryDate,  String? retirementNumber,  String? tin)  $default,) {final _that = this;
switch (_that) {
case _EmployeeSpouseModel():
return $default(_that.spouseId,_that.employeeId,_that.title,_that.spouseFullName,_that.gender,_that.spouseBirthDate,_that.spousePhone,_that.spouseOccupation,_that.motherName,_that.address,_that.anniversaryDate,_that.retirementNumber,_that.tin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? spouseId,  String employeeId,  StaffTitle? title,  String spouseFullName,  Gender gender,  DateTime spouseBirthDate,  String? spousePhone,  String? spouseOccupation,  String? motherName,  String address,  DateTime? anniversaryDate,  String? retirementNumber,  String? tin)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeSpouseModel() when $default != null:
return $default(_that.spouseId,_that.employeeId,_that.title,_that.spouseFullName,_that.gender,_that.spouseBirthDate,_that.spousePhone,_that.spouseOccupation,_that.motherName,_that.address,_that.anniversaryDate,_that.retirementNumber,_that.tin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmployeeSpouseModel implements EmployeeSpouseModel {
  const _EmployeeSpouseModel({this.spouseId, required this.employeeId, this.title, required this.spouseFullName, required this.gender, required this.spouseBirthDate, this.spousePhone, this.spouseOccupation, this.motherName, required this.address, this.anniversaryDate, this.retirementNumber, this.tin});
  factory _EmployeeSpouseModel.fromJson(Map<String, dynamic> json) => _$EmployeeSpouseModelFromJson(json);

@override final  String? spouseId;
// C# is not nullable but has Guid.NewGuid().ToString() in comment
@override final  String employeeId;
@override final  StaffTitle? title;
// Title of spouse (e.g., Mr., Mrs.)
@override final  String spouseFullName;
@override final  Gender gender;
// Added based on C# properties
@override final  DateTime spouseBirthDate;
@override final  String? spousePhone;
// C# is not nullable, made nullable as it might be optional
@override final  String? spouseOccupation;
// C# is not nullable, made nullable
@override final  String? motherName;
// C# is not nullable, made nullable
@override final  String address;
@override final  DateTime? anniversaryDate;
// C# is not nullable, made nullable
@override final  String? retirementNumber;
// C# is not nullable, made nullable
@override final  String? tin;

/// Create a copy of EmployeeSpouseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeSpouseModelCopyWith<_EmployeeSpouseModel> get copyWith => __$EmployeeSpouseModelCopyWithImpl<_EmployeeSpouseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeSpouseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeSpouseModel&&(identical(other.spouseId, spouseId) || other.spouseId == spouseId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.spouseFullName, spouseFullName) || other.spouseFullName == spouseFullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.spouseBirthDate, spouseBirthDate) || other.spouseBirthDate == spouseBirthDate)&&(identical(other.spousePhone, spousePhone) || other.spousePhone == spousePhone)&&(identical(other.spouseOccupation, spouseOccupation) || other.spouseOccupation == spouseOccupation)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.address, address) || other.address == address)&&(identical(other.anniversaryDate, anniversaryDate) || other.anniversaryDate == anniversaryDate)&&(identical(other.retirementNumber, retirementNumber) || other.retirementNumber == retirementNumber)&&(identical(other.tin, tin) || other.tin == tin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,spouseId,employeeId,title,spouseFullName,gender,spouseBirthDate,spousePhone,spouseOccupation,motherName,address,anniversaryDate,retirementNumber,tin);

@override
String toString() {
  return 'EmployeeSpouseModel(spouseId: $spouseId, employeeId: $employeeId, title: $title, spouseFullName: $spouseFullName, gender: $gender, spouseBirthDate: $spouseBirthDate, spousePhone: $spousePhone, spouseOccupation: $spouseOccupation, motherName: $motherName, address: $address, anniversaryDate: $anniversaryDate, retirementNumber: $retirementNumber, tin: $tin)';
}


}

/// @nodoc
abstract mixin class _$EmployeeSpouseModelCopyWith<$Res> implements $EmployeeSpouseModelCopyWith<$Res> {
  factory _$EmployeeSpouseModelCopyWith(_EmployeeSpouseModel value, $Res Function(_EmployeeSpouseModel) _then) = __$EmployeeSpouseModelCopyWithImpl;
@override @useResult
$Res call({
 String? spouseId, String employeeId, StaffTitle? title, String spouseFullName, Gender gender, DateTime spouseBirthDate, String? spousePhone, String? spouseOccupation, String? motherName, String address, DateTime? anniversaryDate, String? retirementNumber, String? tin
});




}
/// @nodoc
class __$EmployeeSpouseModelCopyWithImpl<$Res>
    implements _$EmployeeSpouseModelCopyWith<$Res> {
  __$EmployeeSpouseModelCopyWithImpl(this._self, this._then);

  final _EmployeeSpouseModel _self;
  final $Res Function(_EmployeeSpouseModel) _then;

/// Create a copy of EmployeeSpouseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? spouseId = freezed,Object? employeeId = null,Object? title = freezed,Object? spouseFullName = null,Object? gender = null,Object? spouseBirthDate = null,Object? spousePhone = freezed,Object? spouseOccupation = freezed,Object? motherName = freezed,Object? address = null,Object? anniversaryDate = freezed,Object? retirementNumber = freezed,Object? tin = freezed,}) {
  return _then(_EmployeeSpouseModel(
spouseId: freezed == spouseId ? _self.spouseId : spouseId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as StaffTitle?,spouseFullName: null == spouseFullName ? _self.spouseFullName : spouseFullName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,spouseBirthDate: null == spouseBirthDate ? _self.spouseBirthDate : spouseBirthDate // ignore: cast_nullable_to_non_nullable
as DateTime,spousePhone: freezed == spousePhone ? _self.spousePhone : spousePhone // ignore: cast_nullable_to_non_nullable
as String?,spouseOccupation: freezed == spouseOccupation ? _self.spouseOccupation : spouseOccupation // ignore: cast_nullable_to_non_nullable
as String?,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,anniversaryDate: freezed == anniversaryDate ? _self.anniversaryDate : anniversaryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,retirementNumber: freezed == retirementNumber ? _self.retirementNumber : retirementNumber // ignore: cast_nullable_to_non_nullable
as String?,tin: freezed == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
