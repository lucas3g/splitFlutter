import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:split_it/modules/create_split/Widgets/person_tile.dart';
import 'package:split_it/modules/create_split/Widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/Widgets/step_title.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_controller.dart';

class StepTwoPage extends StatefulWidget {
  final CreateSplitController controller;
  StepTwoPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  late StepTwoController controller;

  @override
  void initState() {
    controller = StepTwoController(controller: widget.controller);
    controller.getFriends();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitle(title: 'Com quem', subtitle: '\nvocê quer dividir?'),
        StepInputText(
            onChange: (value) {
              controller.onChange(value);
            },
            hintext: 'Nome da Pessoa'),
        Observer(builder: (_) {
          if (controller.selectedFriends.isEmpty) {
            return Container();
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                ...controller.selectedFriends
                    .map((friend) => PersonTileWidget(
                          friend: friend,
                          isRemoved: true,
                          onPressed: () {
                            controller.removeFriend(friend);
                          },
                        ))
                    .toList(),
              ],
            );
          }
        }),
        SizedBox(
          height: 35,
        ),
        Observer(builder: (_) {
          if (controller.items.isEmpty) {
            return Text('Nenhum Amigo Encontrado :(');
          } else {
            return Column(
              children: controller.items
                  .map((friend) => PersonTileWidget(
                      friend: friend,
                      onPressed: () {
                        controller.addFriend(friend);
                      }))
                  .toList(),
            );
          }
        }),
      ],
    );
  }
}
