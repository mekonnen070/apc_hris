// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferRequestModel {

 String get id;// Unique request ID
 String get employeeId; String get employeeFullName;// For display convenience
 String get currentPositionTitle; String get currentDepartment; String get currentLocation;// e.g., Station Name or City
// Requested Destination
 String get requestedDepartment;// Could be a specific department ID or name
 String get requestedLocation;// Could be a specific location ID or name
 String? get requestedPositionTitle;// Optional: if applying for a known vacant position
 String get reasonForRequest; DateTime get requestDate; TransferRequestStatus get status; String? get managerComments; String? get hrComments; DateTime? get effectiveDate;// Date the transfer becomes active if approved
 DateTime? get lastUpdated;
/// Create a copy of TransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferRequestModelCopyWith<TransferRequestModel> get copyWith => _$TransferRequestModelCopyWithImpl<TransferRequestModel>(this as TransferRequestModel, _$identity);

  /// Serializes this TransferRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.employeeFullName, employeeFullName) || other.employeeFullName == employeeFullName)&&(identical(other.currentPositionTitle, currentPositionTitle) || other.currentPositionTitle == currentPositionTitle)&&(identical(other.currentDepartment, currentDepartment) || other.currentDepartment == currentDepartment)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.requestedDepartment, requestedDepartment) || other.requestedDepartment == requestedDepartment)&&(identical(other.requestedLocation, requestedLocation) || other.requestedLocation == requestedLocation)&&(identical(other.requestedPositionTitle, requestedPositionTitle) || other.requestedPositionTitle == requestedPositionTitle)&&(identical(other.reasonForRequest, reasonForRequest) || other.reasonForRequest == reasonForRequest)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.managerComments, managerComments) || other.managerComments == managerComments)&&(identical(other.hrComments, hrComments) || other.hrComments == hrComments)&&(identical(other.effectiveDate, effectiveDate) || other.effectiveDate == effectiveDate)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,employeeFullName,currentPositionTitle,currentDepartment,currentLocation,requestedDepartment,requestedLocation,requestedPositionTitle,reasonForRequest,requestDate,status,managerComments,hrComments,effectiveDate,lastUpdated);

@override
String toString() {
  return 'TransferRequestModel(id: $id, employeeId: $employeeId, employeeFullName: $employeeFullName, currentPositionTitle: $currentPositionTitle, currentDepartment: $currentDepartment, currentLocation: $currentLocation, requestedDepartment: $requestedDepartment, requestedLocation: $requestedLocation, requestedPositionTitle: $requestedPositionTitle, reasonForRequest: $reasonForRequest, requestDate: $requestDate, status: $status, managerComments: $managerComments, hrComments: $hrComments, effectiveDate: $effectiveDate, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $TransferRequestModelCopyWith<$Res>  {
  factory $TransferRequestModelCopyWith(TransferRequestModel value, $Res Function(TransferRequestModel) _then) = _$TransferRequestModelCopyWithImpl;
@useResult
$Res call({
 String id, String employeeId, String employeeFullName, String currentPositionTitle, String currentDepartment, String currentLocation, String requestedDepartment, String requestedLocation, String? requestedPositionTitle, String reasonForRequest, DateTime requestDate, TransferRequestStatus status, String? managerComments, String? hrComments, DateTime? effectiveDate, DateTime? lastUpdated
});




}
/// @nodoc
class _$TransferRequestModelCopyWithImpl<$Res>
    implements $TransferRequestModelCopyWith<$Res> {
  _$TransferRequestModelCopyWithImpl(this._self, this._then);

  final TransferRequestModel _self;
  final $Res Function(TransferRequestModel) _then;

/// Create a copy of TransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? employeeId = null,Object? employeeFullName = null,Object? currentPositionTitle = null,Object? currentDepartment = null,Object? currentLocation = null,Object? requestedDepartment = null,Object? requestedLocation = null,Object? requestedPositionTitle = freezed,Object? reasonForRequest = null,Object? requestDate = null,Object? status = null,Object? managerComments = freezed,Object? hrComments = freezed,Object? effectiveDate = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,employeeFullName: null == employeeFullName ? _self.employeeFullName : employeeFullName // ignore: cast_nullable_to_non_nullable
as String,currentPositionTitle: null == currentPositionTitle ? _self.currentPositionTitle : currentPositionTitle // ignore: cast_nullable_to_non_nullable
as String,currentDepartment: null == currentDepartment ? _self.currentDepartment : currentDepartment // ignore: cast_nullable_to_non_nullable
as String,currentLocation: null == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as String,requestedDepartment: null == requestedDepartment ? _self.requestedDepartment : requestedDepartment // ignore: cast_nullable_to_non_nullable
as String,requestedLocation: null == requestedLocation ? _self.requestedLocation : requestedLocation // ignore: cast_nullable_to_non_nullable
as String,requestedPositionTitle: freezed == requestedPositionTitle ? _self.requestedPositionTitle : requestedPositionTitle // ignore: cast_nullable_to_non_nullable
as String?,reasonForRequest: null == reasonForRequest ? _self.reasonForRequest : reasonForRequest // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransferRequestStatus,managerComments: freezed == managerComments ? _self.managerComments : managerComments // ignore: cast_nullable_to_non_nullable
as String?,hrComments: freezed == hrComments ? _self.hrComments : hrComments // ignore: cast_nullable_to_non_nullable
as String?,effectiveDate: freezed == effectiveDate ? _self.effectiveDate : effectiveDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransferRequestModel implements TransferRequestModel {
  const _TransferRequestModel({required this.id, required this.employeeId, required this.employeeFullName, required this.currentPositionTitle, required this.currentDepartment, required this.currentLocation, required this.requestedDepartment, required this.requestedLocation, this.requestedPositionTitle, required this.reasonForRequest, required this.requestDate, this.status = TransferRequestStatus.pendingManagerApproval, this.managerComments, this.hrComments, this.effectiveDate, this.lastUpdated});
  factory _TransferRequestModel.fromJson(Map<String, dynamic> json) => _$TransferRequestModelFromJson(json);

@override final  String id;
// Unique request ID
@override final  String employeeId;
@override final  String employeeFullName;
// For display convenience
@override final  String currentPositionTitle;
@override final  String currentDepartment;
@override final  String currentLocation;
// e.g., Station Name or City
// Requested Destination
@override final  String requestedDepartment;
// Could be a specific department ID or name
@override final  String requestedLocation;
// Could be a specific location ID or name
@override final  String? requestedPositionTitle;
// Optional: if applying for a known vacant position
@override final  String reasonForRequest;
@override final  DateTime requestDate;
@override@JsonKey() final  TransferRequestStatus status;
@override final  String? managerComments;
@override final  String? hrComments;
@override final  DateTime? effectiveDate;
// Date the transfer becomes active if approved
@override final  DateTime? lastUpdated;

/// Create a copy of TransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferRequestModelCopyWith<_TransferRequestModel> get copyWith => __$TransferRequestModelCopyWithImpl<_TransferRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.employeeFullName, employeeFullName) || other.employeeFullName == employeeFullName)&&(identical(other.currentPositionTitle, currentPositionTitle) || other.currentPositionTitle == currentPositionTitle)&&(identical(other.currentDepartment, currentDepartment) || other.currentDepartment == currentDepartment)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.requestedDepartment, requestedDepartment) || other.requestedDepartment == requestedDepartment)&&(identical(other.requestedLocation, requestedLocation) || other.requestedLocation == requestedLocation)&&(identical(other.requestedPositionTitle, requestedPositionTitle) || other.requestedPositionTitle == requestedPositionTitle)&&(identical(other.reasonForRequest, reasonForRequest) || other.reasonForRequest == reasonForRequest)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.managerComments, managerComments) || other.managerComments == managerComments)&&(identical(other.hrComments, hrComments) || other.hrComments == hrComments)&&(identical(other.effectiveDate, effectiveDate) || other.effectiveDate == effectiveDate)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,employeeFullName,currentPositionTitle,currentDepartment,currentLocation,requestedDepartment,requestedLocation,requestedPositionTitle,reasonForRequest,requestDate,status,managerComments,hrComments,effectiveDate,lastUpdated);

@override
String toString() {
  return 'TransferRequestModel(id: $id, employeeId: $employeeId, employeeFullName: $employeeFullName, currentPositionTitle: $currentPositionTitle, currentDepartment: $currentDepartment, currentLocation: $currentLocation, requestedDepartment: $requestedDepartment, requestedLocation: $requestedLocation, requestedPositionTitle: $requestedPositionTitle, reasonForRequest: $reasonForRequest, requestDate: $requestDate, status: $status, managerComments: $managerComments, hrComments: $hrComments, effectiveDate: $effectiveDate, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$TransferRequestModelCopyWith<$Res> implements $TransferRequestModelCopyWith<$Res> {
  factory _$TransferRequestModelCopyWith(_TransferRequestModel value, $Res Function(_TransferRequestModel) _then) = __$TransferRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String employeeId, String employeeFullName, String currentPositionTitle, String currentDepartment, String currentLocation, String requestedDepartment, String requestedLocation, String? requestedPositionTitle, String reasonForRequest, DateTime requestDate, TransferRequestStatus status, String? managerComments, String? hrComments, DateTime? effectiveDate, DateTime? lastUpdated
});




}
/// @nodoc
class __$TransferRequestModelCopyWithImpl<$Res>
    implements _$TransferRequestModelCopyWith<$Res> {
  __$TransferRequestModelCopyWithImpl(this._self, this._then);

  final _TransferRequestModel _self;
  final $Res Function(_TransferRequestModel) _then;

/// Create a copy of TransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? employeeId = null,Object? employeeFullName = null,Object? currentPositionTitle = null,Object? currentDepartment = null,Object? currentLocation = null,Object? requestedDepartment = null,Object? requestedLocation = null,Object? requestedPositionTitle = freezed,Object? reasonForRequest = null,Object? requestDate = null,Object? status = null,Object? managerComments = freezed,Object? hrComments = freezed,Object? effectiveDate = freezed,Object? lastUpdated = freezed,}) {
  return _then(_TransferRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,employeeFullName: null == employeeFullName ? _self.employeeFullName : employeeFullName // ignore: cast_nullable_to_non_nullable
as String,currentPositionTitle: null == currentPositionTitle ? _self.currentPositionTitle : currentPositionTitle // ignore: cast_nullable_to_non_nullable
as String,currentDepartment: null == currentDepartment ? _self.currentDepartment : currentDepartment // ignore: cast_nullable_to_non_nullable
as String,currentLocation: null == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as String,requestedDepartment: null == requestedDepartment ? _self.requestedDepartment : requestedDepartment // ignore: cast_nullable_to_non_nullable
as String,requestedLocation: null == requestedLocation ? _self.requestedLocation : requestedLocation // ignore: cast_nullable_to_non_nullable
as String,requestedPositionTitle: freezed == requestedPositionTitle ? _self.requestedPositionTitle : requestedPositionTitle // ignore: cast_nullable_to_non_nullable
as String?,reasonForRequest: null == reasonForRequest ? _self.reasonForRequest : reasonForRequest // ignore: cast_nullable_to_non_nullable
as String,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransferRequestStatus,managerComments: freezed == managerComments ? _self.managerComments : managerComments // ignore: cast_nullable_to_non_nullable
as String?,hrComments: freezed == hrComments ? _self.hrComments : hrComments // ignore: cast_nullable_to_non_nullable
as String?,effectiveDate: freezed == effectiveDate ? _self.effectiveDate : effectiveDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
