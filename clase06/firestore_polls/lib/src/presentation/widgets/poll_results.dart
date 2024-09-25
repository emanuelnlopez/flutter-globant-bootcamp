import 'package:firestore_polls/src/domain/domain.dart';
import 'package:flutter/material.dart';

class PollResults extends StatelessWidget {
  const PollResults({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Current Results:',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ...poll.votes.entries.map(
            (entry) => ListTile(
              title: Text(entry.key),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${entry.value} votes (${poll.getPercentage(entry.key).toStringAsFixed(2)}%)',
                  ),
                  LinearProgressIndicator(
                      value: poll.getPercentage(entry.key) / 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
