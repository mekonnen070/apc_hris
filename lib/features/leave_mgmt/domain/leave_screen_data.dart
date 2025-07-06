import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';

part 'leave_screen_data.freezed.dart';

// This model encapsulates all the data needed for the main leave screen.
@freezed
abstract class LeaveScreenData with _$LeaveScreenData {
  const factory LeaveScreenData({
    required List<LeaveBalance> balances,
    required List<LeaveRequest> history,
    required List<LeaveType> types,
  }) = _LeaveScreenData;
}
