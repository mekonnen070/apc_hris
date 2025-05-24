// file_converter.dart
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

class FileConverter implements JsonConverter<File?, String?> {
  const FileConverter();

  @override
  File? fromJson(String? json) {
    // Converts a file path string from JSON into a File object
    return json == null ? null : File(json);
  }

  @override
  String? toJson(File? object) {
    // Converts a File object into its path string for JSON
    return object?.path;
  }
}