import 'package:firestore_polls/src/domain/domain.dart';

class AppSettingsController {
  AppSettingsController({
    required AppSettingsRepository appSettingsRepository,
  }) : _appSettingsRepository = appSettingsRepository;

  final AppSettingsRepository _appSettingsRepository;

  Stream<AppSettings> get settingsStream =>
      _appSettingsRepository.settingsStream;
}
