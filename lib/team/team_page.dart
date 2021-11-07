import 'package:africagame/common/errors.dart';
import 'package:africagame/common/widgets/loading_widget.dart';
import 'package:africagame/team/team_bloc.dart';
import 'package:africagame/team/team_event.dart';
import 'package:africagame/team/team_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TeamPage extends StatefulWidget {
  static String routeName = 'teamPage';

  const TeamPage({Key? key}) : super(key: key);

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('ÁFRICA')),
      ),
      body: Center(child: _buildMainWidget()),
    );
  }

  Widget _buildMainWidget() {
    return BlocConsumer<TeamBloc, TeamState>(
      builder: (context, state) {
        if (state is TeamRegisterInProgress) {
          return _buildLoadingWidget();
        } else {
          return _buildFormWidget();
        }
      },
      listener: (context, state) {
        if (state is TeamRegisterSuccess) {
          Errors.showSuccess('Time registrado com sucesso!');
        } else if (state is TeamRegisterFailure) {
          Errors.showError('Falha ao registrar time!');
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return LoadingWidget();
  }

  Widget _buildFormWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: 250.0,
          child: const Center(child: Text('Cadastro de Duplas')),
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: 'Nome da dupla', hintText: 'Digite o nome da dupla'),
          textInputAction: TextInputAction.next,
          controller: _name,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor digite a senha';
            }
            return null;
          },
        ),
        const Spacer(),
        TextButton(
            onPressed: _registerTeam, child: const Text('Cadastrar Dupla')),
        TextButton(onPressed: _done, child: const Text('Finalizar'))
      ],
    );
  }

  void _registerTeam() {
    Provider.of<TeamBloc>(context, listen: false).add(TeamRegister(_name.text));
  }

  void _done() {
    Navigator.pop(context);
  }
}
