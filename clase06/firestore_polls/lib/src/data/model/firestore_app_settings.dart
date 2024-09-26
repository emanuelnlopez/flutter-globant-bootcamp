import 'package:firestore_polls/src/domain/domain.dart';

class FirestoreAppSettings extends AppSettings {
  FirestoreAppSettings({required super.create});

  factory FirestoreAppSettings.fromAppSettings(
    AppSettings appSettings,
  ) =>
      FirestoreAppSettings(create: appSettings.create);

  factory FirestoreAppSettings.fromMap(Map<String, dynamic> map) =>
      FirestoreAppSettings(create: map['create']);

  Map<String, dynamic> toMap() => {'create': create};
}
