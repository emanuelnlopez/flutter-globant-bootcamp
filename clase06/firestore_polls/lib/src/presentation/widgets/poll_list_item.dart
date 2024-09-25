import 'package:firestore_polls/src/domain/domain.dart';
import 'package:firestore_polls/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

class PollListItem extends StatelessWidget {
  const PollListItem({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PollVoteScreen(pollId: poll.id!),
          ),
        ),
        subtitle: Text('Total votes: ${poll.totalVotes}'),
        title: Text(poll.question),
        trailing: const Icon(Icons.chevron_right),
      );
}
