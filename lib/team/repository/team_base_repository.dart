import 'dart:async';
import 'dart:core';

abstract class TeamBaseRepository {
  Future<bool> saveTeam(String team);
}
