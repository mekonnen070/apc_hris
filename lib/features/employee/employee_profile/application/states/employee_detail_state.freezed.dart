// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeDetailState {

// The core data of the employee being viewed.
 EmployeeInfoModel get employeeData;// True if actively fetching fresh data for the current employee.
 bool get isLoading;// True if a delete operation is in progress.
 bool get isDeleting;// General error message, e.g., from a failed refresh.
 String? get errorMessage;// Message to show upon successful deletion.
 String? get deleteSuccessMessage;// Message to show if deletion fails.
 String? get deleteErrorMessage;
/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeDetailStateCopyWith<EmployeeDetailState> get copyWith => _$EmployeeDetailStateCopyWithImpl<EmployeeDetailState>(this as EmployeeDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDetailState&&(identical(other.employeeData, employeeData) || other.employeeData == employeeData)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.deleteSuccessMessage, deleteSuccessMessage) || other.deleteSuccessMessage == deleteSuccessMessage)&&(identical(other.deleteErrorMessage, deleteErrorMessage) || other.deleteErrorMessage == deleteErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,employeeData,isLoading,isDeleting,errorMessage,deleteSuccessMessage,deleteErrorMessage);

@override
String toString() {
  return 'EmployeeDetailState(employeeData: $employeeData, isLoading: $isLoading, isDeleting: $isDeleting, errorMessage: $errorMessage, deleteSuccessMessage: $deleteSuccessMessage, deleteErrorMessage: $deleteErrorMessage)';
}


}

/// @nodoc
abstract mixin class $EmployeeDetailStateCopyWith<$Res>  {
  factory $EmployeeDetailStateCopyWith(EmployeeDetailState value, $Res Function(EmployeeDetailState) _then) = _$EmployeeDetailStateCopyWithImpl;
@useResult
$Res call({
 EmployeeInfoModel employeeData, bool isLoading, bool isDeleting, String? errorMessage, String? deleteSuccessMessage, String? deleteErrorMessage
});


$EmployeeInfoModelCopyWith<$Res> get employeeData;

}
/// @nodoc
class _$EmployeeDetailStateCopyWithImpl<$Res>
    implements $EmployeeDetailStateCopyWith<$Res> {
  _$EmployeeDetailStateCopyWithImpl(this._self, this._then);

  final EmployeeDetailState _self;
  final $Res Function(EmployeeDetailState) _then;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? employeeData = null,Object? isLoading = null,Object? isDeleting = null,Object? errorMessage = freezed,Object? deleteSuccessMessage = freezed,Object? deleteErrorMessage = freezed,}) {
  return _then(_self.copyWith(
employeeData: null == employeeData ? _self.employeeData : employeeData // ignore: cast_nullable_to_non_nullable
as EmployeeInfoModel,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,deleteSuccessMessage: freezed == deleteSuccessMessage ? _self.deleteSuccessMessage : deleteSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,deleteErrorMessage: freezed == deleteErrorMessage ? _self.deleteErrorMessage : deleteErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeInfoModelCopyWith<$Res> get employeeData {
  
  return $EmployeeInfoModelCopyWith<$Res>(_self.employeeData, (value) {
    return _then(_self.copyWith(employeeData: value));
  });
}
}


/// @nodoc


class _EmployeeDetailState implements EmployeeDetailState {
  const _EmployeeDetailState({required this.employeeData, this.isLoading = false, this.isDeleting = false, this.errorMessage, this.deleteSuccessMessage, this.deleteErrorMessage});
  

// The core data of the employee being viewed.
@override final  EmployeeInfoModel employeeData;
// True if actively fetching fresh data for the current employee.
@override@JsonKey() final  bool isLoading;
// True if a delete operation is in progress.
@override@JsonKey() final  bool isDeleting;
// General error message, e.g., from a failed refresh.
@override final  String? errorMessage;
// Message to show upon successful deletion.
@override final  String? deleteSuccessMessage;
// Message to show if deletion fails.
@override final  String? deleteErrorMessage;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeDetailStateCopyWith<_EmployeeDetailState> get copyWith => __$EmployeeDetailStateCopyWithImpl<_EmployeeDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeDetailState&&(identical(other.employeeData, employeeData) || other.employeeData == employeeData)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.deleteSuccessMessage, deleteSuccessMessage) || other.deleteSuccessMessage == deleteSuccessMessage)&&(identical(other.deleteErrorMessage, deleteErrorMessage) || other.deleteErrorMessage == deleteErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,employeeData,isLoading,isDeleting,errorMessage,deleteSuccessMessage,deleteErrorMessage);

@override
String toString() {
  return 'EmployeeDetailState(employeeData: $employeeData, isLoading: $isLoading, isDeleting: $isDeleting, errorMessage: $errorMessage, deleteSuccessMessage: $deleteSuccessMessage, deleteErrorMessage: $deleteErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$EmployeeDetailStateCopyWith<$Res> implements $EmployeeDetailStateCopyWith<$Res> {
  factory _$EmployeeDetailStateCopyWith(_EmployeeDetailState value, $Res Function(_EmployeeDetailState) _then) = __$EmployeeDetailStateCopyWithImpl;
@override @useResult
$Res call({
 EmployeeInfoModel employeeData, bool isLoading, bool isDeleting, String? errorMessage, String? deleteSuccessMessage, String? deleteErrorMessage
});


@override $EmployeeInfoModelCopyWith<$Res> get employeeData;

}
/// @nodoc
class __$EmployeeDetailStateCopyWithImpl<$Res>
    implements _$EmployeeDetailStateCopyWith<$Res> {
  __$EmployeeDetailStateCopyWithImpl(this._self, this._then);

  final _EmployeeDetailState _self;
  final $Res Function(_EmployeeDetailState) _then;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? employeeData = null,Object? isLoading = null,Object? isDeleting = null,Object? errorMessage = freezed,Object? deleteSuccessMessage = freezed,Object? deleteErrorMessage = freezed,}) {
  return _then(_EmployeeDetailState(
employeeData: null == employeeData ? _self.employeeData : employeeData // ignore: cast_nullable_to_non_nullable
as EmployeeInfoModel,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,deleteSuccessMessage: freezed == deleteSuccessMessage ? _self.deleteSuccessMessage : deleteSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,deleteErrorMessage: freezed == deleteErrorMessage ? _self.deleteErrorMessage : deleteErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeInfoModelCopyWith<$Res> get employeeData {
  
  return $EmployeeInfoModelCopyWith<$Res>(_self.employeeData, (value) {
    return _then(_self.copyWith(employeeData: value));
  });
}
}

// dart format on
