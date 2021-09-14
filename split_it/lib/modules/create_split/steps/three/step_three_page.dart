import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/Widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/Widgets/step_title.dart';

class StepThreePage extends StatefulWidget {
  StepThreePage({Key? key}) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(
            title: 'Qual ou mais', subtitle: '\nítens você quer dividir?'),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('1'),
            ),
            Expanded(
              flex: 3,
              child: StepInputText(
                padding: EdgeInsets.zero,
                onChange: (value) {},
                hintext: 'Ex: Picanha',
                align: TextAlign.start,
              ),
            ),
            Expanded(
              child: StepInputText(
                padding: EdgeInsets.zero,
                onChange: (value) {},
                hintext: 'R\$ 0,00',
                align: TextAlign.start,
                type: TextInputType.number,
              ),
            ),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.delete_forever_outlined)),
          ],
        ),
      ],
    );
  }
}
