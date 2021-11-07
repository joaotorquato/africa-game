import 'package:africagame/team/team_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'homePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('ÁFRICA')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              width: 250.0,
              child: FloatingActionButton.extended(
                onPressed: _registerTeam,
                label: const Text('Cadastrar Duplas'),
                icon: const Icon(Icons.supervised_user_circle_rounded),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              width: 250.0,
              child: FloatingActionButton.extended(
                onPressed: _registerWords,
                label: const Text('Cadastrar Palavras'),
                icon: const Icon(Icons.assignment_outlined),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              width: 250.0,
              child: FloatingActionButton.extended(
                onPressed: _startGame,
                label: const Text('Iniciar Jogo'),
                icon: const Icon(Icons.play_arrow),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerTeam() {
    Navigator.pushNamed(context, TeamPage.routeName);
  }

  void _registerWords() {
    Navigator.pushNamed(context, TeamPage.routeName);
  }

  void _startGame() {
    Navigator.pushNamed(context, TeamPage.routeName);
  }
}
