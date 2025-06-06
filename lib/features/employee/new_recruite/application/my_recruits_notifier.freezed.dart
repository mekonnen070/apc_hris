// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_recruits_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyRecruitsState {

 List<RecruitInfo> get recruits; Set<int> get selectedRecruitIds; bool get isLoading; bool get isFetchingMore; bool get isUpdatingStatus; bool get canFetchMore; int get page; RecruitStatus get filterStatus; String? get errorMessage;
/// Create a copy of MyRecruitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyRecruitsStateCopyWith<MyRecruitsState> get copyWith => _$MyRecruitsStateCopyWithImpl<MyRecruitsState>(this as MyRecruitsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyRecruitsState&&const DeepCollectionEquality().equals(other.recruits, recruits)&&const DeepCollectionEquality().equals(other.selectedRecruitIds, selectedRecruitIds)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.isUpdatingStatus, isUpdatingStatus) || other.isUpdatingStatus == isUpdatingStatus)&&(identical(other.canFetchMore, canFetchMore) || other.canFetchMore == canFetchMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recruits),const DeepCollectionEquality().hash(selectedRecruitIds),isLoading,isFetchingMore,isUpdatingStatus,canFetchMore,page,filterStatus,errorMessage);

@override
String toString() {
  return 'MyRecruitsState(recruits: $recruits, selectedRecruitIds: $selectedRecruitIds, isLoading: $isLoading, isFetchingMore: $isFetchingMore, isUpdatingStatus: $isUpdatingStatus, canFetchMore: $canFetchMore, page: $page, filterStatus: $filterStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MyRecruitsStateCopyWith<$Res>  {
  factory $MyRecruitsStateCopyWith(MyRecruitsState value, $Res Function(MyRecruitsState) _then) = _$MyRecruitsStateCopyWithImpl;
@useResult
$Res call({
 List<RecruitInfo> recruits, Set<int> selectedRecruitIds, bool isLoading, bool isFetchingMore, bool isUpdatingStatus, bool canFetchMore, int page, RecruitStatus filterStatus, String? errorMessage
});




}
/// @nodoc
class _$MyRecruitsStateCopyWithImpl<$Res>
    implements $MyRecruitsStateCopyWith<$Res> {
  _$MyRecruitsStateCopyWithImpl(this._self, this._then);

  final MyRecruitsState _self;
  final $Res Function(MyRecruitsState) _then;

/// Create a copy of MyRecruitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recruits = null,Object? selectedRecruitIds = null,Object? isLoading = null,Object? isFetchingMore = null,Object? isUpdatingStatus = null,Object? canFetchMore = null,Object? page = null,Object? filterStatus = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
recruits: null == recruits ? _self.recruits : recruits // ignore: cast_nullable_to_non_nullable
as List<RecruitInfo>,selectedRecruitIds: null == selectedRecruitIds ? _self.selectedRecruitIds : selectedRecruitIds // ignore: cast_nullable_to_non_nullable
as Set<int>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingStatus: null == isUpdatingStatus ? _self.isUpdatingStatus : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
as bool,canFetchMore: null == canFetchMore ? _self.canFetchMore : canFetchMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,filterStatus: null == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as RecruitStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _MyRecruitsState implements MyRecruitsState {
  const _MyRecruitsState({final  List<RecruitInfo> recruits = const [], final  Set<int> selectedRecruitIds = const {}, this.isLoading = true, this.isFetchingMore = false, this.isUpdatingStatus = false, this.canFetchMore = true, this.page = 1, this.filterStatus = RecruitStatus.noStatus, this.errorMessage}): _recruits = recruits,_selectedRecruitIds = selectedRecruitIds;
  

 final  List<RecruitInfo> _recruits;
@override@JsonKey() List<RecruitInfo> get recruits {
  if (_recruits is EqualUnmodifiableListView) return _recruits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recruits);
}

 final  Set<int> _selectedRecruitIds;
@override@JsonKey() Set<int> get selectedRecruitIds {
  if (_selectedRecruitIds is EqualUnmodifiableSetView) return _selectedRecruitIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedRecruitIds);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFetchingMore;
@override@JsonKey() final  bool isUpdatingStatus;
@override@JsonKey() final  bool canFetchMore;
@override@JsonKey() final  int page;
@override@JsonKey() final  RecruitStatus filterStatus;
@override final  String? errorMessage;

/// Create a copy of MyRecruitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyRecruitsStateCopyWith<_MyRecruitsState> get copyWith => __$MyRecruitsStateCopyWithImpl<_MyRecruitsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyRecruitsState&&const DeepCollectionEquality().equals(other._recruits, _recruits)&&const DeepCollectionEquality().equals(other._selectedRecruitIds, _selectedRecruitIds)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.isUpdatingStatus, isUpdatingStatus) || other.isUpdatingStatus == isUpdatingStatus)&&(identical(other.canFetchMore, canFetchMore) || other.canFetchMore == canFetchMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recruits),const DeepCollectionEquality().hash(_selectedRecruitIds),isLoading,isFetchingMore,isUpdatingStatus,canFetchMore,page,filterStatus,errorMessage);

@override
String toString() {
  return 'MyRecruitsState(recruits: $recruits, selectedRecruitIds: $selectedRecruitIds, isLoading: $isLoading, isFetchingMore: $isFetchingMore, isUpdatingStatus: $isUpdatingStatus, canFetchMore: $canFetchMore, page: $page, filterStatus: $filterStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MyRecruitsStateCopyWith<$Res> implements $MyRecruitsStateCopyWith<$Res> {
  factory _$MyRecruitsStateCopyWith(_MyRecruitsState value, $Res Function(_MyRecruitsState) _then) = __$MyRecruitsStateCopyWithImpl;
@override @useResult
$Res call({
 List<RecruitInfo> recruits, Set<int> selectedRecruitIds, bool isLoading, bool isFetchingMore, bool isUpdatingStatus, bool canFetchMore, int page, RecruitStatus filterStatus, String? errorMessage
});




}
/// @nodoc
class __$MyRecruitsStateCopyWithImpl<$Res>
    implements _$MyRecruitsStateCopyWith<$Res> {
  __$MyRecruitsStateCopyWithImpl(this._self, this._then);

  final _MyRecruitsState _self;
  final $Res Function(_MyRecruitsState) _then;

/// Create a copy of MyRecruitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recruits = null,Object? selectedRecruitIds = null,Object? isLoading = null,Object? isFetchingMore = null,Object? isUpdatingStatus = null,Object? canFetchMore = null,Object? page = null,Object? filterStatus = null,Object? errorMessage = freezed,}) {
  return _then(_MyRecruitsState(
recruits: null == recruits ? _self._recruits : recruits // ignore: cast_nullable_to_non_nullable
as List<RecruitInfo>,selectedRecruitIds: null == selectedRecruitIds ? _self._selectedRecruitIds : selectedRecruitIds // ignore: cast_nullable_to_non_nullable
as Set<int>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingStatus: null == isUpdatingStatus ? _self.isUpdatingStatus : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
as bool,canFetchMore: null == canFetchMore ? _self.canFetchMore : canFetchMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,filterStatus: null == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as RecruitStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
