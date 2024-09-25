import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_polls/src/data/data.dart';
import 'package:firestore_polls/src/domain/domain.dart';

abstract class Disposable {
  void dispose();
}

class FirestorePollRepository extends Disposable implements PollRepository {
  FirestorePollRepository() {
    _clearSubscriptions();
    _firestoreDatabase
        .collection('polls')
        .snapshots()
        .listen((snapshot) => _parsePolls(snapshot));
  }

  final _firestoreDatabase = FirebaseFirestore.instance;
  final _polls = <String, Poll>{};
  final _pollStreamController = StreamController<Poll>.broadcast();
  final _pollsStreamController = StreamController<List<Poll>>.broadcast();
  final _subscriptions = <String, StreamSubscription>{};

  @override
  Stream<Poll> get pollStream => _pollStreamController.stream;

  @override
  Stream<List<Poll>> get pollsStream => _pollsStreamController.stream;

  @override
  Future<void> create(Poll poll) async {
    final dbPoll = FirestorePoll.fromPoll(poll);
    await _firestoreDatabase.collection('polls').add(dbPoll.toMap());
  }

  @override
  Future<void> delete(String pollId) async {
    await _firestoreDatabase.collection('polls').doc(pollId).delete();
  }

  @override
  void firePoll(String id) {
    if (_polls.containsKey(id)) {
      _pollStreamController.add(_polls[id]!);
    }
  }

  @override
  void firePolls() {
    _pollsStreamController.add(_polls.values.toList());
  }

  @override
  Future<void> update(Poll poll) async {
    final dbPoll = FirestorePoll.fromPoll(poll);
    await _firestoreDatabase
        .collection('polls')
        .doc(poll.id)
        .update(dbPoll.toMap());
  }

  void _parsePolls(QuerySnapshot<Map<String, dynamic>> snapshot) {
    _polls.clear();
    for (final doc in snapshot.docs) {
      final poll = FirestorePoll.fromMap(doc.data(), documentId: doc.id);
      _polls[poll.id!] = poll;
      _pollStreamController.add(poll);
    }
    _pollsStreamController.add(_polls.values.toList());
  }

  void _clearSubscriptions() {
    for (var sub in _subscriptions.entries) {
      sub.value.cancel();
    }

    _subscriptions.clear();
  }

  @override
  void dispose() {
    _clearSubscriptions();
    _pollStreamController.close();
    _pollsStreamController.close();
  }
}
