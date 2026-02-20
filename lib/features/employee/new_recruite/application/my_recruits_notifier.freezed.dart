// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 List<RecruitInfo> get recruits; Set<String> get selectedRecruitIds; bool get isLoading; bool get isUpdatingStatus; NewRecruitStatus get filterStatus; String? get errorMessage;
/// Create a copy of MyRecruitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyRecruitsStateCopyWith<MyRecruitsState> get copyWith => _$MyRecruitsStateCopyWithImpl<MyRecruitsState>(this as MyRecruitsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyRecruitsState&&const DeepCollectionEquality().equals(other.recruits, recruits)&&const DeepCollectionEquality().equals(other.selectedRecruitIds, selectedRecruitIds)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isUpdatingStatus, isUpdatingStatus) || other.isUpdatingStatus == isUpdatingStatus)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recruits),const DeepCollectionEquality().hash(selectedRecruitIds),isLoading,isUpdatingStatus,filterStatus,errorMessage);

@override
String toString() {
  return 'MyRecruitsState(recruits: $recruits, selectedRecruitIds: $selectedRecruitIds, isLoading: $isLoading, isUpdatingStatus: $isUpdatingStatus, filterStatus: $filterStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MyRecruitsStateCopyWith<$Res>  {
  factory $MyRecruitsStateCopyWith(MyRecruitsState value, $Res Function(MyRecruitsState) _then) = _$MyRecruitsStateCopyWithImpl;
@useResult
$Res call({
 List<RecruitInfo> recruits, Set<String> selectedRecruitIds, bool isLoading, bool isUpdatingStatus, NewRecruitStatus filterStatus, String? errorMessage
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
@pragma('vm:prefer-inline') @override $Res call({Object? recruits = null,Object? selectedRecruitIds = null,Object? isLoading = null,Object? isUpdatingStatus = null,Object? filterStatus = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
recruits: null == recruits ? _self.recruits : recruits // ignore: cast_nullable_to_non_nullable
as List<RecruitInfo>,selectedRecruitIds: null == selectedRecruitIds ? _self.selectedRecruitIds : selectedRecruitIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingStatus: null == isUpdatingStatus ? _self.isUpdatingStatus : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
as bool,filterStatus: null == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as NewRecruitStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyRecruitsState].
extension MyRecruitsStatePatterns on MyRecruitsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyRecruitsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyRecruitsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyRecruitsState value)  $default,){
final _that = this;
switch (_that) {
case _MyRecruitsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyRecruitsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyRecruitsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RecruitInfo> recruits,  Set<String> selectedRecruitIds,  bool isLoading,  bool isUpdatingStatus,  NewRecruitStatus filterStatus,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyRecruitsState() when $default != null:
return $default(_that.recruits,_that.selectedRecruitIds,_that.isLoading,_that.isUpdatingStatus,_that.filterStatus,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RecruitInfo> recruits,  Set<String> selectedRecruitIds,  bool isLoading,  bool isUpdatingStatus,  NewRecruitStatus filterStatus,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _MyRecruitsState():
return $default(_that.recruits,_that.selectedRecruitIds,_that.isLoading,_that.isUpdatingStatus,_that.filterStatus,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RecruitInfo> recruits,  Set<String> selectedRecruitIds,  bool isLoading,  bool isUpdatingStatus,  NewRecruitStatus filterStatus,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _MyRecruitsState() when $default != null:
return $default(_that.recruits,_that.selectedRecruitIds,_that.isLoading,_that.isUpdatingStatus,_that.filterStatus,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MyRecruitsState implements MyRecruitsState {
  const _MyRecruitsState({final  List<RecruitInfo> recruits = const [], final  Set<String> selectedRecruitIds = const {}, this.isLoading = true, this.isUpdatingStatus = false, this.filterStatus = NewRecruitStatus.pending, this.errorMessage}): _recruits = recruits,_selectedRecruitIds = selectedRecruitIds;
  

 final  List<RecruitInfo> _recruits;
@override@JsonKey() List<RecruitInfo> get recruits {
  if (_recruits is EqualUnmodifiableListView) return _recruits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recruits);
}

 final  Set<String> _selectedRecruitIds;
@override@JsonKey() Set<String> get selectedRecruitIds {
  if (_selectedRecruitIds is EqualUnmodifiableSetView) return _selectedRecruitIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedRecruitIds);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isUpdatingStatus;
@override@JsonKey() final  NewRecruitStatus filterStatus;
@override final  String? errorMessage;

/// Create a copy of MyRecruitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyRecruitsStateCopyWith<_MyRecruitsState> get copyWith => __$MyRecruitsStateCopyWithImpl<_MyRecruitsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyRecruitsState&&const DeepCollectionEquality().equals(other._recruits, _recruits)&&const DeepCollectionEquality().equals(other._selectedRecruitIds, _selectedRecruitIds)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isUpdatingStatus, isUpdatingStatus) || other.isUpdatingStatus == isUpdatingStatus)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recruits),const DeepCollectionEquality().hash(_selectedRecruitIds),isLoading,isUpdatingStatus,filterStatus,errorMessage);

@override
String toString() {
  return 'MyRecruitsState(recruits: $recruits, selectedRecruitIds: $selectedRecruitIds, isLoading: $isLoading, isUpdatingStatus: $isUpdatingStatus, filterStatus: $filterStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MyRecruitsStateCopyWith<$Res> implements $MyRecruitsStateCopyWith<$Res> {
  factory _$MyRecruitsStateCopyWith(_MyRecruitsState value, $Res Function(_MyRecruitsState) _then) = __$MyRecruitsStateCopyWithImpl;
@override @useResult
$Res call({
 List<RecruitInfo> recruits, Set<String> selectedRecruitIds, bool isLoading, bool isUpdatingStatus, NewRecruitStatus filterStatus, String? errorMessage
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
@override @pragma('vm:prefer-inline') $Res call({Object? recruits = null,Object? selectedRecruitIds = null,Object? isLoading = null,Object? isUpdatingStatus = null,Object? filterStatus = null,Object? errorMessage = freezed,}) {
  return _then(_MyRecruitsState(
recruits: null == recruits ? _self._recruits : recruits // ignore: cast_nullable_to_non_nullable
as List<RecruitInfo>,selectedRecruitIds: null == selectedRecruitIds ? _self._selectedRecruitIds : selectedRecruitIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingStatus: null == isUpdatingStatus ? _self.isUpdatingStatus : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
as bool,filterStatus: null == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as NewRecruitStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
