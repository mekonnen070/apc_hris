
import 'string_extension.dart';

extension EnumDisplayExtension on Enum {
  String get toDisplayString => name.toDisplayCase();
}
