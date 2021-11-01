import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../storage_repository.dart';

class DatabaseHelper with StorageRepository {
  // database employee
  final String tableTeams = 'teams';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  Future<void> get database async {
    _initDatabase();
  }

  Future<List<int>> getKey() async {
    var key = await getAppBaseKey();
    return key!.codeUnits;
  }

  // open the database
  void _initDatabase() async {
    await Hive.initFlutter();
    var appBaseKey = Hive.generateSecureKey();
    var existingBaseKey = await getAppBaseKey();
    if (existingBaseKey == null || existingBaseKey.isEmpty) {
      await setAppBaseKey(String.fromCharCodes(appBaseKey));
    }
  }

  void cleanDatabase() async {
    var teamBox = await Hive.openBox<String>(
      tableTeams,
    );
    await teamBox.deleteAll(teamBox.keys);
  }
}
