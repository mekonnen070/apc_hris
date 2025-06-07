// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_placements_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AvailablePlacementsState {

 List<Placement> get placements; bool get isLoading; bool get isFetchingMore; bool get canFetchMore; int get page; String? get errorMessage;
/// Create a copy of AvailablePlacementsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailablePlacementsStateCopyWith<AvailablePlacementsState> get copyWith => _$AvailablePlacementsStateCopyWithImpl<AvailablePlacementsState>(this as AvailablePlacementsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailablePlacementsState&&const DeepCollectionEquality().equals(other.placements, placements)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.canFetchMore, canFetchMore) || other.canFetchMore == canFetchMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(placements),isLoading,isFetchingMore,canFetchMore,page,errorMessage);

@override
String toString() {
  return 'AvailablePlacementsState(placements: $placements, isLoading: $isLoading, isFetchingMore: $isFetchingMore, canFetchMore: $canFetchMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AvailablePlacementsStateCopyWith<$Res>  {
  factory $AvailablePlacementsStateCopyWith(AvailablePlacementsState value, $Res Function(AvailablePlacementsState) _then) = _$AvailablePlacementsStateCopyWithImpl;
@useResult
$Res call({
 List<Placement> placements, bool isLoading, bool isFetchingMore, bool canFetchMore, int page, String? errorMessage
});




}
/// @nodoc
class _$AvailablePlacementsStateCopyWithImpl<$Res>
    implements $AvailablePlacementsStateCopyWith<$Res> {
  _$AvailablePlacementsStateCopyWithImpl(this._self, this._then);

  final AvailablePlacementsState _self;
  final $Res Function(AvailablePlacementsState) _then;

/// Create a copy of AvailablePlacementsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placements = null,Object? isLoading = null,Object? isFetchingMore = null,Object? canFetchMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
placements: null == placements ? _self.placements : placements // ignore: cast_nullable_to_non_nullable
as List<Placement>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,canFetchMore: null == canFetchMore ? _self.canFetchMore : canFetchMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _AvailablePlacementsState implements AvailablePlacementsState {
  const _AvailablePlacementsState({final  List<Placement> placements = const [], this.isLoading = true, this.isFetchingMore = false, this.canFetchMore = true, this.page = 1, this.errorMessage}): _placements = placements;
  

 final  List<Placement> _placements;
@override@JsonKey() List<Placement> get placements {
  if (_placements is EqualUnmodifiableListView) return _placements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_placements);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFetchingMore;
@override@JsonKey() final  bool canFetchMore;
@override@JsonKey() final  int page;
@override final  String? errorMessage;

/// Create a copy of AvailablePlacementsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailablePlacementsStateCopyWith<_AvailablePlacementsState> get copyWith => __$AvailablePlacementsStateCopyWithImpl<_AvailablePlacementsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailablePlacementsState&&const DeepCollectionEquality().equals(other._placements, _placements)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.canFetchMore, canFetchMore) || other.canFetchMore == canFetchMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_placements),isLoading,isFetchingMore,canFetchMore,page,errorMessage);

@override
String toString() {
  return 'AvailablePlacementsState(placements: $placements, isLoading: $isLoading, isFetchingMore: $isFetchingMore, canFetchMore: $canFetchMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AvailablePlacementsStateCopyWith<$Res> implements $AvailablePlacementsStateCopyWith<$Res> {
  factory _$AvailablePlacementsStateCopyWith(_AvailablePlacementsState value, $Res Function(_AvailablePlacementsState) _then) = __$AvailablePlacementsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Placement> placements, bool isLoading, bool isFetchingMore, bool canFetchMore, int page, String? errorMessage
});




}
/// @nodoc
class __$AvailablePlacementsStateCopyWithImpl<$Res>
    implements _$AvailablePlacementsStateCopyWith<$Res> {
  __$AvailablePlacementsStateCopyWithImpl(this._self, this._then);

  final _AvailablePlacementsState _self;
  final $Res Function(_AvailablePlacementsState) _then;

/// Create a copy of AvailablePlacementsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placements = null,Object? isLoading = null,Object? isFetchingMore = null,Object? canFetchMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_AvailablePlacementsState(
placements: null == placements ? _self._placements : placements // ignore: cast_nullable_to_non_nullable
as List<Placement>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,canFetchMore: null == canFetchMore ? _self.canFetchMore : canFetchMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
