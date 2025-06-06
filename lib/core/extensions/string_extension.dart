// Helper extension for String capitalization
extension StringExtension on String {
  // Helper for String capitalization if not globally available
  String toCapitalized() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String toDisplayCase() {
    if (isEmpty) return this;
    return replaceAllMapped(
          RegExp(r'(?<!^)(?=[A-Z])'),
          (match) => ' ${match.group(0)}',
        )
        .replaceAll('_', ' ')
        .split(' ')
        .map(
          (word) =>
              word.isEmpty
                  ? ''
                  : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }
}
