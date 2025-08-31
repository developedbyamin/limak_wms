import 'package:flutter/material.dart';
import 'package:limak_courier/core/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
