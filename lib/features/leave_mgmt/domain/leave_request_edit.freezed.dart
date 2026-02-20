// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_request_edit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveRequestEdit {

 int get leaveRequestId; String get leaveTypeId; String get employeeId; DateTime get startDate; DateTime get endDate; int get numOfDays; String get requestReason; DateTime get requestDate; LeaveRequestStatus get requestStatus; String? get comment; String? get approvedBy; String? get rejectedBy; DateTime? get actionedDate;
/// Create a copy of LeaveRequestEdit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveRequestEditCopyWith<LeaveRequestEdit> get copyWith => _$LeaveRequestEditCopyWithImpl<LeaveRequestEdit>(this as LeaveRequestEdit, _$identity);

  /// Serializes this LeaveRequestEdit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveRequestEdit&&(identical(other.leaveRequestId, leaveRequestId) || other.leaveRequestId == leaveRequestId)&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.numOfDays, numOfDays) || other.numOfDays == numOfDays)&&(identical(other.requestReason, requestReason) || other.requestReason == requestReason)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.rejectedBy, rejectedBy) || other.rejectedBy == rejectedBy)&&(identical(other.actionedDate, actionedDate) || other.actionedDate == actionedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveRequestId,leaveTypeId,employeeId,startDate,endDate,numOfDays,requestReason,requestDate,requestStatus,comment,approvedBy,rejectedBy,actionedDate);

@override
String toString() {
  return 'LeaveRequestEdit(leaveRequestId: $leaveRequestId, leaveTypeId: $leaveTypeId, employeeId: $employeeId, startDate: $startDate, endDate: $endDate, numOfDays: $numOfDays, requestReason: $requestReason, requestDate: $requestDate, requestStatus: $requestStatus, comment: $comment, approvedBy: $approvedBy, rejectedBy: $rejectedBy, actionedDate: $actionedDate)';
}


}

/// @nodoc
abstract mixin class $LeaveRequestEditCopyWith<$Res>  {
  factory $LeaveRequestEditCopyWith(LeaveRequestEdit value, $Res Function(LeaveRequestEdit) _then) = _$LeaveRequestEditCopyWithImpl;
@useResult
$Res call({
 int leaveRequestId, String leaveTypeId, String employeeId, DateTime startDate, DateTime endDate, int numOfDays, String requestReason, DateTime requestDate, LeaveRequestStatus requestStatus, String? comment, String? approvedBy, String? rejectedBy, DateTime? actionedDate
});




}
/// @nodoc
class _$LeaveRequestEditCopyWithImpl<$Res>
    implements $LeaveRequestEditCopyWith<$Res> {
  _$LeaveRequestEditCopyWithImpl(this._self, this._then);

  final LeaveRequestEdit _self;
  final $Res Function(LeaveRequestEdit) _then;

/// Create a copy of LeaveRequestEdit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveRequestId = null,Object? leaveTypeId = null,Object? employeeId = null,Object? startDate = null,Object? endDate = null,Object? numOfDays = null,Object? requestReason = null,Object? requestDate = null,Object? requestStatus = null,Object? comment = freezed,Object? approvedBy = freezed,Object? rejectedBy = freezed,Object? actionedDate = freezed,}) {
  return _then(_self.copyWith(
leaveRequestId: null == leaveRequestId ? _self.leaveRequestId : leaveRequestId // ignore: cast_nullable_to_non_nullable
as int,leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,numOfDays: null == numOfDays ? _self.numOfDays : numOfDays // ignore: cast_nullable_to_non_nullable
as int,requestReason: null == requestReason ? _self.requestReason : requestReason // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as LeaveRequestStatus,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,rejectedBy: freezed == rejectedBy ? _self.rejectedBy : rejectedBy // ignore: cast_nullable_to_non_nullable
as String?,actionedDate: freezed == actionedDate ? _self.actionedDate : actionedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaveRequestEdit].
extension LeaveRequestEditPatterns on LeaveRequestEdit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaveRequestEdit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaveRequestEdit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaveRequestEdit value)  $default,){
final _that = this;
switch (_that) {
case _LeaveRequestEdit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaveRequestEdit value)?  $default,){
final _that = this;
switch (_that) {
case _LeaveRequestEdit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int leaveRequestId,  String leaveTypeId,  String employeeId,  DateTime startDate,  DateTime endDate,  int numOfDays,  String requestReason,  DateTime requestDate,  LeaveRequestStatus requestStatus,  String? comment,  String? approvedBy,  String? rejectedBy,  DateTime? actionedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaveRequestEdit() when $default != null:
return $default(_that.leaveRequestId,_that.leaveTypeId,_that.employeeId,_that.startDate,_that.endDate,_that.numOfDays,_that.requestReason,_that.requestDate,_that.requestStatus,_that.comment,_that.approvedBy,_that.rejectedBy,_that.actionedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int leaveRequestId,  String leaveTypeId,  String employeeId,  DateTime startDate,  DateTime endDate,  int numOfDays,  String requestReason,  DateTime requestDate,  LeaveRequestStatus requestStatus,  String? comment,  String? approvedBy,  String? rejectedBy,  DateTime? actionedDate)  $default,) {final _that = this;
switch (_that) {
case _LeaveRequestEdit():
return $default(_that.leaveRequestId,_that.leaveTypeId,_that.employeeId,_that.startDate,_that.endDate,_that.numOfDays,_that.requestReason,_that.requestDate,_that.requestStatus,_that.comment,_that.approvedBy,_that.rejectedBy,_that.actionedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int leaveRequestId,  String leaveTypeId,  String employeeId,  DateTime startDate,  DateTime endDate,  int numOfDays,  String requestReason,  DateTime requestDate,  LeaveRequestStatus requestStatus,  String? comment,  String? approvedBy,  String? rejectedBy,  DateTime? actionedDate)?  $default,) {final _that = this;
switch (_that) {
case _LeaveRequestEdit() when $default != null:
return $default(_that.leaveRequestId,_that.leaveTypeId,_that.employeeId,_that.startDate,_that.endDate,_that.numOfDays,_that.requestReason,_that.requestDate,_that.requestStatus,_that.comment,_that.approvedBy,_that.rejectedBy,_that.actionedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaveRequestEdit implements LeaveRequestEdit {
   _LeaveRequestEdit({required this.leaveRequestId, required this.leaveTypeId, required this.employeeId, required this.startDate, required this.endDate, required this.numOfDays, required this.requestReason, required this.requestDate, required this.requestStatus, this.comment, this.approvedBy, this.rejectedBy, this.actionedDate});
  factory _LeaveRequestEdit.fromJson(Map<String, dynamic> json) => _$LeaveRequestEditFromJson(json);

@override final  int leaveRequestId;
@override final  String leaveTypeId;
@override final  String employeeId;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  int numOfDays;
@override final  String requestReason;
@override final  DateTime requestDate;
@override final  LeaveRequestStatus requestStatus;
@override final  String? comment;
@override final  String? approvedBy;
@override final  String? rejectedBy;
@override final  DateTime? actionedDate;

/// Create a copy of LeaveRequestEdit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveRequestEditCopyWith<_LeaveRequestEdit> get copyWith => __$LeaveRequestEditCopyWithImpl<_LeaveRequestEdit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveRequestEditToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveRequestEdit&&(identical(other.leaveRequestId, leaveRequestId) || other.leaveRequestId == leaveRequestId)&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.numOfDays, numOfDays) || other.numOfDays == numOfDays)&&(identical(other.requestReason, requestReason) || other.requestReason == requestReason)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.rejectedBy, rejectedBy) || other.rejectedBy == rejectedBy)&&(identical(other.actionedDate, actionedDate) || other.actionedDate == actionedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveRequestId,leaveTypeId,employeeId,startDate,endDate,numOfDays,requestReason,requestDate,requestStatus,comment,approvedBy,rejectedBy,actionedDate);

@override
String toString() {
  return 'LeaveRequestEdit(leaveRequestId: $leaveRequestId, leaveTypeId: $leaveTypeId, employeeId: $employeeId, startDate: $startDate, endDate: $endDate, numOfDays: $numOfDays, requestReason: $requestReason, requestDate: $requestDate, requestStatus: $requestStatus, comment: $comment, approvedBy: $approvedBy, rejectedBy: $rejectedBy, actionedDate: $actionedDate)';
}


}

/// @nodoc
abstract mixin class _$LeaveRequestEditCopyWith<$Res> implements $LeaveRequestEditCopyWith<$Res> {
  factory _$LeaveRequestEditCopyWith(_LeaveRequestEdit value, $Res Function(_LeaveRequestEdit) _then) = __$LeaveRequestEditCopyWithImpl;
@override @useResult
$Res call({
 int leaveRequestId, String leaveTypeId, String employeeId, DateTime startDate, DateTime endDate, int numOfDays, String requestReason, DateTime requestDate, LeaveRequestStatus requestStatus, String? comment, String? approvedBy, String? rejectedBy, DateTime? actionedDate
});




}
/// @nodoc
class __$LeaveRequestEditCopyWithImpl<$Res>
    implements _$LeaveRequestEditCopyWith<$Res> {
  __$LeaveRequestEditCopyWithImpl(this._self, this._then);

  final _LeaveRequestEdit _self;
  final $Res Function(_LeaveRequestEdit) _then;

/// Create a copy of LeaveRequestEdit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveRequestId = null,Object? leaveTypeId = null,Object? employeeId = null,Object? startDate = null,Object? endDate = null,Object? numOfDays = null,Object? requestReason = null,Object? requestDate = null,Object? requestStatus = null,Object? comment = freezed,Object? approvedBy = freezed,Object? rejectedBy = freezed,Object? actionedDate = freezed,}) {
  return _then(_LeaveRequestEdit(
leaveRequestId: null == leaveRequestId ? _self.leaveRequestId : leaveRequestId // ignore: cast_nullable_to_non_nullable
as int,leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,numOfDays: null == numOfDays ? _self.numOfDays : numOfDays // ignore: cast_nullable_to_non_nullable
as int,requestReason: null == requestReason ? _self.requestReason : requestReason // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as LeaveRequestStatus,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,rejectedBy: freezed == rejectedBy ? _self.rejectedBy : rejectedBy // ignore: cast_nullable_to_non_nullable
as String?,actionedDate: freezed == actionedDate ? _self.actionedDate : actionedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
