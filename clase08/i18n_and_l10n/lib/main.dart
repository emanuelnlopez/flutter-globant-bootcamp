import 'package:flutter/material.dart';
import 'package:i18n_and_l10n/l10n/l10n_gen/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_and_l10n/src/home_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'i18n & l10n Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      home: const HomeScreen(),
    );
  }
}
