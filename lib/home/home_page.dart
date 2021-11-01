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
        title: const Text('Africa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: _registerTeam, child: const Text('Cadastrar Duplas'))
          ],
        ),
      ),
    );
  }

  void _registerTeam() {
    Navigator.pushNamed(context, TeamPage.routeName);
  }
}
