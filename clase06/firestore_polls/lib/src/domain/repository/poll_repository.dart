import 'package:firestore_polls/src/domain/model/poll.dart';

abstract class PollRepository {
  Stream<Poll> get pollStream;

  Stream<List<Poll>> get pollsStream;

  Future<void> create(Poll poll);

  Future<void> delete(String pollId);

  void firePolls();

  void firePoll(String id);

  Future<void> update(Poll poll);
}
