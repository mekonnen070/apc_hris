// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placement_detail_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlacementDetailState {

 Placement? get placement; PlacementApplicant? get myApplication; List<PlacementApplicant> get selectedApplicants; bool get isLoading; bool get isApplying; bool get isSubmittingAppeal; String? get errorMessage;
/// Create a copy of PlacementDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlacementDetailStateCopyWith<PlacementDetailState> get copyWith => _$PlacementDetailStateCopyWithImpl<PlacementDetailState>(this as PlacementDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlacementDetailState&&(identical(other.placement, placement) || other.placement == placement)&&(identical(other.myApplication, myApplication) || other.myApplication == myApplication)&&const DeepCollectionEquality().equals(other.selectedApplicants, selectedApplicants)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isApplying, isApplying) || other.isApplying == isApplying)&&(identical(other.isSubmittingAppeal, isSubmittingAppeal) || other.isSubmittingAppeal == isSubmittingAppeal)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,placement,myApplication,const DeepCollectionEquality().hash(selectedApplicants),isLoading,isApplying,isSubmittingAppeal,errorMessage);

@override
String toString() {
  return 'PlacementDetailState(placement: $placement, myApplication: $myApplication, selectedApplicants: $selectedApplicants, isLoading: $isLoading, isApplying: $isApplying, isSubmittingAppeal: $isSubmittingAppeal, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PlacementDetailStateCopyWith<$Res>  {
  factory $PlacementDetailStateCopyWith(PlacementDetailState value, $Res Function(PlacementDetailState) _then) = _$PlacementDetailStateCopyWithImpl;
@useResult
$Res call({
 Placement? placement, PlacementApplicant? myApplication, List<PlacementApplicant> selectedApplicants, bool isLoading, bool isApplying, bool isSubmittingAppeal, String? errorMessage
});


$PlacementCopyWith<$Res>? get placement;$PlacementApplicantCopyWith<$Res>? get myApplication;

}
/// @nodoc
class _$PlacementDetailStateCopyWithImpl<$Res>
    implements $PlacementDetailStateCopyWith<$Res> {
  _$PlacementDetailStateCopyWithImpl(this._self, this._then);

  final PlacementDetailState _self;
  final $Res Function(PlacementDetailState) _then;

/// Create a copy of PlacementDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placement = freezed,Object? myApplication = freezed,Object? selectedApplicants = null,Object? isLoading = null,Object? isApplying = null,Object? isSubmittingAppeal = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
placement: freezed == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as Placement?,myApplication: freezed == myApplication ? _self.myApplication : myApplication // ignore: cast_nullable_to_non_nullable
as PlacementApplicant?,selectedApplicants: null == selectedApplicants ? _self.selectedApplicants : selectedApplicants // ignore: cast_nullable_to_non_nullable
as List<PlacementApplicant>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isApplying: null == isApplying ? _self.isApplying : isApplying // ignore: cast_nullable_to_non_nullable
as bool,isSubmittingAppeal: null == isSubmittingAppeal ? _self.isSubmittingAppeal : isSubmittingAppeal // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PlacementDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlacementCopyWith<$Res>? get placement {
    if (_self.placement == null) {
    return null;
  }

  return $PlacementCopyWith<$Res>(_self.placement!, (value) {
    return _then(_self.copyWith(placement: value));
  });
}/// Create a copy of PlacementDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlacementApplicantCopyWith<$Res>? get myApplication {
    if (_self.myApplication == null) {
    return null;
  }

  return $PlacementApplicantCopyWith<$Res>(_self.myApplication!, (value) {
    return _then(_self.copyWith(myApplication: value));
  });
}
}


/// @nodoc


class _PlacementDetailState implements PlacementDetailState {
  const _PlacementDetailState({this.placement, this.myApplication, final  List<PlacementApplicant> selectedApplicants = const [], this.isLoading = true, this.isApplying = false, this.isSubmittingAppeal = false, this.errorMessage}): _selectedApplicants = selectedApplicants;
  

@override final  Placement? placement;
@override final  PlacementApplicant? myApplication;
 final  List<PlacementApplicant> _selectedApplicants;
@override@JsonKey() List<PlacementApplicant> get selectedApplicants {
  if (_selectedApplicants is EqualUnmodifiableListView) return _selectedApplicants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedApplicants);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isApplying;
@override@JsonKey() final  bool isSubmittingAppeal;
@override final  String? errorMessage;

/// Create a copy of PlacementDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlacementDetailStateCopyWith<_PlacementDetailState> get copyWith => __$PlacementDetailStateCopyWithImpl<_PlacementDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlacementDetailState&&(identical(other.placement, placement) || other.placement == placement)&&(identical(other.myApplication, myApplication) || other.myApplication == myApplication)&&const DeepCollectionEquality().equals(other._selectedApplicants, _selectedApplicants)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isApplying, isApplying) || other.isApplying == isApplying)&&(identical(other.isSubmittingAppeal, isSubmittingAppeal) || other.isSubmittingAppeal == isSubmittingAppeal)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,placement,myApplication,const DeepCollectionEquality().hash(_selectedApplicants),isLoading,isApplying,isSubmittingAppeal,errorMessage);

@override
String toString() {
  return 'PlacementDetailState(placement: $placement, myApplication: $myApplication, selectedApplicants: $selectedApplicants, isLoading: $isLoading, isApplying: $isApplying, isSubmittingAppeal: $isSubmittingAppeal, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PlacementDetailStateCopyWith<$Res> implements $PlacementDetailStateCopyWith<$Res> {
  factory _$PlacementDetailStateCopyWith(_PlacementDetailState value, $Res Function(_PlacementDetailState) _then) = __$PlacementDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Placement? placement, PlacementApplicant? myApplication, List<PlacementApplicant> selectedApplicants, bool isLoading, bool isApplying, bool isSubmittingAppeal, String? errorMessage
});


@override $PlacementCopyWith<$Res>? get placement;@override $PlacementApplicantCopyWith<$Res>? get myApplication;

}
/// @nodoc
class __$PlacementDetailStateCopyWithImpl<$Res>
    implements _$PlacementDetailStateCopyWith<$Res> {
  __$PlacementDetailStateCopyWithImpl(this._self, this._then);

  final _PlacementDetailState _self;
  final $Res Function(_PlacementDetailState) _then;

/// Create a copy of PlacementDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placement = freezed,Object? myApplication = freezed,Object? selectedApplicants = null,Object? isLoading = null,Object? isApplying = null,Object? isSubmittingAppeal = null,Object? errorMessage = freezed,}) {
  return _then(_PlacementDetailState(
placement: freezed == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as Placement?,myApplication: freezed == myApplication ? _self.myApplication : myApplication // ignore: cast_nullable_to_non_nullable
as PlacementApplicant?,selectedApplicants: null == selectedApplicants ? _self._selectedApplicants : selectedApplicants // ignore: cast_nullable_to_non_nullable
as List<PlacementApplicant>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isApplying: null == isApplying ? _self.isApplying : isApplying // ignore: cast_nullable_to_non_nullable
as bool,isSubmittingAppeal: null == isSubmittingAppeal ? _self.isSubmittingAppeal : isSubmittingAppeal // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PlacementDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlacementCopyWith<$Res>? get placement {
    if (_self.placement == null) {
    return null;
  }

  return $PlacementCopyWith<$Res>(_self.placement!, (value) {
    return _then(_self.copyWith(placement: value));
  });
}/// Create a copy of PlacementDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlacementApplicantCopyWith<$Res>? get myApplication {
    if (_self.myApplication == null) {
    return null;
  }

  return $PlacementApplicantCopyWith<$Res>(_self.myApplication!, (value) {
    return _then(_self.copyWith(myApplication: value));
  });
}
}

// dart format on
