import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_polls/src/data/data.dart';
import 'package:firestore_polls/src/domain/domain.dart';

class FirestoreAppSettingsRepository extends Disposable
    implements AppSettingsRepository {
  FirestoreAppSettingsRepository() {
    _clearSubscriptions();
    _subscriptions.add(
      _firestoreDatabase
          .collection('admin')
          .doc('settings')
          .snapshots()
          .listen((document) => _parseSettings(document)),
    );
  }

  final _firestoreDatabase = FirebaseFirestore.instance;
  final _settingsStreamController = StreamController<AppSettings>.broadcast();
  final _subscriptions = <StreamSubscription>[];
  late AppSettings _settings;

  @override
  Stream<AppSettings> get settingsStream => _settingsStreamController.stream;

  void _clearSubscriptions() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }

    _subscriptions.clear();
  }

  void _parseSettings(DocumentSnapshot<Map<String, dynamic>> document) {
    _settings = FirestoreAppSettings.fromMap(document.data()!);
    _settingsStreamController.add(_settings);
  }

  @override
  void dispose() {
    _clearSubscriptions();
    _settingsStreamController.close();
  }
}
