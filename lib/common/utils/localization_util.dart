import 'package:flutter/material.dart';
import 'package:super_internationalized/applocalization.dart';

class LocalizationUtil {
  static String translate(BuildContext context, String key) {
    return AppLocalizations.of(context).translate(key);
  }
}
