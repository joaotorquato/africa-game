import 'dart:async';
import 'dart:math';

import 'game_base_repository.dart';

/// Do the communication with local memory
class GameMemRepository implements GameBaseRepository {
  GameMemRepository() : super();

  final List<String> _gameWords = [];

  @override
  Future<String> nextWord(bool guessed) async {
    var rng = Random();
    return _gameWords[rng.nextInt(_gameWords.length - 1)];
  }

  @override
  Future<void> startGame(List<String> words) async {
    _gameWords.clear();
    _gameWords.addAll(words);
  }
}
