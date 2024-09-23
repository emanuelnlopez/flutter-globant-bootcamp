import 'package:go_router_example/src/domain/domain.dart';

class SoccerMatch {
  SoccerMatch({
    required this.awayTeam,
    required this.awayTeamScore,
    required this.homeTeam,
    required this.homeTeamScore,
  });

  final SoccerTeam awayTeam;
  final String awayTeamScore;
  final SoccerTeam homeTeam;
  final String homeTeamScore;

  String get shortReference => '${homeTeam.code}-${awayTeam.code}';
}
