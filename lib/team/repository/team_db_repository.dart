import 'dart:async';

import 'package:africagame/storage/database/database_helper.dart';
import 'package:hive/hive.dart';

import 'team_base_repository.dart';

/// Do the communication with local memory
class TeamDatabaseRepository implements TeamBaseRepository {
  TeamDatabaseRepository() : super();

  @override
  Future<bool> saveTeam(String team) async {
    var helper = DatabaseHelper.instance;
    var employeeBox = await Hive.openBox<String>(
      helper.tableTeams,
    );
    await employeeBox.put(helper.tableTeams, team);
    return true;
  }
}
