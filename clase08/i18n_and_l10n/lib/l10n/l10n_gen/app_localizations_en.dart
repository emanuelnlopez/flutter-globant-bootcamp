import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String locale(Object locale) {
    return 'Locale: $locale';
  }

  @override
  String get home_screen_title => 'Demo i18n y l10n';

  @override
  String get hello_world => 'Hello World!';

  @override
  String date(Object date) {
    return 'Date: $date';
  }

  @override
  String time(Object time) {
    return 'Time: $time';
  }

  @override
  String currency(Object currency) {
    return 'Curency: $currency';
  }

  @override
  String get currency_symbol => 'USD';

  @override
  String percentage(Object percetage) {
    return 'Porcentage: $percetage';
  }
}
