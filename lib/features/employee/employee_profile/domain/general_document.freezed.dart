// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneralDocument {

 String get id;// Unique identifier
 String get documentDescription;@JsonKey(includeFromJson: false, includeToJson: false) File? get documentFile;// Local file before upload
 String? get documentUrl;
/// Create a copy of GeneralDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralDocumentCopyWith<GeneralDocument> get copyWith => _$GeneralDocumentCopyWithImpl<GeneralDocument>(this as GeneralDocument, _$identity);

  /// Serializes this GeneralDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.documentDescription, documentDescription) || other.documentDescription == documentDescription)&&(identical(other.documentFile, documentFile) || other.documentFile == documentFile)&&(identical(other.documentUrl, documentUrl) || other.documentUrl == documentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentDescription,documentFile,documentUrl);

@override
String toString() {
  return 'GeneralDocument(id: $id, documentDescription: $documentDescription, documentFile: $documentFile, documentUrl: $documentUrl)';
}


}

/// @nodoc
abstract mixin class $GeneralDocumentCopyWith<$Res>  {
  factory $GeneralDocumentCopyWith(GeneralDocument value, $Res Function(GeneralDocument) _then) = _$GeneralDocumentCopyWithImpl;
@useResult
$Res call({
 String id, String documentDescription,@JsonKey(includeFromJson: false, includeToJson: false) File? documentFile, String? documentUrl
});




}
/// @nodoc
class _$GeneralDocumentCopyWithImpl<$Res>
    implements $GeneralDocumentCopyWith<$Res> {
  _$GeneralDocumentCopyWithImpl(this._self, this._then);

  final GeneralDocument _self;
  final $Res Function(GeneralDocument) _then;

/// Create a copy of GeneralDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? documentDescription = null,Object? documentFile = freezed,Object? documentUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,documentDescription: null == documentDescription ? _self.documentDescription : documentDescription // ignore: cast_nullable_to_non_nullable
as String,documentFile: freezed == documentFile ? _self.documentFile : documentFile // ignore: cast_nullable_to_non_nullable
as File?,documentUrl: freezed == documentUrl ? _self.documentUrl : documentUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GeneralDocument implements GeneralDocument {
   _GeneralDocument({required this.id, required this.documentDescription, @JsonKey(includeFromJson: false, includeToJson: false) this.documentFile, this.documentUrl});
  factory _GeneralDocument.fromJson(Map<String, dynamic> json) => _$GeneralDocumentFromJson(json);

@override final  String id;
// Unique identifier
@override final  String documentDescription;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? documentFile;
// Local file before upload
@override final  String? documentUrl;

/// Create a copy of GeneralDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneralDocumentCopyWith<_GeneralDocument> get copyWith => __$GeneralDocumentCopyWithImpl<_GeneralDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneralDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneralDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.documentDescription, documentDescription) || other.documentDescription == documentDescription)&&(identical(other.documentFile, documentFile) || other.documentFile == documentFile)&&(identical(other.documentUrl, documentUrl) || other.documentUrl == documentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentDescription,documentFile,documentUrl);

@override
String toString() {
  return 'GeneralDocument(id: $id, documentDescription: $documentDescription, documentFile: $documentFile, documentUrl: $documentUrl)';
}


}

/// @nodoc
abstract mixin class _$GeneralDocumentCopyWith<$Res> implements $GeneralDocumentCopyWith<$Res> {
  factory _$GeneralDocumentCopyWith(_GeneralDocument value, $Res Function(_GeneralDocument) _then) = __$GeneralDocumentCopyWithImpl;
@override @useResult
$Res call({
 String id, String documentDescription,@JsonKey(includeFromJson: false, includeToJson: false) File? documentFile, String? documentUrl
});




}
/// @nodoc
class __$GeneralDocumentCopyWithImpl<$Res>
    implements _$GeneralDocumentCopyWith<$Res> {
  __$GeneralDocumentCopyWithImpl(this._self, this._then);

  final _GeneralDocument _self;
  final $Res Function(_GeneralDocument) _then;

/// Create a copy of GeneralDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? documentDescription = null,Object? documentFile = freezed,Object? documentUrl = freezed,}) {
  return _then(_GeneralDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,documentDescription: null == documentDescription ? _self.documentDescription : documentDescription // ignore: cast_nullable_to_non_nullable
as String,documentFile: freezed == documentFile ? _self.documentFile : documentFile // ignore: cast_nullable_to_non_nullable
as File?,documentUrl: freezed == documentUrl ? _self.documentUrl : documentUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
