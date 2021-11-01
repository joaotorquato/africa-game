import 'package:flutter_bloc/flutter_bloc.dart';

import 'team_event.dart';
import 'team_state.dart';
import 'repository/team_repository.dart';

///TeamBloc
class TeamBloc extends Bloc<TeamEvent, TeamState> {
  ///TeamBloc
  TeamBloc(this.repository) : super(TeamRegisterInitial());

  final TeamRepository repository;

  @override
  Stream<TeamState> mapEventToState(TeamEvent event) async* {
    if (event is TeamRegister) {
      yield* _mapTeamRegisterToState(event.name);
    }
  }

  Stream<TeamState> _mapTeamRegisterToState(String name) async* {
    try {
      yield TeamRegisterInProgress();
      await repository.saveTeam(name);
      yield TeamRegisterSuccess();
    } on Exception catch (_) {
      yield TeamRegisterFailure();
    }
  }
}
