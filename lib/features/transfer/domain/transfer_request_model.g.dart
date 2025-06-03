// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferRequestModel _$TransferRequestModelFromJson(
  Map<String, dynamic> json,
) => _TransferRequestModel(
  id: json['id'] as String,
  employeeId: json['employeeId'] as String,
  employeeFullName: json['employeeFullName'] as String,
  currentPositionTitle: json['currentPositionTitle'] as String,
  currentDepartment: json['currentDepartment'] as String,
  currentLocation: json['currentLocation'] as String,
  requestedDepartment: json['requestedDepartment'] as String,
  requestedLocation: json['requestedLocation'] as String,
  requestedPositionTitle: json['requestedPositionTitle'] as String?,
  reasonForRequest: json['reasonForRequest'] as String,
  requestDate: DateTime.parse(json['requestDate'] as String),
  status:
      $enumDecodeNullable(_$TransferRequestStatusEnumMap, json['status']) ??
      TransferRequestStatus.pendingManagerApproval,
  managerComments: json['managerComments'] as String?,
  hrComments: json['hrComments'] as String?,
  effectiveDate:
      json['effectiveDate'] == null
          ? null
          : DateTime.parse(json['effectiveDate'] as String),
  lastUpdated:
      json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$TransferRequestModelToJson(
  _TransferRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'employeeId': instance.employeeId,
  'employeeFullName': instance.employeeFullName,
  'currentPositionTitle': instance.currentPositionTitle,
  'currentDepartment': instance.currentDepartment,
  'currentLocation': instance.currentLocation,
  'requestedDepartment': instance.requestedDepartment,
  'requestedLocation': instance.requestedLocation,
  'requestedPositionTitle': instance.requestedPositionTitle,
  'reasonForRequest': instance.reasonForRequest,
  'requestDate': instance.requestDate.toIso8601String(),
  'status': _$TransferRequestStatusEnumMap[instance.status]!,
  'managerComments': instance.managerComments,
  'hrComments': instance.hrComments,
  'effectiveDate': instance.effectiveDate?.toIso8601String(),
  'lastUpdated': instance.lastUpdated?.toIso8601String(),
};

const _$TransferRequestStatusEnumMap = {
  TransferRequestStatus.pendingManagerApproval: 'pendingManagerApproval',
  TransferRequestStatus.pendingHRApproval: 'pendingHRApproval',
  TransferRequestStatus.approved: 'approved',
  TransferRequestStatus.rejectedByManager: 'rejectedByManager',
  TransferRequestStatus.rejectedByHR: 'rejectedByHR',
  TransferRequestStatus.completed: 'completed',
  TransferRequestStatus.cancelledByEmployee: 'cancelledByEmployee',
};
