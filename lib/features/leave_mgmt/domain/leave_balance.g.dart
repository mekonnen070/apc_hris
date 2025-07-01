// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveBalance _$LeaveBalanceFromJson(Map<String, dynamic> json) =>
    _LeaveBalance(
      leaveBalanceId: (json['leaveBalanceId'] as num).toInt(),
      employeeId: json['employeeId'] as String,
      leaveTypeId: json['leaveTypeId'] as String,
      budgetYear: (json['budgetYear'] as num).toInt(),
      totalDays: (json['totalDays'] as num).toInt(),
      usedDays: (json['usedDays'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$LeaveBalanceToJson(_LeaveBalance instance) =>
    <String, dynamic>{
      'leaveBalanceId': instance.leaveBalanceId,
      'employeeId': instance.employeeId,
      'leaveTypeId': instance.leaveTypeId,
      'budgetYear': instance.budgetYear,
      'totalDays': instance.totalDays,
      'usedDays': instance.usedDays,
      'balance': instance.balance,
    };
