import 'package:flutter/material.dart';
import 'package:go_router_example/src/domain/domain.dart';
import 'package:go_router_example/src/presentation/presentation.dart';

class MatchListItem extends StatelessWidget {
  const MatchListItem({required this.match, super.key});

  final SoccerMatch match;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        child: Row(
          children: [
            TeamBadge(team: match.homeTeam),
            MatchScore(
              awayTeamScore: match.awayTeamScore,
              homeTeamScore: match.homeTeamScore,
            ),
            TeamBadge(team: match.awayTeam),
          ],
        ),
      );
}
