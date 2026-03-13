import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stepik/localization/l10n/gen/app_localizations.dart';
import 'package:flutter_stepik/localization/localization_test_app/locale_app_screen.dart';

class LocalApp extends StatefulWidget {
  const LocalApp({super.key});

  @override
  State<LocalApp> createState() => _LocalAppState();
}

class _LocalAppState extends State<LocalApp> {
  Locale _locale = const Locale('en');

  void _toggleLocale() {
    setState(() {
      _locale = _locale.languageCode == 'en' ? Locale('ru') : Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).title,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ru')],
      locale: _locale,
      debugShowCheckedModeBanner: false,
      home: LocaleAppScreen(onLocaleToggle: _toggleLocale),
    );
  }
}
