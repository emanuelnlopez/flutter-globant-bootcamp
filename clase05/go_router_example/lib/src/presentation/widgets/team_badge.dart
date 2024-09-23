import 'package:flutter/material.dart';
import 'package:go_router_example/src/domain/domain.dart';
import 'package:go_router_example/src/presentation/constants/random_values.dart';

class TeamBadge extends StatelessWidget {
  const TeamBadge({
    super.key,
    required this.team,
  });

  final SoccerTeam team;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: RandomValues.getTeamColor(code: team.code),
              minRadius: 20.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              team.name,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
