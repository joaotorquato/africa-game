import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class GameRes extends GameEvent {
  @override
  List<Object?> get props => [];
}
