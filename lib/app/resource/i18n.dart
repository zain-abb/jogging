import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// A helper class to help developers use localization easily without the need to import generated
/// [app_localizations.dart] file.
class I18n {
  I18n._();

  static LocalizationsDelegate getDelegate() {
    return AppLocalizations.delegate;
  }

  static AppLocalizations? values(BuildContext context) {
    return AppLocalizations.of(context);
  }
}
