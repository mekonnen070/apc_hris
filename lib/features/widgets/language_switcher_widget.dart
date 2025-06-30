import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/lango_enum.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/l10n/language_controller.dart';

class LanguageSwitcherWidget extends ConsumerWidget {
  const LanguageSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageControllerProvider);
    final List<Lango> languages = List.from(Lango.values);

    return IconButton(
      icon: const Icon(Icons.language, size: 32),
      tooltip: context.lango.language,
      onPressed: () async {
        final selectedLanguage = await showAdaptiveDialog<Lango>(
          context: context,
          builder:
              (_) => _LanguageDialog(
                languages: languages,
                currentLanguage: currentLanguage,
              ),
        );
        if (selectedLanguage != null) {
          await ref
              .read(languageControllerProvider.notifier)
              .updateLanguage(selectedLanguage);

          
        }
      },
    );
  }
}

class _LanguageDialog extends StatelessWidget {
  const _LanguageDialog({
    required this.languages,
    required this.currentLanguage,
  });

  final List<Lango> languages;
  final Lango currentLanguage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(context.lango.language),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
              languages.map((lang) {
                return Card(
                  child: RadioListTile.adaptive(
                    value: lang,
                    dense: true,
                    groupValue: currentLanguage,
                    title: Text(lang.name),
                    onChanged: (value) => Navigator.of(context).pop(value),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
