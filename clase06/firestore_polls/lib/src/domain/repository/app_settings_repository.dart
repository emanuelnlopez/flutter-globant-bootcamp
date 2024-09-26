import 'package:firestore_polls/src/domain/domain.dart';

abstract class AppSettingsRepository {
  Stream<AppSettings> get settingsStream;
}
