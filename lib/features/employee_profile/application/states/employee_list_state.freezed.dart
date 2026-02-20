// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeListState {

 List<EmployeeInfoModel> get employees;// True when fetching the very first set of data or after a search/refresh.
 bool get isLoadingInitial;// True when fetching subsequent sets of data for infinite scroll.
 bool get isLoadingMore; String? get errorMessage;// The last successfully fetched page number. Starts at 0 or 1 depending on API.
 int get currentPage;// Indicates if there are more items to fetch from the backend.
 bool get canLoadMore; String get currentSearchQuery;// Optional: If your API returns total items, it can be stored here.
 int? get totalItems;
/// Create a copy of EmployeeListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeListStateCopyWith<EmployeeListState> get copyWith => _$EmployeeListStateCopyWithImpl<EmployeeListState>(this as EmployeeListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeListState&&const DeepCollectionEquality().equals(other.employees, employees)&&(identical(other.isLoadingInitial, isLoadingInitial) || other.isLoadingInitial == isLoadingInitial)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.currentSearchQuery, currentSearchQuery) || other.currentSearchQuery == currentSearchQuery)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(employees),isLoadingInitial,isLoadingMore,errorMessage,currentPage,canLoadMore,currentSearchQuery,totalItems);

@override
String toString() {
  return 'EmployeeListState(employees: $employees, isLoadingInitial: $isLoadingInitial, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, currentPage: $currentPage, canLoadMore: $canLoadMore, currentSearchQuery: $currentSearchQuery, totalItems: $totalItems)';
}


}

/// @nodoc
abstract mixin class $EmployeeListStateCopyWith<$Res>  {
  factory $EmployeeListStateCopyWith(EmployeeListState value, $Res Function(EmployeeListState) _then) = _$EmployeeListStateCopyWithImpl;
@useResult
$Res call({
 List<EmployeeInfoModel> employees, bool isLoadingInitial, bool isLoadingMore, String? errorMessage, int currentPage, bool canLoadMore, String currentSearchQuery, int? totalItems
});




}
/// @nodoc
class _$EmployeeListStateCopyWithImpl<$Res>
    implements $EmployeeListStateCopyWith<$Res> {
  _$EmployeeListStateCopyWithImpl(this._self, this._then);

  final EmployeeListState _self;
  final $Res Function(EmployeeListState) _then;

/// Create a copy of EmployeeListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? employees = null,Object? isLoadingInitial = null,Object? isLoadingMore = null,Object? errorMessage = freezed,Object? currentPage = null,Object? canLoadMore = null,Object? currentSearchQuery = null,Object? totalItems = freezed,}) {
  return _then(_self.copyWith(
employees: null == employees ? _self.employees : employees // ignore: cast_nullable_to_non_nullable
as List<EmployeeInfoModel>,isLoadingInitial: null == isLoadingInitial ? _self.isLoadingInitial : isLoadingInitial // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,currentSearchQuery: null == currentSearchQuery ? _self.currentSearchQuery : currentSearchQuery // ignore: cast_nullable_to_non_nullable
as String,totalItems: freezed == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeeListState].
extension EmployeeListStatePatterns on EmployeeListState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeListState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeListState value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeListState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeListState value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeListState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EmployeeInfoModel> employees,  bool isLoadingInitial,  bool isLoadingMore,  String? errorMessage,  int currentPage,  bool canLoadMore,  String currentSearchQuery,  int? totalItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeListState() when $default != null:
return $default(_that.employees,_that.isLoadingInitial,_that.isLoadingMore,_that.errorMessage,_that.currentPage,_that.canLoadMore,_that.currentSearchQuery,_that.totalItems);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EmployeeInfoModel> employees,  bool isLoadingInitial,  bool isLoadingMore,  String? errorMessage,  int currentPage,  bool canLoadMore,  String currentSearchQuery,  int? totalItems)  $default,) {final _that = this;
switch (_that) {
case _EmployeeListState():
return $default(_that.employees,_that.isLoadingInitial,_that.isLoadingMore,_that.errorMessage,_that.currentPage,_that.canLoadMore,_that.currentSearchQuery,_that.totalItems);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EmployeeInfoModel> employees,  bool isLoadingInitial,  bool isLoadingMore,  String? errorMessage,  int currentPage,  bool canLoadMore,  String currentSearchQuery,  int? totalItems)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeListState() when $default != null:
return $default(_that.employees,_that.isLoadingInitial,_that.isLoadingMore,_that.errorMessage,_that.currentPage,_that.canLoadMore,_that.currentSearchQuery,_that.totalItems);case _:
  return null;

}
}

}

/// @nodoc


class _EmployeeListState extends EmployeeListState {
  const _EmployeeListState({final  List<EmployeeInfoModel> employees = const [], this.isLoadingInitial = false, this.isLoadingMore = false, this.errorMessage, this.currentPage = 0, this.canLoadMore = true, this.currentSearchQuery = '', this.totalItems}): _employees = employees,super._();
  

 final  List<EmployeeInfoModel> _employees;
@override@JsonKey() List<EmployeeInfoModel> get employees {
  if (_employees is EqualUnmodifiableListView) return _employees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employees);
}

// True when fetching the very first set of data or after a search/refresh.
@override@JsonKey() final  bool isLoadingInitial;
// True when fetching subsequent sets of data for infinite scroll.
@override@JsonKey() final  bool isLoadingMore;
@override final  String? errorMessage;
// The last successfully fetched page number. Starts at 0 or 1 depending on API.
@override@JsonKey() final  int currentPage;
// Indicates if there are more items to fetch from the backend.
@override@JsonKey() final  bool canLoadMore;
@override@JsonKey() final  String currentSearchQuery;
// Optional: If your API returns total items, it can be stored here.
@override final  int? totalItems;

/// Create a copy of EmployeeListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeListStateCopyWith<_EmployeeListState> get copyWith => __$EmployeeListStateCopyWithImpl<_EmployeeListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeListState&&const DeepCollectionEquality().equals(other._employees, _employees)&&(identical(other.isLoadingInitial, isLoadingInitial) || other.isLoadingInitial == isLoadingInitial)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore)&&(identical(other.currentSearchQuery, currentSearchQuery) || other.currentSearchQuery == currentSearchQuery)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_employees),isLoadingInitial,isLoadingMore,errorMessage,currentPage,canLoadMore,currentSearchQuery,totalItems);

@override
String toString() {
  return 'EmployeeListState(employees: $employees, isLoadingInitial: $isLoadingInitial, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, currentPage: $currentPage, canLoadMore: $canLoadMore, currentSearchQuery: $currentSearchQuery, totalItems: $totalItems)';
}


}

/// @nodoc
abstract mixin class _$EmployeeListStateCopyWith<$Res> implements $EmployeeListStateCopyWith<$Res> {
  factory _$EmployeeListStateCopyWith(_EmployeeListState value, $Res Function(_EmployeeListState) _then) = __$EmployeeListStateCopyWithImpl;
@override @useResult
$Res call({
 List<EmployeeInfoModel> employees, bool isLoadingInitial, bool isLoadingMore, String? errorMessage, int currentPage, bool canLoadMore, String currentSearchQuery, int? totalItems
});




}
/// @nodoc
class __$EmployeeListStateCopyWithImpl<$Res>
    implements _$EmployeeListStateCopyWith<$Res> {
  __$EmployeeListStateCopyWithImpl(this._self, this._then);

  final _EmployeeListState _self;
  final $Res Function(_EmployeeListState) _then;

/// Create a copy of EmployeeListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? employees = null,Object? isLoadingInitial = null,Object? isLoadingMore = null,Object? errorMessage = freezed,Object? currentPage = null,Object? canLoadMore = null,Object? currentSearchQuery = null,Object? totalItems = freezed,}) {
  return _then(_EmployeeListState(
employees: null == employees ? _self._employees : employees // ignore: cast_nullable_to_non_nullable
as List<EmployeeInfoModel>,isLoadingInitial: null == isLoadingInitial ? _self.isLoadingInitial : isLoadingInitial // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,canLoadMore: null == canLoadMore ? _self.canLoadMore : canLoadMore // ignore: cast_nullable_to_non_nullable
as bool,currentSearchQuery: null == currentSearchQuery ? _self.currentSearchQuery : currentSearchQuery // ignore: cast_nullable_to_non_nullable
as String,totalItems: freezed == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
