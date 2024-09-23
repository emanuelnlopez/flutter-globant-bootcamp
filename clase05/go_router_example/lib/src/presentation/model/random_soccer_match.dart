import 'package:go_router_example/src/domain/domain.dart';
import 'package:go_router_example/src/presentation/presentation.dart';

class RandomSoccerMatch extends SoccerMatch {
  RandomSoccerMatch({
    required super.awayTeam,
    required super.awayTeamScore,
    required super.homeTeam,
    required super.homeTeamScore,
  });

  factory RandomSoccerMatch.fromIndex(int index) => RandomSoccerMatch(
        awayTeam: Teams.spain[index],
        awayTeamScore: RandomValues.randomScore(),
        homeTeam: Teams.england[index],
        homeTeamScore: RandomValues.randomScore(),
      );
}
