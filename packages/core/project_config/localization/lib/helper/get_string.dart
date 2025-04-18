import 'package:flutter/material.dart';
import 'package:localization/i18n/gen/app_localizations.dart';

extension GetString on BuildContext {
  AppLocalizations? getString() {
    return AppLocalizations.of(this);
  }
}
