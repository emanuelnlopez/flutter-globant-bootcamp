import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String locale(Object locale) {
    return 'Locale: $locale';
  }

  @override
  String get home_screen_title => 'i18n and l10n demo';

  @override
  String get hello_world => 'Hola Mundo!';

  @override
  String date(Object date) {
    return 'Fecha: $date';
  }

  @override
  String time(Object time) {
    return 'Hora: $time';
  }

  @override
  String currency(Object currency) {
    return 'Moneda: $currency';
  }

  @override
  String get currency_symbol => 'ARS';

  @override
  String percentage(Object percetage) {
    return 'Porcentaje: $percetage';
  }
}
