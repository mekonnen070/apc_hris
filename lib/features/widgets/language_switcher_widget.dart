import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/lango_enum.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/l10n/language_controller.dart';

class LanguageSwitcherWidget extends ConsumerWidget {
  const LanguageSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Lango> languages = List.from(Lango.values);

    return IconButton(
      icon: const Icon(Icons.language, size: 32, color: Colors.white),
      tooltip: context.lango.language,
      onPressed: () async {
        final selectedLanguage = await showModalBottomSheet<Lango>(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
          ),
          isScrollControlled: true,
          showDragHandle: true,
          builder:
              (_) => _LanguageBottomSheet(
                languages: languages,
                languageController: ref.read(
                  languageControllerProvider.notifier,
                ),
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

class _LanguageBottomSheet extends ConsumerWidget {
  const _LanguageBottomSheet({
    required this.languages,
    required this.languageController,
  });

  final List<Lango> languages;
  final LanguageController languageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.lango.language,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: languages.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final lang = languages[index];
                final isSelected = lang == currentLanguage;

                return Material(
                  animationDuration: const Duration(milliseconds: 300),
                  borderRadius: BorderRadius.circular(12),
                  color:
                      isSelected
                          ? colorScheme.primary.withOpacity(0.1)
                          : Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(lang),
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              lang.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color: isSelected ? colorScheme.primary : null,
                              ),
                            ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check_circle_rounded,
                              color: colorScheme.primary,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
