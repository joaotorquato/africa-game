import 'dart:async';
import 'dart:core';

abstract class GameBaseRepository {
  Future<void> startGame(List<String> words);
  Future<String> nextWord(bool guessed);
}
