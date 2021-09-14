import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/Widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/Widgets/step_title.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';

class StepOnePage extends StatefulWidget {
  final CreateSplitController controller;
  StepOnePage({Key? key, required this.controller}) : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(title: 'Qual o nome', subtitle: '\ndo evento?'),
        StepInputText(
            onChange: (value) {
              widget.controller.setEventName(value);
            },
            hintext: 'Ex: Churrasco')
      ],
    );
  }
}
