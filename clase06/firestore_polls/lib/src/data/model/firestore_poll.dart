import 'package:firestore_polls/src/domain/domain.dart';

class FirestorePoll extends Poll {
  FirestorePoll({
    super.id,
    required super.question,
    required super.options,
    required super.votes,
  });

  factory FirestorePoll.fromPoll(Poll poll) => FirestorePoll(
        id: poll.id,
        question: poll.question,
        options: poll.options,
        votes: poll.votes,
      );

  factory FirestorePoll.fromMap(
    Map<String, dynamic> map, {
    required String documentId,
  }) {
    return FirestorePoll(
      id: documentId,
      question: map['question'],
      options: List<String>.from(map['options']),
      votes: Map<String, int>.from(map['votes']),
    );
  }

  Map<String, dynamic> toMap() => {
        'question': question,
        'options': options,
        'votes': votes,
      };
}
