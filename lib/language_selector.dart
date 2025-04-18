import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  final Function(Locale) onLanguageSelected;

  const LanguageSelector({
    super.key,
    required this.onLanguageSelected,
  });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  final List<Map<String, dynamic>> _languages = [
    {'label': 'English', 'locale': const Locale('en')},
    {'label': 'हिन्दी', 'locale': const Locale('hi')},
    {'label': 'मराठी', 'locale': const Locale('mr')},
    {'label': 'ગુજરાતી', 'locale': const Locale('gu')},
    {'label': 'বাংলা', 'locale': const Locale('bn')},
    {'label': 'తెలుగు', 'locale': const Locale('te')},
    {'label': 'தமிழ்', 'locale': const Locale('ta')},
    {'label': 'ਪੰਜਾਬੀ', 'locale': const Locale('pa')},
    {'label': 'ಕನ್ನಡ', 'locale': const Locale('kn')},
    {'label': 'മലയാളം', 'locale': const Locale('ml')},
    {'label': 'ଓଡ଼ିଆ', 'locale': const Locale('or')},
  ];
  late Locale _selectedLocale;

  @override
  void initState() {
    super.initState();
    _selectedLocale = const Locale('en'); // Default to English
    widget.onLanguageSelected(_selectedLocale);
  }

  void _selectLanguage(Locale locale) {
    setState(() => _selectedLocale = locale);
    widget.onLanguageSelected(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: _languages.map((lang) {
        final isSelected = _selectedLocale == lang['locale'];
        return ChoiceChip(
          label: Text(lang['label']),
          selected: isSelected,
          onSelected: (_) => _selectLanguage(lang['locale']),
          selectedColor: Colors.blue.shade100,
          labelStyle: TextStyle(
            color: isSelected ? Colors.blue.shade900 : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }
}
