// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacancy_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VacancyListState {

 List<VacancyModel> get vacancies; bool get isLoading; String? get errorMessage; VacancyStatus get filterStatus;// Default to show Open vacancies
 String get searchQuery; int get currentPage;// For pagination if needed in future
 bool get canLoadMore;
/// Create a copy of VacancyListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacancyListStateCopyWith<VacancyListState> get copyWith => _$VacancyListStateCopyWithImpl<VacancyListState>(this as VacancyListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacancyListState&&const DeepCollectionEquality().equals(other.vacancies, vacancies)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(vacancies),isLoading,errorMessage,filterStatus,searchQuery,currentPage,canLoadMore);

@override
String toString() {
  return 'VacancyListState(vacancies: $vacancies, isLoading: $isLoading, errorMessage: $errorMessage, filterStatus: $filterStatus, searchQuery: $searchQuery, currentPage: $currentPage, canLoadMore: $canLoadMore)';
}


}

/// @nodoc
abstract mixin class $VacancyListStateCopyWith<$Res>  {
  factory $VacancyListStateCopyWith(VacancyListState value, $Res Function(VacancyListState) _then) = _$VacancyListStateCopyWithImpl;
@useResult
$Res call({
 List<VacancyModel> vacancies, bool isLoading, String? errorMessage, VacancyStatus filterStatus, String searchQuery, int currentPage, bool canLoadMore
});




}
/// @nodoc
class _$VacancyListStateCopyWithImpl<$Res>
    implements $VacancyListStateCopyWith<$Res> {
  _$VacancyListStateCopyWithImpl(this._self, this._then);

  final VacancyListState _self;
  final $Res Function(VacancyListState) _then;

/// Create a copy of VacancyListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vacancies = null,Object? isLoading = null,Object? errorMessage = freezed,Object? filterStatus = null,Object? searchQuery = null,Object? currentPage = null,Object? canLoadMore = null,}) {
  return _then(_self.copyWith(
vacancies: null == vacancies ? _self.vacancies : vacancies // ignore: cast_nullable_to_non_nullable
as List<VacancyModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,filterStatus: null == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as VacancyStatus,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _VacancyListState implements VacancyListState {
  const _VacancyListState({final  List<VacancyModel> vacancies = const [], this.isLoading = false, this.errorMessage, this.filterStatus = VacancyStatus.open, this.searchQuery = '', this.currentPage = 0, this.canLoadMore = true}): _vacancies = vacancies;
  

 final  List<VacancyModel> _vacancies;
@override@JsonKey() List<VacancyModel> get vacancies {
  if (_vacancies is EqualUnmodifiableListView) return _vacancies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vacancies);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  VacancyStatus filterStatus;
// Default to show Open vacancies
@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  int currentPage;
// For pagination if needed in future
@override@JsonKey() final  bool canLoadMore;

/// Create a copy of VacancyListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacancyListStateCopyWith<_VacancyListState> get copyWith => __$VacancyListStateCopyWithImpl<_VacancyListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacancyListState&&const DeepCollectionEquality().equals(other._vacancies, _vacancies)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_vacancies),isLoading,errorMessage,filterStatus,searchQuery,currentPage,canLoadMore);

@override
String toString() {
  return 'VacancyListState(vacancies: $vacancies, isLoading: $isLoading, errorMessage: $errorMessage, filterStatus: $filterStatus, searchQuery: $searchQuery, currentPage: $currentPage, canLoadMore: $canLoadMore)';
}


}

/// @nodoc
abstract mixin class _$VacancyListStateCopyWith<$Res> implements $VacancyListStateCopyWith<$Res> {
  factory _$VacancyListStateCopyWith(_VacancyListState value, $Res Function(_VacancyListState) _then) = __$VacancyListStateCopyWithImpl;
@override @useResult
$Res call({
 List<VacancyModel> vacancies, bool isLoading, String? errorMessage, VacancyStatus filterStatus, String searchQuery, int currentPage, bool canLoadMore
});




}
/// @nodoc
class __$VacancyListStateCopyWithImpl<$Res>
    implements _$VacancyListStateCopyWith<$Res> {
  __$VacancyListStateCopyWithImpl(this._self, this._then);

  final _VacancyListState _self;
  final $Res Function(_VacancyListState) _then;

/// Create a copy of VacancyListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vacancies = null,Object? isLoading = null,Object? errorMessage = freezed,Object? filterStatus = null,Object? searchQuery = null,Object? currentPage = null,Object? canLoadMore = null,}) {
  return _then(_VacancyListState(
vacancies: null == vacancies ? _self._vacancies : vacancies // ignore: cast_nullable_to_non_nullable
as List<VacancyModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,filterStatus: null == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as VacancyStatus,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
