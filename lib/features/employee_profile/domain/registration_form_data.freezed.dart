// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_form_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegistrationFormData {

// Personal Information (mandatory after its step)
 PersonalInfo? get personalInfo;// Academic Qualifications (list, can be empty)
 List<AcademicQualification> get academicQualifications;// Work Experiences (list, can be empty)
 List<WorkExperience> get workExperiences;// Specific mandatory document files (local representation)
@JsonKey(includeFromJson: false, includeToJson: false) File? get cvFile;@JsonKey(includeFromJson: false, includeToJson: false) File? get nationalIdFile;// Other supporting documents (list, can be empty)
 List<GeneralDocument> get otherDocuments;
/// Create a copy of RegistrationFormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationFormDataCopyWith<RegistrationFormData> get copyWith => _$RegistrationFormDataCopyWithImpl<RegistrationFormData>(this as RegistrationFormData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationFormData&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other.academicQualifications, academicQualifications)&&const DeepCollectionEquality().equals(other.workExperiences, workExperiences)&&(identical(other.cvFile, cvFile) || other.cvFile == cvFile)&&(identical(other.nationalIdFile, nationalIdFile) || other.nationalIdFile == nationalIdFile)&&const DeepCollectionEquality().equals(other.otherDocuments, otherDocuments));
}


@override
int get hashCode => Object.hash(runtimeType,personalInfo,const DeepCollectionEquality().hash(academicQualifications),const DeepCollectionEquality().hash(workExperiences),cvFile,nationalIdFile,const DeepCollectionEquality().hash(otherDocuments));

@override
String toString() {
  return 'RegistrationFormData(personalInfo: $personalInfo, academicQualifications: $academicQualifications, workExperiences: $workExperiences, cvFile: $cvFile, nationalIdFile: $nationalIdFile, otherDocuments: $otherDocuments)';
}


}

/// @nodoc
abstract mixin class $RegistrationFormDataCopyWith<$Res>  {
  factory $RegistrationFormDataCopyWith(RegistrationFormData value, $Res Function(RegistrationFormData) _then) = _$RegistrationFormDataCopyWithImpl;
@useResult
$Res call({
 PersonalInfo? personalInfo, List<AcademicQualification> academicQualifications, List<WorkExperience> workExperiences,@JsonKey(includeFromJson: false, includeToJson: false) File? cvFile,@JsonKey(includeFromJson: false, includeToJson: false) File? nationalIdFile, List<GeneralDocument> otherDocuments
});


$PersonalInfoCopyWith<$Res>? get personalInfo;

}
/// @nodoc
class _$RegistrationFormDataCopyWithImpl<$Res>
    implements $RegistrationFormDataCopyWith<$Res> {
  _$RegistrationFormDataCopyWithImpl(this._self, this._then);

  final RegistrationFormData _self;
  final $Res Function(RegistrationFormData) _then;

/// Create a copy of RegistrationFormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? personalInfo = freezed,Object? academicQualifications = null,Object? workExperiences = null,Object? cvFile = freezed,Object? nationalIdFile = freezed,Object? otherDocuments = null,}) {
  return _then(_self.copyWith(
personalInfo: freezed == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo?,academicQualifications: null == academicQualifications ? _self.academicQualifications : academicQualifications // ignore: cast_nullable_to_non_nullable
as List<AcademicQualification>,workExperiences: null == workExperiences ? _self.workExperiences : workExperiences // ignore: cast_nullable_to_non_nullable
as List<WorkExperience>,cvFile: freezed == cvFile ? _self.cvFile : cvFile // ignore: cast_nullable_to_non_nullable
as File?,nationalIdFile: freezed == nationalIdFile ? _self.nationalIdFile : nationalIdFile // ignore: cast_nullable_to_non_nullable
as File?,otherDocuments: null == otherDocuments ? _self.otherDocuments : otherDocuments // ignore: cast_nullable_to_non_nullable
as List<GeneralDocument>,
  ));
}
/// Create a copy of RegistrationFormData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res>? get personalInfo {
    if (_self.personalInfo == null) {
    return null;
  }

  return $PersonalInfoCopyWith<$Res>(_self.personalInfo!, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}
}


/// @nodoc


class _RegistrationFormData implements RegistrationFormData {
  const _RegistrationFormData({this.personalInfo, final  List<AcademicQualification> academicQualifications = const [], final  List<WorkExperience> workExperiences = const [], @JsonKey(includeFromJson: false, includeToJson: false) this.cvFile, @JsonKey(includeFromJson: false, includeToJson: false) this.nationalIdFile, final  List<GeneralDocument> otherDocuments = const []}): _academicQualifications = academicQualifications,_workExperiences = workExperiences,_otherDocuments = otherDocuments;
  

// Personal Information (mandatory after its step)
@override final  PersonalInfo? personalInfo;
// Academic Qualifications (list, can be empty)
 final  List<AcademicQualification> _academicQualifications;
// Academic Qualifications (list, can be empty)
@override@JsonKey() List<AcademicQualification> get academicQualifications {
  if (_academicQualifications is EqualUnmodifiableListView) return _academicQualifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_academicQualifications);
}

// Work Experiences (list, can be empty)
 final  List<WorkExperience> _workExperiences;
// Work Experiences (list, can be empty)
@override@JsonKey() List<WorkExperience> get workExperiences {
  if (_workExperiences is EqualUnmodifiableListView) return _workExperiences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workExperiences);
}

// Specific mandatory document files (local representation)
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? cvFile;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? nationalIdFile;
// Other supporting documents (list, can be empty)
 final  List<GeneralDocument> _otherDocuments;
// Other supporting documents (list, can be empty)
@override@JsonKey() List<GeneralDocument> get otherDocuments {
  if (_otherDocuments is EqualUnmodifiableListView) return _otherDocuments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_otherDocuments);
}


/// Create a copy of RegistrationFormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationFormDataCopyWith<_RegistrationFormData> get copyWith => __$RegistrationFormDataCopyWithImpl<_RegistrationFormData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationFormData&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other._academicQualifications, _academicQualifications)&&const DeepCollectionEquality().equals(other._workExperiences, _workExperiences)&&(identical(other.cvFile, cvFile) || other.cvFile == cvFile)&&(identical(other.nationalIdFile, nationalIdFile) || other.nationalIdFile == nationalIdFile)&&const DeepCollectionEquality().equals(other._otherDocuments, _otherDocuments));
}


@override
int get hashCode => Object.hash(runtimeType,personalInfo,const DeepCollectionEquality().hash(_academicQualifications),const DeepCollectionEquality().hash(_workExperiences),cvFile,nationalIdFile,const DeepCollectionEquality().hash(_otherDocuments));

@override
String toString() {
  return 'RegistrationFormData(personalInfo: $personalInfo, academicQualifications: $academicQualifications, workExperiences: $workExperiences, cvFile: $cvFile, nationalIdFile: $nationalIdFile, otherDocuments: $otherDocuments)';
}


}

/// @nodoc
abstract mixin class _$RegistrationFormDataCopyWith<$Res> implements $RegistrationFormDataCopyWith<$Res> {
  factory _$RegistrationFormDataCopyWith(_RegistrationFormData value, $Res Function(_RegistrationFormData) _then) = __$RegistrationFormDataCopyWithImpl;
@override @useResult
$Res call({
 PersonalInfo? personalInfo, List<AcademicQualification> academicQualifications, List<WorkExperience> workExperiences,@JsonKey(includeFromJson: false, includeToJson: false) File? cvFile,@JsonKey(includeFromJson: false, includeToJson: false) File? nationalIdFile, List<GeneralDocument> otherDocuments
});


@override $PersonalInfoCopyWith<$Res>? get personalInfo;

}
/// @nodoc
class __$RegistrationFormDataCopyWithImpl<$Res>
    implements _$RegistrationFormDataCopyWith<$Res> {
  __$RegistrationFormDataCopyWithImpl(this._self, this._then);

  final _RegistrationFormData _self;
  final $Res Function(_RegistrationFormData) _then;

/// Create a copy of RegistrationFormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? personalInfo = freezed,Object? academicQualifications = null,Object? workExperiences = null,Object? cvFile = freezed,Object? nationalIdFile = freezed,Object? otherDocuments = null,}) {
  return _then(_RegistrationFormData(
personalInfo: freezed == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo?,academicQualifications: null == academicQualifications ? _self._academicQualifications : academicQualifications // ignore: cast_nullable_to_non_nullable
as List<AcademicQualification>,workExperiences: null == workExperiences ? _self._workExperiences : workExperiences // ignore: cast_nullable_to_non_nullable
as List<WorkExperience>,cvFile: freezed == cvFile ? _self.cvFile : cvFile // ignore: cast_nullable_to_non_nullable
as File?,nationalIdFile: freezed == nationalIdFile ? _self.nationalIdFile : nationalIdFile // ignore: cast_nullable_to_non_nullable
as File?,otherDocuments: null == otherDocuments ? _self._otherDocuments : otherDocuments // ignore: cast_nullable_to_non_nullable
as List<GeneralDocument>,
  ));
}

/// Create a copy of RegistrationFormData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res>? get personalInfo {
    if (_self.personalInfo == null) {
    return null;
  }

  return $PersonalInfoCopyWith<$Res>(_self.personalInfo!, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}
}

// dart format on
