// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeUploadModel {

 String? get documentId;// C# is nullable but Key
 String get employeeId; String get documentName; DocumentType get documentType; String? get description; String? get filePath;// This is the URL/path from backend after upload
// For local file handling before upload
@JsonKey(includeFromJson: false, includeToJson: false) File? get documentFile; DateTime? get expiryDate; bool get isActive; String? get uploadedBy;// Audit
 DateTime? get uploadDate;
/// Create a copy of EmployeeUploadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeUploadModelCopyWith<EmployeeUploadModel> get copyWith => _$EmployeeUploadModelCopyWithImpl<EmployeeUploadModel>(this as EmployeeUploadModel, _$identity);

  /// Serializes this EmployeeUploadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeUploadModel&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.documentName, documentName) || other.documentName == documentName)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.description, description) || other.description == description)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.documentFile, documentFile) || other.documentFile == documentFile)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uploadDate, uploadDate) || other.uploadDate == uploadDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentId,employeeId,documentName,documentType,description,filePath,documentFile,expiryDate,isActive,uploadedBy,uploadDate);

@override
String toString() {
  return 'EmployeeUploadModel(documentId: $documentId, employeeId: $employeeId, documentName: $documentName, documentType: $documentType, description: $description, filePath: $filePath, documentFile: $documentFile, expiryDate: $expiryDate, isActive: $isActive, uploadedBy: $uploadedBy, uploadDate: $uploadDate)';
}


}

/// @nodoc
abstract mixin class $EmployeeUploadModelCopyWith<$Res>  {
  factory $EmployeeUploadModelCopyWith(EmployeeUploadModel value, $Res Function(EmployeeUploadModel) _then) = _$EmployeeUploadModelCopyWithImpl;
@useResult
$Res call({
 String? documentId, String employeeId, String documentName, DocumentType documentType, String? description, String? filePath,@JsonKey(includeFromJson: false, includeToJson: false) File? documentFile, DateTime? expiryDate, bool isActive, String? uploadedBy, DateTime? uploadDate
});




}
/// @nodoc
class _$EmployeeUploadModelCopyWithImpl<$Res>
    implements $EmployeeUploadModelCopyWith<$Res> {
  _$EmployeeUploadModelCopyWithImpl(this._self, this._then);

  final EmployeeUploadModel _self;
  final $Res Function(EmployeeUploadModel) _then;

/// Create a copy of EmployeeUploadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documentId = freezed,Object? employeeId = null,Object? documentName = null,Object? documentType = null,Object? description = freezed,Object? filePath = freezed,Object? documentFile = freezed,Object? expiryDate = freezed,Object? isActive = null,Object? uploadedBy = freezed,Object? uploadDate = freezed,}) {
  return _then(_self.copyWith(
documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,documentName: null == documentName ? _self.documentName : documentName // ignore: cast_nullable_to_non_nullable
as String,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,documentFile: freezed == documentFile ? _self.documentFile : documentFile // ignore: cast_nullable_to_non_nullable
as File?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,uploadedBy: freezed == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String?,uploadDate: freezed == uploadDate ? _self.uploadDate : uploadDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EmployeeUploadModel implements EmployeeUploadModel {
  const _EmployeeUploadModel({this.documentId, required this.employeeId, required this.documentName, required this.documentType, this.description, this.filePath, @JsonKey(includeFromJson: false, includeToJson: false) this.documentFile, this.expiryDate, this.isActive = true, this.uploadedBy, this.uploadDate});
  factory _EmployeeUploadModel.fromJson(Map<String, dynamic> json) => _$EmployeeUploadModelFromJson(json);

@override final  String? documentId;
// C# is nullable but Key
@override final  String employeeId;
@override final  String documentName;
@override final  DocumentType documentType;
@override final  String? description;
@override final  String? filePath;
// This is the URL/path from backend after upload
// For local file handling before upload
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? documentFile;
@override final  DateTime? expiryDate;
@override@JsonKey() final  bool isActive;
@override final  String? uploadedBy;
// Audit
@override final  DateTime? uploadDate;

/// Create a copy of EmployeeUploadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeUploadModelCopyWith<_EmployeeUploadModel> get copyWith => __$EmployeeUploadModelCopyWithImpl<_EmployeeUploadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeUploadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeUploadModel&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.documentName, documentName) || other.documentName == documentName)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.description, description) || other.description == description)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.documentFile, documentFile) || other.documentFile == documentFile)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uploadDate, uploadDate) || other.uploadDate == uploadDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentId,employeeId,documentName,documentType,description,filePath,documentFile,expiryDate,isActive,uploadedBy,uploadDate);

@override
String toString() {
  return 'EmployeeUploadModel(documentId: $documentId, employeeId: $employeeId, documentName: $documentName, documentType: $documentType, description: $description, filePath: $filePath, documentFile: $documentFile, expiryDate: $expiryDate, isActive: $isActive, uploadedBy: $uploadedBy, uploadDate: $uploadDate)';
}


}

/// @nodoc
abstract mixin class _$EmployeeUploadModelCopyWith<$Res> implements $EmployeeUploadModelCopyWith<$Res> {
  factory _$EmployeeUploadModelCopyWith(_EmployeeUploadModel value, $Res Function(_EmployeeUploadModel) _then) = __$EmployeeUploadModelCopyWithImpl;
@override @useResult
$Res call({
 String? documentId, String employeeId, String documentName, DocumentType documentType, String? description, String? filePath,@JsonKey(includeFromJson: false, includeToJson: false) File? documentFile, DateTime? expiryDate, bool isActive, String? uploadedBy, DateTime? uploadDate
});




}
/// @nodoc
class __$EmployeeUploadModelCopyWithImpl<$Res>
    implements _$EmployeeUploadModelCopyWith<$Res> {
  __$EmployeeUploadModelCopyWithImpl(this._self, this._then);

  final _EmployeeUploadModel _self;
  final $Res Function(_EmployeeUploadModel) _then;

/// Create a copy of EmployeeUploadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documentId = freezed,Object? employeeId = null,Object? documentName = null,Object? documentType = null,Object? description = freezed,Object? filePath = freezed,Object? documentFile = freezed,Object? expiryDate = freezed,Object? isActive = null,Object? uploadedBy = freezed,Object? uploadDate = freezed,}) {
  return _then(_EmployeeUploadModel(
documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,documentName: null == documentName ? _self.documentName : documentName // ignore: cast_nullable_to_non_nullable
as String,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,documentFile: freezed == documentFile ? _self.documentFile : documentFile // ignore: cast_nullable_to_non_nullable
as File?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,uploadedBy: freezed == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String?,uploadDate: freezed == uploadDate ? _self.uploadDate : uploadDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
