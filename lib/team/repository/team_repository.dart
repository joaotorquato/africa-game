import 'dart:core';

import 'package:africagame/team/repository/team_db_repository.dart';

import 'team_base_repository.dart';

/// A class that glues together our local database repository
class TeamRepository implements TeamBaseRepository {
  ///teamBaseRepository
  final TeamBaseRepository dbClient;

  ///teamRepository
  TeamRepository() : dbClient = TeamDatabaseRepository();

  @override
  Future<bool> saveTeam(String team) {
    return dbClient.saveTeam(team);
  }
}
