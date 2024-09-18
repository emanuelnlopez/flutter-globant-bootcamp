import 'package:crypto_prices/src/presentation/state/application_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<ApplicationPreferences>();
    return Scaffold(
      appBar: AppBar(title: const Text('Application Settings')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Dark mode'),
              value: prefs.darkMode,
              onChanged: (_) => prefs.toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
