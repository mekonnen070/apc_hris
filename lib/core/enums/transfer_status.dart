import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum TransferStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  submitted,

  @JsonValue(2)
  selected,
  
  @JsonValue(3)
  passed,

  @JsonValue(4)
  approved,
  
  @JsonValue(5)
  rejected,
}