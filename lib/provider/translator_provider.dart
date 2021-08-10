import 'package:flutter/material.dart';

class TranslatorData extends ChangeNotifier {
  String translatedData = '';
  String fromLanguageLabel = 'English';
  String fromLanguageValue = 'en';
  String toLanguageLabel = 'Arabic';
  String toLanguageValue = 'ar';

  void updateText({required String text}) {
    translatedData = text;
    if (text.isEmpty) {
      clearText();
    }
    notifyListeners();
  }

  void updateFromLanguage({required String label, required String value}) {
    fromLanguageLabel = label;
    fromLanguageValue = value;
    notifyListeners();
  }

  void updateToLanguage({required String label, required String value}) {
    toLanguageLabel = label;
    toLanguageValue = value;
    notifyListeners();
  }

  void clearText() {
    translatedData = '';
    notifyListeners();
  }
}
