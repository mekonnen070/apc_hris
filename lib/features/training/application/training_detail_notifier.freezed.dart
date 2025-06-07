// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_detail_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingDetailState {

 Training? get training; TrainingApplicant? get myApplication; List<TrainingApplicant> get selectedApplicants; bool get isLoading; bool get isApplying; bool get isSubmittingAppeal; String? get errorMessage;
/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingDetailStateCopyWith<TrainingDetailState> get copyWith => _$TrainingDetailStateCopyWithImpl<TrainingDetailState>(this as TrainingDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingDetailState&&(identical(other.training, training) || other.training == training)&&(identical(other.myApplication, myApplication) || other.myApplication == myApplication)&&const DeepCollectionEquality().equals(other.selectedApplicants, selectedApplicants)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isApplying, isApplying) || other.isApplying == isApplying)&&(identical(other.isSubmittingAppeal, isSubmittingAppeal) || other.isSubmittingAppeal == isSubmittingAppeal)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,training,myApplication,const DeepCollectionEquality().hash(selectedApplicants),isLoading,isApplying,isSubmittingAppeal,errorMessage);

@override
String toString() {
  return 'TrainingDetailState(training: $training, myApplication: $myApplication, selectedApplicants: $selectedApplicants, isLoading: $isLoading, isApplying: $isApplying, isSubmittingAppeal: $isSubmittingAppeal, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TrainingDetailStateCopyWith<$Res>  {
  factory $TrainingDetailStateCopyWith(TrainingDetailState value, $Res Function(TrainingDetailState) _then) = _$TrainingDetailStateCopyWithImpl;
@useResult
$Res call({
 Training? training, TrainingApplicant? myApplication, List<TrainingApplicant> selectedApplicants, bool isLoading, bool isApplying, bool isSubmittingAppeal, String? errorMessage
});


$TrainingCopyWith<$Res>? get training;$TrainingApplicantCopyWith<$Res>? get myApplication;

}
/// @nodoc
class _$TrainingDetailStateCopyWithImpl<$Res>
    implements $TrainingDetailStateCopyWith<$Res> {
  _$TrainingDetailStateCopyWithImpl(this._self, this._then);

  final TrainingDetailState _self;
  final $Res Function(TrainingDetailState) _then;

/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? training = freezed,Object? myApplication = freezed,Object? selectedApplicants = null,Object? isLoading = null,Object? isApplying = null,Object? isSubmittingAppeal = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as Training?,myApplication: freezed == myApplication ? _self.myApplication : myApplication // ignore: cast_nullable_to_non_nullable
as TrainingApplicant?,selectedApplicants: null == selectedApplicants ? _self.selectedApplicants : selectedApplicants // ignore: cast_nullable_to_non_nullable
as List<TrainingApplicant>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isApplying: null == isApplying ? _self.isApplying : isApplying // ignore: cast_nullable_to_non_nullable
as bool,isSubmittingAppeal: null == isSubmittingAppeal ? _self.isSubmittingAppeal : isSubmittingAppeal // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingApplicantCopyWith<$Res>? get myApplication {
    if (_self.myApplication == null) {
    return null;
  }

  return $TrainingApplicantCopyWith<$Res>(_self.myApplication!, (value) {
    return _then(_self.copyWith(myApplication: value));
  });
}
}


/// @nodoc


class _TrainingDetailState implements TrainingDetailState {
  const _TrainingDetailState({this.training, this.myApplication, final  List<TrainingApplicant> selectedApplicants = const [], this.isLoading = true, this.isApplying = false, this.isSubmittingAppeal = false, this.errorMessage}): _selectedApplicants = selectedApplicants;
  

@override final  Training? training;
@override final  TrainingApplicant? myApplication;
 final  List<TrainingApplicant> _selectedApplicants;
@override@JsonKey() List<TrainingApplicant> get selectedApplicants {
  if (_selectedApplicants is EqualUnmodifiableListView) return _selectedApplicants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedApplicants);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isApplying;
@override@JsonKey() final  bool isSubmittingAppeal;
@override final  String? errorMessage;

/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingDetailStateCopyWith<_TrainingDetailState> get copyWith => __$TrainingDetailStateCopyWithImpl<_TrainingDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingDetailState&&(identical(other.training, training) || other.training == training)&&(identical(other.myApplication, myApplication) || other.myApplication == myApplication)&&const DeepCollectionEquality().equals(other._selectedApplicants, _selectedApplicants)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isApplying, isApplying) || other.isApplying == isApplying)&&(identical(other.isSubmittingAppeal, isSubmittingAppeal) || other.isSubmittingAppeal == isSubmittingAppeal)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,training,myApplication,const DeepCollectionEquality().hash(_selectedApplicants),isLoading,isApplying,isSubmittingAppeal,errorMessage);

@override
String toString() {
  return 'TrainingDetailState(training: $training, myApplication: $myApplication, selectedApplicants: $selectedApplicants, isLoading: $isLoading, isApplying: $isApplying, isSubmittingAppeal: $isSubmittingAppeal, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TrainingDetailStateCopyWith<$Res> implements $TrainingDetailStateCopyWith<$Res> {
  factory _$TrainingDetailStateCopyWith(_TrainingDetailState value, $Res Function(_TrainingDetailState) _then) = __$TrainingDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Training? training, TrainingApplicant? myApplication, List<TrainingApplicant> selectedApplicants, bool isLoading, bool isApplying, bool isSubmittingAppeal, String? errorMessage
});


@override $TrainingCopyWith<$Res>? get training;@override $TrainingApplicantCopyWith<$Res>? get myApplication;

}
/// @nodoc
class __$TrainingDetailStateCopyWithImpl<$Res>
    implements _$TrainingDetailStateCopyWith<$Res> {
  __$TrainingDetailStateCopyWithImpl(this._self, this._then);

  final _TrainingDetailState _self;
  final $Res Function(_TrainingDetailState) _then;

/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? training = freezed,Object? myApplication = freezed,Object? selectedApplicants = null,Object? isLoading = null,Object? isApplying = null,Object? isSubmittingAppeal = null,Object? errorMessage = freezed,}) {
  return _then(_TrainingDetailState(
training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as Training?,myApplication: freezed == myApplication ? _self.myApplication : myApplication // ignore: cast_nullable_to_non_nullable
as TrainingApplicant?,selectedApplicants: null == selectedApplicants ? _self._selectedApplicants : selectedApplicants // ignore: cast_nullable_to_non_nullable
as List<TrainingApplicant>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isApplying: null == isApplying ? _self.isApplying : isApplying // ignore: cast_nullable_to_non_nullable
as bool,isSubmittingAppeal: null == isSubmittingAppeal ? _self.isSubmittingAppeal : isSubmittingAppeal // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}/// Create a copy of TrainingDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingApplicantCopyWith<$Res>? get myApplication {
    if (_self.myApplication == null) {
    return null;
  }

  return $TrainingApplicantCopyWith<$Res>(_self.myApplication!, (value) {
    return _then(_self.copyWith(myApplication: value));
  });
}
}

// dart format on
