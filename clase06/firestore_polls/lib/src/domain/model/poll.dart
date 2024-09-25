class Poll {
  Poll({
    this.id,
    required this.question,
    required this.options,
    required this.votes,
  });

  final String? id;
  final String question;
  final List<String> options;
  final Map<String, int> votes;

  int get totalVotes => votes.values.fold(0, (sum, votes) => sum + votes);

  double getPercentage(String option) =>
      totalVotes > 0 ? votes[option]! / totalVotes * 100 : 0;

  Poll copyWith({
    String? id,
    String? question,
    List<String>? options,
    Map<String, int>? votes,
  }) =>
      Poll(
        id: id ?? this.id,
        question: question ?? this.question,
        options: options ?? this.options,
        votes: votes ?? this.votes,
      );
}
