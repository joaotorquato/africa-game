import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_event.dart';
import 'game_state.dart';
import 'repository/game_repository.dart';

///GameBloc
class GameBloc extends Bloc<GameEvent, GameState> {
  ///GameBloc
  GameBloc(this.repository) : super(GameInitial());

  final GameRepository repository;

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {}
}
