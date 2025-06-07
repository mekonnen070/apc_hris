// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_trainings_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AvailableTrainingsState {

 List<Training> get trainings; bool get isLoading; bool get isFetchingMore; bool get canFetchMore; int get page; String? get errorMessage;
/// Create a copy of AvailableTrainingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableTrainingsStateCopyWith<AvailableTrainingsState> get copyWith => _$AvailableTrainingsStateCopyWithImpl<AvailableTrainingsState>(this as AvailableTrainingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableTrainingsState&&const DeepCollectionEquality().equals(other.trainings, trainings)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.canFetchMore, canFetchMore) || other.canFetchMore == canFetchMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(trainings),isLoading,isFetchingMore,canFetchMore,page,errorMessage);

@override
String toString() {
  return 'AvailableTrainingsState(trainings: $trainings, isLoading: $isLoading, isFetchingMore: $isFetchingMore, canFetchMore: $canFetchMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AvailableTrainingsStateCopyWith<$Res>  {
  factory $AvailableTrainingsStateCopyWith(AvailableTrainingsState value, $Res Function(AvailableTrainingsState) _then) = _$AvailableTrainingsStateCopyWithImpl;
@useResult
$Res call({
 List<Training> trainings, bool isLoading, bool isFetchingMore, bool canFetchMore, int page, String? errorMessage
});




}
/// @nodoc
class _$AvailableTrainingsStateCopyWithImpl<$Res>
    implements $AvailableTrainingsStateCopyWith<$Res> {
  _$AvailableTrainingsStateCopyWithImpl(this._self, this._then);

  final AvailableTrainingsState _self;
  final $Res Function(AvailableTrainingsState) _then;

/// Create a copy of AvailableTrainingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainings = null,Object? isLoading = null,Object? isFetchingMore = null,Object? canFetchMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
trainings: null == trainings ? _self.trainings : trainings // ignore: cast_nullable_to_non_nullable
as List<Training>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,canFetchMore: null == canFetchMore ? _self.canFetchMore : canFetchMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _AvailableTrainingsState implements AvailableTrainingsState {
  const _AvailableTrainingsState({final  List<Training> trainings = const [], this.isLoading = true, this.isFetchingMore = false, this.canFetchMore = true, this.page = 1, this.errorMessage}): _trainings = trainings;
  

 final  List<Training> _trainings;
@override@JsonKey() List<Training> get trainings {
  if (_trainings is EqualUnmodifiableListView) return _trainings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainings);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFetchingMore;
@override@JsonKey() final  bool canFetchMore;
@override@JsonKey() final  int page;
@override final  String? errorMessage;

/// Create a copy of AvailableTrainingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailableTrainingsStateCopyWith<_AvailableTrainingsState> get copyWith => __$AvailableTrainingsStateCopyWithImpl<_AvailableTrainingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailableTrainingsState&&const DeepCollectionEquality().equals(other._trainings, _trainings)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.canFetchMore, canFetchMore) || other.canFetchMore == canFetchMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_trainings),isLoading,isFetchingMore,canFetchMore,page,errorMessage);

@override
String toString() {
  return 'AvailableTrainingsState(trainings: $trainings, isLoading: $isLoading, isFetchingMore: $isFetchingMore, canFetchMore: $canFetchMore, page: $page, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AvailableTrainingsStateCopyWith<$Res> implements $AvailableTrainingsStateCopyWith<$Res> {
  factory _$AvailableTrainingsStateCopyWith(_AvailableTrainingsState value, $Res Function(_AvailableTrainingsState) _then) = __$AvailableTrainingsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Training> trainings, bool isLoading, bool isFetchingMore, bool canFetchMore, int page, String? errorMessage
});




}
/// @nodoc
class __$AvailableTrainingsStateCopyWithImpl<$Res>
    implements _$AvailableTrainingsStateCopyWith<$Res> {
  __$AvailableTrainingsStateCopyWithImpl(this._self, this._then);

  final _AvailableTrainingsState _self;
  final $Res Function(_AvailableTrainingsState) _then;

/// Create a copy of AvailableTrainingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainings = null,Object? isLoading = null,Object? isFetchingMore = null,Object? canFetchMore = null,Object? page = null,Object? errorMessage = freezed,}) {
  return _then(_AvailableTrainingsState(
trainings: null == trainings ? _self._trainings : trainings // ignore: cast_nullable_to_non_nullable
as List<Training>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,canFetchMore: null == canFetchMore ? _self.canFetchMore : canFetchMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
