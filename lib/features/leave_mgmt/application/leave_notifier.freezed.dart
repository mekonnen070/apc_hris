// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeaveState {

 bool get isLoading; bool get isFetchingMore; bool get canFetchMore; int get page; String? get errorMessage; List<LeaveBalance> get leaveBalances; List<LeaveRequest> get leaveHistory; List<LeaveType> get leaveTypes;
/// Create a copy of LeaveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveStateCopyWith<LeaveState> get copyWith => _$LeaveStateCopyWithImpl<LeaveState>(this as LeaveState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.canFetchMore, canFetchMore) || other.canFetchMore == canFetchMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.leaveBalances, leaveBalances)&&const DeepCollectionEquality().equals(other.leaveHistory, leaveHistory)&&const DeepCollectionEquality().equals(other.leaveTypes, leaveTypes));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFetchingMore,canFetchMore,page,errorMessage,const DeepCollectionEquality().hash(leaveBalances),const DeepCollectionEquality().hash(leaveHistory),const DeepCollectionEquality().hash(leaveTypes));

@override
String toString() {
  return 'LeaveState(isLoading: $isLoading, isFetchingMore: $isFetchingMore, canFetchMore: $canFetchMore, page: $page, errorMessage: $errorMessage, leaveBalances: $leaveBalances, leaveHistory: $leaveHistory, leaveTypes: $leaveTypes)';
}


}

/// @nodoc
abstract mixin class $LeaveStateCopyWith<$Res>  {
  factory $LeaveStateCopyWith(LeaveState value, $Res Function(LeaveState) _then) = _$LeaveStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isFetchingMore, bool canFetchMore, int page, String? errorMessage, List<LeaveBalance> leaveBalances, List<LeaveRequest> leaveHistory, List<LeaveType> leaveTypes
});




}
/// @nodoc
class _$LeaveStateCopyWithImpl<$Res>
    implements $LeaveStateCopyWith<$Res> {
  _$LeaveStateCopyWithImpl(this._self, this._then);

  final LeaveState _self;
  final $Res Function(LeaveState) _then;

/// Create a copy of LeaveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isFetchingMore = null,Object? canFetchMore = null,Object? page = null,Object? errorMessage = freezed,Object? leaveBalances = null,Object? leaveHistory = null,Object? leaveTypes = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,canFetchMore: null == canFetchMore ? _self.canFetchMore : canFetchMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,leaveBalances: null == leaveBalances ? _self.leaveBalances : leaveBalances // ignore: cast_nullable_to_non_nullable
as List<LeaveBalance>,leaveHistory: null == leaveHistory ? _self.leaveHistory : leaveHistory // ignore: cast_nullable_to_non_nullable
as List<LeaveRequest>,leaveTypes: null == leaveTypes ? _self.leaveTypes : leaveTypes // ignore: cast_nullable_to_non_nullable
as List<LeaveType>,
  ));
}

}


/// @nodoc


class _LeaveState implements LeaveState {
  const _LeaveState({this.isLoading = true, this.isFetchingMore = false, this.canFetchMore = true, this.page = 1, this.errorMessage, final  List<LeaveBalance> leaveBalances = const [], final  List<LeaveRequest> leaveHistory = const [], final  List<LeaveType> leaveTypes = const []}): _leaveBalances = leaveBalances,_leaveHistory = leaveHistory,_leaveTypes = leaveTypes;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFetchingMore;
@override@JsonKey() final  bool canFetchMore;
@override@JsonKey() final  int page;
@override final  String? errorMessage;
 final  List<LeaveBalance> _leaveBalances;
@override@JsonKey() List<LeaveBalance> get leaveBalances {
  if (_leaveBalances is EqualUnmodifiableListView) return _leaveBalances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leaveBalances);
}

 final  List<LeaveRequest> _leaveHistory;
@override@JsonKey() List<LeaveRequest> get leaveHistory {
  if (_leaveHistory is EqualUnmodifiableListView) return _leaveHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leaveHistory);
}

 final  List<LeaveType> _leaveTypes;
@override@JsonKey() List<LeaveType> get leaveTypes {
  if (_leaveTypes is EqualUnmodifiableListView) return _leaveTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leaveTypes);
}


/// Create a copy of LeaveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveStateCopyWith<_LeaveState> get copyWith => __$LeaveStateCopyWithImpl<_LeaveState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.canFetchMore, canFetchMore) || other.canFetchMore == canFetchMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._leaveBalances, _leaveBalances)&&const DeepCollectionEquality().equals(other._leaveHistory, _leaveHistory)&&const DeepCollectionEquality().equals(other._leaveTypes, _leaveTypes));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFetchingMore,canFetchMore,page,errorMessage,const DeepCollectionEquality().hash(_leaveBalances),const DeepCollectionEquality().hash(_leaveHistory),const DeepCollectionEquality().hash(_leaveTypes));

@override
String toString() {
  return 'LeaveState(isLoading: $isLoading, isFetchingMore: $isFetchingMore, canFetchMore: $canFetchMore, page: $page, errorMessage: $errorMessage, leaveBalances: $leaveBalances, leaveHistory: $leaveHistory, leaveTypes: $leaveTypes)';
}


}

/// @nodoc
abstract mixin class _$LeaveStateCopyWith<$Res> implements $LeaveStateCopyWith<$Res> {
  factory _$LeaveStateCopyWith(_LeaveState value, $Res Function(_LeaveState) _then) = __$LeaveStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isFetchingMore, bool canFetchMore, int page, String? errorMessage, List<LeaveBalance> leaveBalances, List<LeaveRequest> leaveHistory, List<LeaveType> leaveTypes
});




}
/// @nodoc
class __$LeaveStateCopyWithImpl<$Res>
    implements _$LeaveStateCopyWith<$Res> {
  __$LeaveStateCopyWithImpl(this._self, this._then);

  final _LeaveState _self;
  final $Res Function(_LeaveState) _then;

/// Create a copy of LeaveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isFetchingMore = null,Object? canFetchMore = null,Object? page = null,Object? errorMessage = freezed,Object? leaveBalances = null,Object? leaveHistory = null,Object? leaveTypes = null,}) {
  return _then(_LeaveState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,canFetchMore: null == canFetchMore ? _self.canFetchMore : canFetchMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,leaveBalances: null == leaveBalances ? _self._leaveBalances : leaveBalances // ignore: cast_nullable_to_non_nullable
as List<LeaveBalance>,leaveHistory: null == leaveHistory ? _self._leaveHistory : leaveHistory // ignore: cast_nullable_to_non_nullable
as List<LeaveRequest>,leaveTypes: null == leaveTypes ? _self._leaveTypes : leaveTypes // ignore: cast_nullable_to_non_nullable
as List<LeaveType>,
  ));
}


}

// dart format on
