// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_recruit_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewRecruitState {

 bool get isLoading; bool get isSubmitting; String? get successMessage; String? get errorMessage; RecruitInfo? get createRequest; List<RecruitmentAnnouncement> get announcements;
/// Create a copy of NewRecruitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewRecruitStateCopyWith<NewRecruitState> get copyWith => _$NewRecruitStateCopyWithImpl<NewRecruitState>(this as NewRecruitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewRecruitState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createRequest, createRequest) || other.createRequest == createRequest)&&const DeepCollectionEquality().equals(other.announcements, announcements));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSubmitting,successMessage,errorMessage,createRequest,const DeepCollectionEquality().hash(announcements));

@override
String toString() {
  return 'NewRecruitState(isLoading: $isLoading, isSubmitting: $isSubmitting, successMessage: $successMessage, errorMessage: $errorMessage, createRequest: $createRequest, announcements: $announcements)';
}


}

/// @nodoc
abstract mixin class $NewRecruitStateCopyWith<$Res>  {
  factory $NewRecruitStateCopyWith(NewRecruitState value, $Res Function(NewRecruitState) _then) = _$NewRecruitStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSubmitting, String? successMessage, String? errorMessage, RecruitInfo? createRequest, List<RecruitmentAnnouncement> announcements
});


$RecruitInfoCopyWith<$Res>? get createRequest;

}
/// @nodoc
class _$NewRecruitStateCopyWithImpl<$Res>
    implements $NewRecruitStateCopyWith<$Res> {
  _$NewRecruitStateCopyWithImpl(this._self, this._then);

  final NewRecruitState _self;
  final $Res Function(NewRecruitState) _then;

/// Create a copy of NewRecruitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSubmitting = null,Object? successMessage = freezed,Object? errorMessage = freezed,Object? createRequest = freezed,Object? announcements = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createRequest: freezed == createRequest ? _self.createRequest : createRequest // ignore: cast_nullable_to_non_nullable
as RecruitInfo?,announcements: null == announcements ? _self.announcements : announcements // ignore: cast_nullable_to_non_nullable
as List<RecruitmentAnnouncement>,
  ));
}
/// Create a copy of NewRecruitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecruitInfoCopyWith<$Res>? get createRequest {
    if (_self.createRequest == null) {
    return null;
  }

  return $RecruitInfoCopyWith<$Res>(_self.createRequest!, (value) {
    return _then(_self.copyWith(createRequest: value));
  });
}
}


/// @nodoc


class _NewRecruitState implements NewRecruitState {
  const _NewRecruitState({this.isLoading = false, this.isSubmitting = false, this.successMessage, this.errorMessage, this.createRequest, final  List<RecruitmentAnnouncement> announcements = const []}): _announcements = announcements;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSubmitting;
@override final  String? successMessage;
@override final  String? errorMessage;
@override final  RecruitInfo? createRequest;
 final  List<RecruitmentAnnouncement> _announcements;
@override@JsonKey() List<RecruitmentAnnouncement> get announcements {
  if (_announcements is EqualUnmodifiableListView) return _announcements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_announcements);
}


/// Create a copy of NewRecruitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewRecruitStateCopyWith<_NewRecruitState> get copyWith => __$NewRecruitStateCopyWithImpl<_NewRecruitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewRecruitState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createRequest, createRequest) || other.createRequest == createRequest)&&const DeepCollectionEquality().equals(other._announcements, _announcements));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSubmitting,successMessage,errorMessage,createRequest,const DeepCollectionEquality().hash(_announcements));

@override
String toString() {
  return 'NewRecruitState(isLoading: $isLoading, isSubmitting: $isSubmitting, successMessage: $successMessage, errorMessage: $errorMessage, createRequest: $createRequest, announcements: $announcements)';
}


}

/// @nodoc
abstract mixin class _$NewRecruitStateCopyWith<$Res> implements $NewRecruitStateCopyWith<$Res> {
  factory _$NewRecruitStateCopyWith(_NewRecruitState value, $Res Function(_NewRecruitState) _then) = __$NewRecruitStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSubmitting, String? successMessage, String? errorMessage, RecruitInfo? createRequest, List<RecruitmentAnnouncement> announcements
});


@override $RecruitInfoCopyWith<$Res>? get createRequest;

}
/// @nodoc
class __$NewRecruitStateCopyWithImpl<$Res>
    implements _$NewRecruitStateCopyWith<$Res> {
  __$NewRecruitStateCopyWithImpl(this._self, this._then);

  final _NewRecruitState _self;
  final $Res Function(_NewRecruitState) _then;

/// Create a copy of NewRecruitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSubmitting = null,Object? successMessage = freezed,Object? errorMessage = freezed,Object? createRequest = freezed,Object? announcements = null,}) {
  return _then(_NewRecruitState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createRequest: freezed == createRequest ? _self.createRequest : createRequest // ignore: cast_nullable_to_non_nullable
as RecruitInfo?,announcements: null == announcements ? _self._announcements : announcements // ignore: cast_nullable_to_non_nullable
as List<RecruitmentAnnouncement>,
  ));
}

/// Create a copy of NewRecruitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecruitInfoCopyWith<$Res>? get createRequest {
    if (_self.createRequest == null) {
    return null;
  }

  return $RecruitInfoCopyWith<$Res>(_self.createRequest!, (value) {
    return _then(_self.copyWith(createRequest: value));
  });
}
}

// dart format on
