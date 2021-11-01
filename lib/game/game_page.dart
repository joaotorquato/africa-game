import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  static String routeName = 'gamePage';

  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Africa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: _startGame, child: const Text('Iniciar Jogo'))
          ],
        ),
      ),
    );
  }

  void _startGame() {}
}
