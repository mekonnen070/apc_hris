// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardingTaskModel {

 String get id;// Unique ID for the onboarding task
 String get applicantId;// ID of the applicant/new hire being onboarded
 String get title; String? get description; OnboardingTaskStatus get status; DateTime? get dueDate; DateTime? get completionDate; TaskAssigneeType get assignedTo;// Who is primarily responsible
 String? get notes;// For HR or new hire to add comments
// For tasks that require document upload by the new hire
 String? get requiredDocumentName;@JsonKey(includeFromJson: false, includeToJson: false) File? get uploadedDocumentFile;// Local file
 String? get uploadedDocumentPath;// Path/URL after backend upload
// For checklist items from ApplicantCheckListVm.cs
 bool get isChecklistItem;// To identify tasks that are simple checks
 String? get checkRemark; String? get createdBy;// User ID of who created the task (if manually added)
 DateTime? get createdAt;
/// Create a copy of OnboardingTaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingTaskModelCopyWith<OnboardingTaskModel> get copyWith => _$OnboardingTaskModelCopyWithImpl<OnboardingTaskModel>(this as OnboardingTaskModel, _$identity);

  /// Serializes this OnboardingTaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingTaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.completionDate, completionDate) || other.completionDate == completionDate)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.requiredDocumentName, requiredDocumentName) || other.requiredDocumentName == requiredDocumentName)&&(identical(other.uploadedDocumentFile, uploadedDocumentFile) || other.uploadedDocumentFile == uploadedDocumentFile)&&(identical(other.uploadedDocumentPath, uploadedDocumentPath) || other.uploadedDocumentPath == uploadedDocumentPath)&&(identical(other.isChecklistItem, isChecklistItem) || other.isChecklistItem == isChecklistItem)&&(identical(other.checkRemark, checkRemark) || other.checkRemark == checkRemark)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicantId,title,description,status,dueDate,completionDate,assignedTo,notes,requiredDocumentName,uploadedDocumentFile,uploadedDocumentPath,isChecklistItem,checkRemark,createdBy,createdAt);

@override
String toString() {
  return 'OnboardingTaskModel(id: $id, applicantId: $applicantId, title: $title, description: $description, status: $status, dueDate: $dueDate, completionDate: $completionDate, assignedTo: $assignedTo, notes: $notes, requiredDocumentName: $requiredDocumentName, uploadedDocumentFile: $uploadedDocumentFile, uploadedDocumentPath: $uploadedDocumentPath, isChecklistItem: $isChecklistItem, checkRemark: $checkRemark, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $OnboardingTaskModelCopyWith<$Res>  {
  factory $OnboardingTaskModelCopyWith(OnboardingTaskModel value, $Res Function(OnboardingTaskModel) _then) = _$OnboardingTaskModelCopyWithImpl;
@useResult
$Res call({
 String id, String applicantId, String title, String? description, OnboardingTaskStatus status, DateTime? dueDate, DateTime? completionDate, TaskAssigneeType assignedTo, String? notes, String? requiredDocumentName,@JsonKey(includeFromJson: false, includeToJson: false) File? uploadedDocumentFile, String? uploadedDocumentPath, bool isChecklistItem, String? checkRemark, String? createdBy, DateTime? createdAt
});




}
/// @nodoc
class _$OnboardingTaskModelCopyWithImpl<$Res>
    implements $OnboardingTaskModelCopyWith<$Res> {
  _$OnboardingTaskModelCopyWithImpl(this._self, this._then);

  final OnboardingTaskModel _self;
  final $Res Function(OnboardingTaskModel) _then;

/// Create a copy of OnboardingTaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? applicantId = null,Object? title = null,Object? description = freezed,Object? status = null,Object? dueDate = freezed,Object? completionDate = freezed,Object? assignedTo = null,Object? notes = freezed,Object? requiredDocumentName = freezed,Object? uploadedDocumentFile = freezed,Object? uploadedDocumentPath = freezed,Object? isChecklistItem = null,Object? checkRemark = freezed,Object? createdBy = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OnboardingTaskStatus,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,completionDate: freezed == completionDate ? _self.completionDate : completionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedTo: null == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as TaskAssigneeType,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,requiredDocumentName: freezed == requiredDocumentName ? _self.requiredDocumentName : requiredDocumentName // ignore: cast_nullable_to_non_nullable
as String?,uploadedDocumentFile: freezed == uploadedDocumentFile ? _self.uploadedDocumentFile : uploadedDocumentFile // ignore: cast_nullable_to_non_nullable
as File?,uploadedDocumentPath: freezed == uploadedDocumentPath ? _self.uploadedDocumentPath : uploadedDocumentPath // ignore: cast_nullable_to_non_nullable
as String?,isChecklistItem: null == isChecklistItem ? _self.isChecklistItem : isChecklistItem // ignore: cast_nullable_to_non_nullable
as bool,checkRemark: freezed == checkRemark ? _self.checkRemark : checkRemark // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OnboardingTaskModel implements OnboardingTaskModel {
  const _OnboardingTaskModel({required this.id, required this.applicantId, required this.title, this.description, this.status = OnboardingTaskStatus.pending, this.dueDate, this.completionDate, this.assignedTo = TaskAssigneeType.hr, this.notes, this.requiredDocumentName, @JsonKey(includeFromJson: false, includeToJson: false) this.uploadedDocumentFile, this.uploadedDocumentPath, this.isChecklistItem = false, this.checkRemark, this.createdBy, this.createdAt});
  factory _OnboardingTaskModel.fromJson(Map<String, dynamic> json) => _$OnboardingTaskModelFromJson(json);

@override final  String id;
// Unique ID for the onboarding task
@override final  String applicantId;
// ID of the applicant/new hire being onboarded
@override final  String title;
@override final  String? description;
@override@JsonKey() final  OnboardingTaskStatus status;
@override final  DateTime? dueDate;
@override final  DateTime? completionDate;
@override@JsonKey() final  TaskAssigneeType assignedTo;
// Who is primarily responsible
@override final  String? notes;
// For HR or new hire to add comments
// For tasks that require document upload by the new hire
@override final  String? requiredDocumentName;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? uploadedDocumentFile;
// Local file
@override final  String? uploadedDocumentPath;
// Path/URL after backend upload
// For checklist items from ApplicantCheckListVm.cs
@override@JsonKey() final  bool isChecklistItem;
// To identify tasks that are simple checks
@override final  String? checkRemark;
@override final  String? createdBy;
// User ID of who created the task (if manually added)
@override final  DateTime? createdAt;

/// Create a copy of OnboardingTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingTaskModelCopyWith<_OnboardingTaskModel> get copyWith => __$OnboardingTaskModelCopyWithImpl<_OnboardingTaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardingTaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingTaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicantId, applicantId) || other.applicantId == applicantId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.completionDate, completionDate) || other.completionDate == completionDate)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.requiredDocumentName, requiredDocumentName) || other.requiredDocumentName == requiredDocumentName)&&(identical(other.uploadedDocumentFile, uploadedDocumentFile) || other.uploadedDocumentFile == uploadedDocumentFile)&&(identical(other.uploadedDocumentPath, uploadedDocumentPath) || other.uploadedDocumentPath == uploadedDocumentPath)&&(identical(other.isChecklistItem, isChecklistItem) || other.isChecklistItem == isChecklistItem)&&(identical(other.checkRemark, checkRemark) || other.checkRemark == checkRemark)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicantId,title,description,status,dueDate,completionDate,assignedTo,notes,requiredDocumentName,uploadedDocumentFile,uploadedDocumentPath,isChecklistItem,checkRemark,createdBy,createdAt);

@override
String toString() {
  return 'OnboardingTaskModel(id: $id, applicantId: $applicantId, title: $title, description: $description, status: $status, dueDate: $dueDate, completionDate: $completionDate, assignedTo: $assignedTo, notes: $notes, requiredDocumentName: $requiredDocumentName, uploadedDocumentFile: $uploadedDocumentFile, uploadedDocumentPath: $uploadedDocumentPath, isChecklistItem: $isChecklistItem, checkRemark: $checkRemark, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OnboardingTaskModelCopyWith<$Res> implements $OnboardingTaskModelCopyWith<$Res> {
  factory _$OnboardingTaskModelCopyWith(_OnboardingTaskModel value, $Res Function(_OnboardingTaskModel) _then) = __$OnboardingTaskModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String applicantId, String title, String? description, OnboardingTaskStatus status, DateTime? dueDate, DateTime? completionDate, TaskAssigneeType assignedTo, String? notes, String? requiredDocumentName,@JsonKey(includeFromJson: false, includeToJson: false) File? uploadedDocumentFile, String? uploadedDocumentPath, bool isChecklistItem, String? checkRemark, String? createdBy, DateTime? createdAt
});




}
/// @nodoc
class __$OnboardingTaskModelCopyWithImpl<$Res>
    implements _$OnboardingTaskModelCopyWith<$Res> {
  __$OnboardingTaskModelCopyWithImpl(this._self, this._then);

  final _OnboardingTaskModel _self;
  final $Res Function(_OnboardingTaskModel) _then;

/// Create a copy of OnboardingTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? applicantId = null,Object? title = null,Object? description = freezed,Object? status = null,Object? dueDate = freezed,Object? completionDate = freezed,Object? assignedTo = null,Object? notes = freezed,Object? requiredDocumentName = freezed,Object? uploadedDocumentFile = freezed,Object? uploadedDocumentPath = freezed,Object? isChecklistItem = null,Object? checkRemark = freezed,Object? createdBy = freezed,Object? createdAt = freezed,}) {
  return _then(_OnboardingTaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicantId: null == applicantId ? _self.applicantId : applicantId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OnboardingTaskStatus,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,completionDate: freezed == completionDate ? _self.completionDate : completionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedTo: null == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as TaskAssigneeType,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,requiredDocumentName: freezed == requiredDocumentName ? _self.requiredDocumentName : requiredDocumentName // ignore: cast_nullable_to_non_nullable
as String?,uploadedDocumentFile: freezed == uploadedDocumentFile ? _self.uploadedDocumentFile : uploadedDocumentFile // ignore: cast_nullable_to_non_nullable
as File?,uploadedDocumentPath: freezed == uploadedDocumentPath ? _self.uploadedDocumentPath : uploadedDocumentPath // ignore: cast_nullable_to_non_nullable
as String?,isChecklistItem: null == isChecklistItem ? _self.isChecklistItem : isChecklistItem // ignore: cast_nullable_to_non_nullable
as bool,checkRemark: freezed == checkRemark ? _self.checkRemark : checkRemark // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
