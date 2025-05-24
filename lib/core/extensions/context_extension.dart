import 'package:flutter/material.dart';
import 'package:police_com/core/l10n/generated/app_localizations.dart';

extension ContextX on BuildContext {
  AppLocalizations get lango => AppLocalizations.of(this)!;
}
