import 'dart:async';

import 'package:go_router_example/src/domain/domain.dart';
import 'package:go_router_example/src/presentation/presentation.dart';

abstract class Disposable {
  void dispose();
}

class MatchController implements Disposable {
  final _matches = {
    for (var index = 0; index < 20; index++)
      index: RandomSoccerMatch.fromIndex(index)
  };

  final _matchStreamController = StreamController<SoccerMatch>.broadcast();

  final _matchesStreamController =
      StreamController<List<SoccerMatch>>.broadcast();

  Stream<SoccerMatch> get matchStream => _matchStreamController.stream;

  Stream<List<SoccerMatch>> get matchesStream =>
      _matchesStreamController.stream;

  void getMatches() => _matchesStreamController.add(_matches.values.toList());

  void getMatch(int id) {
    if (_matches.containsKey(id)) {
      _matchStreamController.add(_matches[id]!);
    }
  }

  @override
  void dispose() {
    _matchStreamController.close();
    _matchesStreamController.close();
  }
}
