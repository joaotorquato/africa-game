import 'package:equatable/equatable.dart';

abstract class TeamEvent extends Equatable {
  const TeamEvent();
}

class TeamRegister extends TeamEvent {
  final String name;

  const TeamRegister(this.name);

  @override
  List<Object?> get props => [];
}
