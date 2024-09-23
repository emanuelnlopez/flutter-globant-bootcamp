import 'package:flutter/material.dart';

class MatchScore extends StatelessWidget {
  const MatchScore({
    required this.awayTeamScore,
    required this.homeTeamScore,
    super.key,
  });

  final String awayTeamScore;
  final String homeTeamScore;

  @override
  Widget build(BuildContext context) => Text(
        '$homeTeamScore - $awayTeamScore',
        style: Theme.of(context).textTheme.titleLarge,
      );
}
