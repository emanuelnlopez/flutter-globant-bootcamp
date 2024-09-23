import 'dart:math';

import 'package:flutter/material.dart';

abstract class RandomValues {
  static final _random = Random();

  static final _scores = [0, 1, 2, 3, 4];

  static String randomScore() =>
      _scores[_random.nextInt(_scores.length)].toString();

  static MaterialColor getTeamColor({required String code}) {
    // Ensure the string is 3 characters long
    assert(code.length == 3);

    // Calculate a seed using the string characters
    int seed = code.codeUnitAt(0) + code.codeUnitAt(1) + code.codeUnitAt(2);

    // Create a Random object using the seed
    Random random = Random(seed);

    // Select a random color from Colors.primaries
    return Colors.primaries[random.nextInt(Colors.primaries.length)];
  }
}
