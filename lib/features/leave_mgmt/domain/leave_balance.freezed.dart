// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveBalance {

 int get leaveBalanceId; String get employeeId; String get leaveTypeId; int get budgetYear; int get totalDays; int get usedDays; int get balance;
/// Create a copy of LeaveBalance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveBalanceCopyWith<LeaveBalance> get copyWith => _$LeaveBalanceCopyWithImpl<LeaveBalance>(this as LeaveBalance, _$identity);

  /// Serializes this LeaveBalance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveBalance&&(identical(other.leaveBalanceId, leaveBalanceId) || other.leaveBalanceId == leaveBalanceId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.budgetYear, budgetYear) || other.budgetYear == budgetYear)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.usedDays, usedDays) || other.usedDays == usedDays)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveBalanceId,employeeId,leaveTypeId,budgetYear,totalDays,usedDays,balance);

@override
String toString() {
  return 'LeaveBalance(leaveBalanceId: $leaveBalanceId, employeeId: $employeeId, leaveTypeId: $leaveTypeId, budgetYear: $budgetYear, totalDays: $totalDays, usedDays: $usedDays, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $LeaveBalanceCopyWith<$Res>  {
  factory $LeaveBalanceCopyWith(LeaveBalance value, $Res Function(LeaveBalance) _then) = _$LeaveBalanceCopyWithImpl;
@useResult
$Res call({
 int leaveBalanceId, String employeeId, String leaveTypeId, int budgetYear, int totalDays, int usedDays, int balance
});




}
/// @nodoc
class _$LeaveBalanceCopyWithImpl<$Res>
    implements $LeaveBalanceCopyWith<$Res> {
  _$LeaveBalanceCopyWithImpl(this._self, this._then);

  final LeaveBalance _self;
  final $Res Function(LeaveBalance) _then;

/// Create a copy of LeaveBalance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveBalanceId = null,Object? employeeId = null,Object? leaveTypeId = null,Object? budgetYear = null,Object? totalDays = null,Object? usedDays = null,Object? balance = null,}) {
  return _then(_self.copyWith(
leaveBalanceId: null == leaveBalanceId ? _self.leaveBalanceId : leaveBalanceId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,budgetYear: null == budgetYear ? _self.budgetYear : budgetYear // ignore: cast_nullable_to_non_nullable
as int,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,usedDays: null == usedDays ? _self.usedDays : usedDays // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LeaveBalance implements LeaveBalance {
  const _LeaveBalance({required this.leaveBalanceId, required this.employeeId, required this.leaveTypeId, required this.budgetYear, required this.totalDays, required this.usedDays, required this.balance});
  factory _LeaveBalance.fromJson(Map<String, dynamic> json) => _$LeaveBalanceFromJson(json);

@override final  int leaveBalanceId;
@override final  String employeeId;
@override final  String leaveTypeId;
@override final  int budgetYear;
@override final  int totalDays;
@override final  int usedDays;
@override final  int balance;

/// Create a copy of LeaveBalance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveBalanceCopyWith<_LeaveBalance> get copyWith => __$LeaveBalanceCopyWithImpl<_LeaveBalance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveBalanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveBalance&&(identical(other.leaveBalanceId, leaveBalanceId) || other.leaveBalanceId == leaveBalanceId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.budgetYear, budgetYear) || other.budgetYear == budgetYear)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.usedDays, usedDays) || other.usedDays == usedDays)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveBalanceId,employeeId,leaveTypeId,budgetYear,totalDays,usedDays,balance);

@override
String toString() {
  return 'LeaveBalance(leaveBalanceId: $leaveBalanceId, employeeId: $employeeId, leaveTypeId: $leaveTypeId, budgetYear: $budgetYear, totalDays: $totalDays, usedDays: $usedDays, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$LeaveBalanceCopyWith<$Res> implements $LeaveBalanceCopyWith<$Res> {
  factory _$LeaveBalanceCopyWith(_LeaveBalance value, $Res Function(_LeaveBalance) _then) = __$LeaveBalanceCopyWithImpl;
@override @useResult
$Res call({
 int leaveBalanceId, String employeeId, String leaveTypeId, int budgetYear, int totalDays, int usedDays, int balance
});




}
/// @nodoc
class __$LeaveBalanceCopyWithImpl<$Res>
    implements _$LeaveBalanceCopyWith<$Res> {
  __$LeaveBalanceCopyWithImpl(this._self, this._then);

  final _LeaveBalance _self;
  final $Res Function(_LeaveBalance) _then;

/// Create a copy of LeaveBalance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveBalanceId = null,Object? employeeId = null,Object? leaveTypeId = null,Object? budgetYear = null,Object? totalDays = null,Object? usedDays = null,Object? balance = null,}) {
  return _then(_LeaveBalance(
leaveBalanceId: null == leaveBalanceId ? _self.leaveBalanceId : leaveBalanceId // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,budgetYear: null == budgetYear ? _self.budgetYear : budgetYear // ignore: cast_nullable_to_non_nullable
as int,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,usedDays: null == usedDays ? _self.usedDays : usedDays // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
