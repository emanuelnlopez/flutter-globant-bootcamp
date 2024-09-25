import 'package:firestore_polls/src/domain/domain.dart';

class PollController {
  PollController({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;

  final PollRepository _pollRepository;

  Stream<Poll> get pollStream => _pollRepository.pollStream;

  Stream<List<Poll>> get pollsStream => _pollRepository.pollsStream;

  Future<void> create(Poll poll) async {
    await _pollRepository.create(poll);
  }

  Future<void> delete(String pollId) async {
    await _pollRepository.delete(pollId);
  }

  Future<void> vote(Poll poll) async {
    await _pollRepository.update(poll);
  }

  void firePoll(String pollId) {
    _pollRepository.firePoll(pollId);
  }
}
