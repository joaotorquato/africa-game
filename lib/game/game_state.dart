import 'package:equatable/equatable.dart';

///GameState
abstract class GameState extends Equatable {
  ///GameState
  const GameState();

  @override
  List<Object> get props => [];
}

///GameInitial
class GameInitial extends GameState {}
