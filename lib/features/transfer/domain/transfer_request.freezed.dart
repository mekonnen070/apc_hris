// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferRequest {

// --- Renamed & Type Changed ---
 int get transferRequestId; String? get employeeId;// --- Current Location/Position ---
 String? get currentLocation; String? get currentLocationId; String? get currentDepartment; String? get currentPosition;// --- New Enum Fields ---
 TransferLevels get transferLevelFrom; TransferLevels get transferLevelTo;// --- Destination Location/Position (Renamed) ---
 String? get requestedLocation; String? get requestedLocationId; String? get requestedDepartment; String? get requestedDepartmentId; String? get requestedPositionTitle; String? get requestedPositionId;// --- Date and Reason ---
 DateTime get requestDate; TransferPeriod? get transferPeriod; String? get transferYear; TransferReasons? get reasonForRequest;// --- Approval Info ---
 String? get approvedBy; DateTime? get approvalDate; TransferStatus get status;
/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferRequestCopyWith<TransferRequest> get copyWith => _$TransferRequestCopyWithImpl<TransferRequest>(this as TransferRequest, _$identity);

  /// Serializes this TransferRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferRequest&&(identical(other.transferRequestId, transferRequestId) || other.transferRequestId == transferRequestId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.currentLocationId, currentLocationId) || other.currentLocationId == currentLocationId)&&(identical(other.currentDepartment, currentDepartment) || other.currentDepartment == currentDepartment)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.transferLevelFrom, transferLevelFrom) || other.transferLevelFrom == transferLevelFrom)&&(identical(other.transferLevelTo, transferLevelTo) || other.transferLevelTo == transferLevelTo)&&(identical(other.requestedLocation, requestedLocation) || other.requestedLocation == requestedLocation)&&(identical(other.requestedLocationId, requestedLocationId) || other.requestedLocationId == requestedLocationId)&&(identical(other.requestedDepartment, requestedDepartment) || other.requestedDepartment == requestedDepartment)&&(identical(other.requestedDepartmentId, requestedDepartmentId) || other.requestedDepartmentId == requestedDepartmentId)&&(identical(other.requestedPositionTitle, requestedPositionTitle) || other.requestedPositionTitle == requestedPositionTitle)&&(identical(other.requestedPositionId, requestedPositionId) || other.requestedPositionId == requestedPositionId)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.transferPeriod, transferPeriod) || other.transferPeriod == transferPeriod)&&(identical(other.transferYear, transferYear) || other.transferYear == transferYear)&&(identical(other.reasonForRequest, reasonForRequest) || other.reasonForRequest == reasonForRequest)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvalDate, approvalDate) || other.approvalDate == approvalDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,transferRequestId,employeeId,currentLocation,currentLocationId,currentDepartment,currentPosition,transferLevelFrom,transferLevelTo,requestedLocation,requestedLocationId,requestedDepartment,requestedDepartmentId,requestedPositionTitle,requestedPositionId,requestDate,transferPeriod,transferYear,reasonForRequest,approvedBy,approvalDate,status]);

@override
String toString() {
  return 'TransferRequest(transferRequestId: $transferRequestId, employeeId: $employeeId, currentLocation: $currentLocation, currentLocationId: $currentLocationId, currentDepartment: $currentDepartment, currentPosition: $currentPosition, transferLevelFrom: $transferLevelFrom, transferLevelTo: $transferLevelTo, requestedLocation: $requestedLocation, requestedLocationId: $requestedLocationId, requestedDepartment: $requestedDepartment, requestedDepartmentId: $requestedDepartmentId, requestedPositionTitle: $requestedPositionTitle, requestedPositionId: $requestedPositionId, requestDate: $requestDate, transferPeriod: $transferPeriod, transferYear: $transferYear, reasonForRequest: $reasonForRequest, approvedBy: $approvedBy, approvalDate: $approvalDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $TransferRequestCopyWith<$Res>  {
  factory $TransferRequestCopyWith(TransferRequest value, $Res Function(TransferRequest) _then) = _$TransferRequestCopyWithImpl;
@useResult
$Res call({
 int transferRequestId, String? employeeId, String? currentLocation, String? currentLocationId, String? currentDepartment, String? currentPosition, TransferLevels transferLevelFrom, TransferLevels transferLevelTo, String? requestedLocation, String? requestedLocationId, String? requestedDepartment, String? requestedDepartmentId, String? requestedPositionTitle, String? requestedPositionId, DateTime requestDate, TransferPeriod? transferPeriod, String? transferYear, TransferReasons? reasonForRequest, String? approvedBy, DateTime? approvalDate, TransferStatus status
});




}
/// @nodoc
class _$TransferRequestCopyWithImpl<$Res>
    implements $TransferRequestCopyWith<$Res> {
  _$TransferRequestCopyWithImpl(this._self, this._then);

  final TransferRequest _self;
  final $Res Function(TransferRequest) _then;

/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transferRequestId = null,Object? employeeId = freezed,Object? currentLocation = freezed,Object? currentLocationId = freezed,Object? currentDepartment = freezed,Object? currentPosition = freezed,Object? transferLevelFrom = null,Object? transferLevelTo = null,Object? requestedLocation = freezed,Object? requestedLocationId = freezed,Object? requestedDepartment = freezed,Object? requestedDepartmentId = freezed,Object? requestedPositionTitle = freezed,Object? requestedPositionId = freezed,Object? requestDate = null,Object? transferPeriod = freezed,Object? transferYear = freezed,Object? reasonForRequest = freezed,Object? approvedBy = freezed,Object? approvalDate = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
transferRequestId: null == transferRequestId ? _self.transferRequestId : transferRequestId // ignore: cast_nullable_to_non_nullable
as int,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String?,currentLocation: freezed == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as String?,currentLocationId: freezed == currentLocationId ? _self.currentLocationId : currentLocationId // ignore: cast_nullable_to_non_nullable
as String?,currentDepartment: freezed == currentDepartment ? _self.currentDepartment : currentDepartment // ignore: cast_nullable_to_non_nullable
as String?,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as String?,transferLevelFrom: null == transferLevelFrom ? _self.transferLevelFrom : transferLevelFrom // ignore: cast_nullable_to_non_nullable
as TransferLevels,transferLevelTo: null == transferLevelTo ? _self.transferLevelTo : transferLevelTo // ignore: cast_nullable_to_non_nullable
as TransferLevels,requestedLocation: freezed == requestedLocation ? _self.requestedLocation : requestedLocation // ignore: cast_nullable_to_non_nullable
as String?,requestedLocationId: freezed == requestedLocationId ? _self.requestedLocationId : requestedLocationId // ignore: cast_nullable_to_non_nullable
as String?,requestedDepartment: freezed == requestedDepartment ? _self.requestedDepartment : requestedDepartment // ignore: cast_nullable_to_non_nullable
as String?,requestedDepartmentId: freezed == requestedDepartmentId ? _self.requestedDepartmentId : requestedDepartmentId // ignore: cast_nullable_to_non_nullable
as String?,requestedPositionTitle: freezed == requestedPositionTitle ? _self.requestedPositionTitle : requestedPositionTitle // ignore: cast_nullable_to_non_nullable
as String?,requestedPositionId: freezed == requestedPositionId ? _self.requestedPositionId : requestedPositionId // ignore: cast_nullable_to_non_nullable
as String?,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,transferPeriod: freezed == transferPeriod ? _self.transferPeriod : transferPeriod // ignore: cast_nullable_to_non_nullable
as TransferPeriod?,transferYear: freezed == transferYear ? _self.transferYear : transferYear // ignore: cast_nullable_to_non_nullable
as String?,reasonForRequest: freezed == reasonForRequest ? _self.reasonForRequest : reasonForRequest // ignore: cast_nullable_to_non_nullable
as TransferReasons?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvalDate: freezed == approvalDate ? _self.approvalDate : approvalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransferStatus,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransferRequest implements TransferRequest {
  const _TransferRequest({required this.transferRequestId, this.employeeId, required this.currentLocation, this.currentLocationId, required this.currentDepartment, required this.currentPosition, required this.transferLevelFrom, required this.transferLevelTo, required this.requestedLocation, this.requestedLocationId, this.requestedDepartment, this.requestedDepartmentId, this.requestedPositionTitle, this.requestedPositionId, required this.requestDate, this.transferPeriod, this.transferYear, this.reasonForRequest, this.approvedBy, this.approvalDate, this.status = TransferStatus.pending});
  factory _TransferRequest.fromJson(Map<String, dynamic> json) => _$TransferRequestFromJson(json);

// --- Renamed & Type Changed ---
@override final  int transferRequestId;
@override final  String? employeeId;
// --- Current Location/Position ---
@override final  String? currentLocation;
@override final  String? currentLocationId;
@override final  String? currentDepartment;
@override final  String? currentPosition;
// --- New Enum Fields ---
@override final  TransferLevels transferLevelFrom;
@override final  TransferLevels transferLevelTo;
// --- Destination Location/Position (Renamed) ---
@override final  String? requestedLocation;
@override final  String? requestedLocationId;
@override final  String? requestedDepartment;
@override final  String? requestedDepartmentId;
@override final  String? requestedPositionTitle;
@override final  String? requestedPositionId;
// --- Date and Reason ---
@override final  DateTime requestDate;
@override final  TransferPeriod? transferPeriod;
@override final  String? transferYear;
@override final  TransferReasons? reasonForRequest;
// --- Approval Info ---
@override final  String? approvedBy;
@override final  DateTime? approvalDate;
@override@JsonKey() final  TransferStatus status;

/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferRequestCopyWith<_TransferRequest> get copyWith => __$TransferRequestCopyWithImpl<_TransferRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferRequest&&(identical(other.transferRequestId, transferRequestId) || other.transferRequestId == transferRequestId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.currentLocationId, currentLocationId) || other.currentLocationId == currentLocationId)&&(identical(other.currentDepartment, currentDepartment) || other.currentDepartment == currentDepartment)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.transferLevelFrom, transferLevelFrom) || other.transferLevelFrom == transferLevelFrom)&&(identical(other.transferLevelTo, transferLevelTo) || other.transferLevelTo == transferLevelTo)&&(identical(other.requestedLocation, requestedLocation) || other.requestedLocation == requestedLocation)&&(identical(other.requestedLocationId, requestedLocationId) || other.requestedLocationId == requestedLocationId)&&(identical(other.requestedDepartment, requestedDepartment) || other.requestedDepartment == requestedDepartment)&&(identical(other.requestedDepartmentId, requestedDepartmentId) || other.requestedDepartmentId == requestedDepartmentId)&&(identical(other.requestedPositionTitle, requestedPositionTitle) || other.requestedPositionTitle == requestedPositionTitle)&&(identical(other.requestedPositionId, requestedPositionId) || other.requestedPositionId == requestedPositionId)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.transferPeriod, transferPeriod) || other.transferPeriod == transferPeriod)&&(identical(other.transferYear, transferYear) || other.transferYear == transferYear)&&(identical(other.reasonForRequest, reasonForRequest) || other.reasonForRequest == reasonForRequest)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvalDate, approvalDate) || other.approvalDate == approvalDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,transferRequestId,employeeId,currentLocation,currentLocationId,currentDepartment,currentPosition,transferLevelFrom,transferLevelTo,requestedLocation,requestedLocationId,requestedDepartment,requestedDepartmentId,requestedPositionTitle,requestedPositionId,requestDate,transferPeriod,transferYear,reasonForRequest,approvedBy,approvalDate,status]);

@override
String toString() {
  return 'TransferRequest(transferRequestId: $transferRequestId, employeeId: $employeeId, currentLocation: $currentLocation, currentLocationId: $currentLocationId, currentDepartment: $currentDepartment, currentPosition: $currentPosition, transferLevelFrom: $transferLevelFrom, transferLevelTo: $transferLevelTo, requestedLocation: $requestedLocation, requestedLocationId: $requestedLocationId, requestedDepartment: $requestedDepartment, requestedDepartmentId: $requestedDepartmentId, requestedPositionTitle: $requestedPositionTitle, requestedPositionId: $requestedPositionId, requestDate: $requestDate, transferPeriod: $transferPeriod, transferYear: $transferYear, reasonForRequest: $reasonForRequest, approvedBy: $approvedBy, approvalDate: $approvalDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TransferRequestCopyWith<$Res> implements $TransferRequestCopyWith<$Res> {
  factory _$TransferRequestCopyWith(_TransferRequest value, $Res Function(_TransferRequest) _then) = __$TransferRequestCopyWithImpl;
@override @useResult
$Res call({
 int transferRequestId, String? employeeId, String? currentLocation, String? currentLocationId, String? currentDepartment, String? currentPosition, TransferLevels transferLevelFrom, TransferLevels transferLevelTo, String? requestedLocation, String? requestedLocationId, String? requestedDepartment, String? requestedDepartmentId, String? requestedPositionTitle, String? requestedPositionId, DateTime requestDate, TransferPeriod? transferPeriod, String? transferYear, TransferReasons? reasonForRequest, String? approvedBy, DateTime? approvalDate, TransferStatus status
});




}
/// @nodoc
class __$TransferRequestCopyWithImpl<$Res>
    implements _$TransferRequestCopyWith<$Res> {
  __$TransferRequestCopyWithImpl(this._self, this._then);

  final _TransferRequest _self;
  final $Res Function(_TransferRequest) _then;

/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transferRequestId = null,Object? employeeId = freezed,Object? currentLocation = freezed,Object? currentLocationId = freezed,Object? currentDepartment = freezed,Object? currentPosition = freezed,Object? transferLevelFrom = null,Object? transferLevelTo = null,Object? requestedLocation = freezed,Object? requestedLocationId = freezed,Object? requestedDepartment = freezed,Object? requestedDepartmentId = freezed,Object? requestedPositionTitle = freezed,Object? requestedPositionId = freezed,Object? requestDate = null,Object? transferPeriod = freezed,Object? transferYear = freezed,Object? reasonForRequest = freezed,Object? approvedBy = freezed,Object? approvalDate = freezed,Object? status = null,}) {
  return _then(_TransferRequest(
transferRequestId: null == transferRequestId ? _self.transferRequestId : transferRequestId // ignore: cast_nullable_to_non_nullable
as int,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String?,currentLocation: freezed == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as String?,currentLocationId: freezed == currentLocationId ? _self.currentLocationId : currentLocationId // ignore: cast_nullable_to_non_nullable
as String?,currentDepartment: freezed == currentDepartment ? _self.currentDepartment : currentDepartment // ignore: cast_nullable_to_non_nullable
as String?,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as String?,transferLevelFrom: null == transferLevelFrom ? _self.transferLevelFrom : transferLevelFrom // ignore: cast_nullable_to_non_nullable
as TransferLevels,transferLevelTo: null == transferLevelTo ? _self.transferLevelTo : transferLevelTo // ignore: cast_nullable_to_non_nullable
as TransferLevels,requestedLocation: freezed == requestedLocation ? _self.requestedLocation : requestedLocation // ignore: cast_nullable_to_non_nullable
as String?,requestedLocationId: freezed == requestedLocationId ? _self.requestedLocationId : requestedLocationId // ignore: cast_nullable_to_non_nullable
as String?,requestedDepartment: freezed == requestedDepartment ? _self.requestedDepartment : requestedDepartment // ignore: cast_nullable_to_non_nullable
as String?,requestedDepartmentId: freezed == requestedDepartmentId ? _self.requestedDepartmentId : requestedDepartmentId // ignore: cast_nullable_to_non_nullable
as String?,requestedPositionTitle: freezed == requestedPositionTitle ? _self.requestedPositionTitle : requestedPositionTitle // ignore: cast_nullable_to_non_nullable
as String?,requestedPositionId: freezed == requestedPositionId ? _self.requestedPositionId : requestedPositionId // ignore: cast_nullable_to_non_nullable
as String?,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,transferPeriod: freezed == transferPeriod ? _self.transferPeriod : transferPeriod // ignore: cast_nullable_to_non_nullable
as TransferPeriod?,transferYear: freezed == transferYear ? _self.transferYear : transferYear // ignore: cast_nullable_to_non_nullable
as String?,reasonForRequest: freezed == reasonForRequest ? _self.reasonForRequest : reasonForRequest // ignore: cast_nullable_to_non_nullable
as TransferReasons?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvalDate: freezed == approvalDate ? _self.approvalDate : approvalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransferStatus,
  ));
}


}

// dart format on
