import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';

extension ContextX on BuildContext {
  AppLocalizations get lango => AppLocalizations.of(this)!;
}
