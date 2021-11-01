import 'dart:core';

import 'game_base_repository.dart';
import 'game_mem_repository.dart';

/// A class that glues together our local file storage (not yet) and api client
class GameRepository implements GameBaseRepository {
  ///gameBaseRepository
  final GameBaseRepository localMemClient;

  ///gameRepository
  GameRepository() : localMemClient = GameMemRepository();

  @override
  Future<String> nextWord(bool guessed) {
    return localMemClient.nextWord(guessed);
  }

  @override
  Future<void> startGame(List<String> words) {
    return localMemClient.startGame(words);
  }
}
