import 'package:equatable/equatable.dart';

///TeamState
abstract class TeamState extends Equatable {
  ///TeamState
  const TeamState();

  @override
  List<Object> get props => [];
}

///TeamLoadInProgress
class TeamRegisterInProgress extends TeamState {}

///TeamLoadSuccess
class TeamRegisterSuccess extends TeamState {}

///TeamLoadFailure
class TeamRegisterFailure extends TeamState {}

///TeamInitial
class TeamRegisterInitial extends TeamState {}
