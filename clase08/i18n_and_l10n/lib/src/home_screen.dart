import 'package:flutter/material.dart';
import 'package:i18n_and_l10n/l10n/l10n_gen/app_localizations.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context);
    final dateFormatter = DateFormat.yMMMMd(appLocalizations.localeName);
    final timeFormatter = DateFormat.Hms(appLocalizations.localeName);
    final currencyFormatter = NumberFormat.currency(
      locale: appLocalizations.localeName,
      symbol: appLocalizations.currency_symbol,
    );
    final percentFormatter = NumberFormat.percentPattern(
      appLocalizations.localeName,
    );

    final now = DateTime.now();
    const amount = 1234567.89;
    const percentage = 0.1234;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.home_screen_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocalizations.hello_world,
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 20.0),
            Text(
              appLocalizations.locale(appLocalizations.localeName),
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 10.0),
            Text(
              appLocalizations.date(dateFormatter.format(now)),
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 10.0),
            Text(
              appLocalizations.time(timeFormatter.format(now)),
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 10.0),
            Text(
              appLocalizations.currency(currencyFormatter.format(amount)),
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 10.0),
            Text(
              appLocalizations.percentage(
                percentFormatter.format(percentage),
              ),
              style: textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
