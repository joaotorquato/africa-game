import 'package:africagame/game/game_page.dart';
import 'package:africagame/team/repository/team_repository.dart';
import 'package:africagame/team/team_bloc.dart';
import 'package:africagame/team/team_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'game/game_bloc.dart';
import 'game/repository/game_repository.dart';
import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Africa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        GamePage.routeName: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<GameBloc>(
                  create: (context) => GameBloc(GameRepository()),
                ),
              ],
              child: const GamePage(),
            ),
        TeamPage.routeName: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<TeamBloc>(
                  create: (context) => TeamBloc(TeamRepository()),
                ),
              ],
              child: const TeamPage(),
            ),
      },
    );
  }
}
