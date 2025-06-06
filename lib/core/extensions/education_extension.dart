// In your education_level.dart or a new extensions_on_enums.dart
import '../enums/education_level.dart';

extension EducationLevelX on EducationLevel {
  String get displayName {
    // Implement logic to return user-friendly string, possibly from localization
    String name =
        this.name
            .replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}')
            .trim();
    return name.isEmpty ? '' : name[0].toUpperCase() + name.substring(1);
  }
}
