import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/Widgets/person_tile.dart';
import 'package:split_it/modules/create_split/Widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/Widgets/step_title.dart';

class StepTwoPage extends StatefulWidget {
  StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(title: 'Com quem', subtitle: '\nvocê quer dividir?'),
        StepInputText(onChange: (value) {}, hintext: 'Nome da Pessoa'),
        SizedBox(
          height: 35,
        ),
        PersonTileWidget(name: 'Lucas Silva'),
        PersonTileWidget(name: 'Tainá Silva'),
        PersonTileWidget(name: 'Mauricio Sareto'),
      ],
    );
  }
}
