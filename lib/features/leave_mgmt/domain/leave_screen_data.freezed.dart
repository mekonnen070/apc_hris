// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_screen_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeaveScreenData {

 List<LeaveBalance> get balances; List<LeaveRequest> get history; List<LeaveType> get types;
/// Create a copy of LeaveScreenData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveScreenDataCopyWith<LeaveScreenData> get copyWith => _$LeaveScreenDataCopyWithImpl<LeaveScreenData>(this as LeaveScreenData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveScreenData&&const DeepCollectionEquality().equals(other.balances, balances)&&const DeepCollectionEquality().equals(other.history, history)&&const DeepCollectionEquality().equals(other.types, types));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(balances),const DeepCollectionEquality().hash(history),const DeepCollectionEquality().hash(types));

@override
String toString() {
  return 'LeaveScreenData(balances: $balances, history: $history, types: $types)';
}


}

/// @nodoc
abstract mixin class $LeaveScreenDataCopyWith<$Res>  {
  factory $LeaveScreenDataCopyWith(LeaveScreenData value, $Res Function(LeaveScreenData) _then) = _$LeaveScreenDataCopyWithImpl;
@useResult
$Res call({
 List<LeaveBalance> balances, List<LeaveRequest> history, List<LeaveType> types
});




}
/// @nodoc
class _$LeaveScreenDataCopyWithImpl<$Res>
    implements $LeaveScreenDataCopyWith<$Res> {
  _$LeaveScreenDataCopyWithImpl(this._self, this._then);

  final LeaveScreenData _self;
  final $Res Function(LeaveScreenData) _then;

/// Create a copy of LeaveScreenData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balances = null,Object? history = null,Object? types = null,}) {
  return _then(_self.copyWith(
balances: null == balances ? _self.balances : balances // ignore: cast_nullable_to_non_nullable
as List<LeaveBalance>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<LeaveRequest>,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<LeaveType>,
  ));
}

}


/// @nodoc


class _LeaveScreenData implements LeaveScreenData {
  const _LeaveScreenData({required final  List<LeaveBalance> balances, required final  List<LeaveRequest> history, required final  List<LeaveType> types}): _balances = balances,_history = history,_types = types;
  

 final  List<LeaveBalance> _balances;
@override List<LeaveBalance> get balances {
  if (_balances is EqualUnmodifiableListView) return _balances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_balances);
}

 final  List<LeaveRequest> _history;
@override List<LeaveRequest> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

 final  List<LeaveType> _types;
@override List<LeaveType> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}


/// Create a copy of LeaveScreenData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveScreenDataCopyWith<_LeaveScreenData> get copyWith => __$LeaveScreenDataCopyWithImpl<_LeaveScreenData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveScreenData&&const DeepCollectionEquality().equals(other._balances, _balances)&&const DeepCollectionEquality().equals(other._history, _history)&&const DeepCollectionEquality().equals(other._types, _types));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_balances),const DeepCollectionEquality().hash(_history),const DeepCollectionEquality().hash(_types));

@override
String toString() {
  return 'LeaveScreenData(balances: $balances, history: $history, types: $types)';
}


}

/// @nodoc
abstract mixin class _$LeaveScreenDataCopyWith<$Res> implements $LeaveScreenDataCopyWith<$Res> {
  factory _$LeaveScreenDataCopyWith(_LeaveScreenData value, $Res Function(_LeaveScreenData) _then) = __$LeaveScreenDataCopyWithImpl;
@override @useResult
$Res call({
 List<LeaveBalance> balances, List<LeaveRequest> history, List<LeaveType> types
});




}
/// @nodoc
class __$LeaveScreenDataCopyWithImpl<$Res>
    implements _$LeaveScreenDataCopyWith<$Res> {
  __$LeaveScreenDataCopyWithImpl(this._self, this._then);

  final _LeaveScreenData _self;
  final $Res Function(_LeaveScreenData) _then;

/// Create a copy of LeaveScreenData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balances = null,Object? history = null,Object? types = null,}) {
  return _then(_LeaveScreenData(
balances: null == balances ? _self._balances : balances // ignore: cast_nullable_to_non_nullable
as List<LeaveBalance>,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<LeaveRequest>,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<LeaveType>,
  ));
}


}

// dart format on
