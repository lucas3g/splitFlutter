import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/app_bar/bottom_app_bar/bottom_app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/app_bar_sliver/app_bar_sliver_widget.dart';
import 'package:split_it/modules/home/widgets/event_tile_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      body: CustomScrollView(slivers: [
        AppBarSliverWidget(
          user: user,
          onTapAddButton: () {
            Navigator.pushNamed(context, '/create_split');
          },
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Observer(builder: (context) {
              if (controller.state is HomeStateLoading) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: List.generate(
                      10,
                      (index) => EventTileWidget(
                        model: EventModel(),
                        isLoading: true,
                      ),
                    ),
                  ),
                );
              } else if (controller.state is HomeStateSuccess) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      children: (controller.state as HomeStateSuccess)
                          .events
                          .map((e) => EventTileWidget(
                                model: e,
                                isLoading: false,
                              ))
                          .toList()),
                );
              } else if (controller.state is HomeStateFailure) {
                return Text((controller.state as HomeStateFailure).message);
              } else {
                return Container();
              }
            });
          }, childCount: 1),
        ),
      ]
          // child: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: AnimatedCard(
          //     direction: AnimatedCardDirection.right,
          //     child: SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           Observer(builder: (context) {
          //             if (controller.state is HomeStateLoading) {
          //               return Column(
          //                 children: List.generate(
          //                   10,
          //                   (index) => EventTileWidget(
          //                     model: EventModel(),
          //                     isLoading: true,
          //                   ),
          //                 ),
          //               );
          //             } else if (controller.state is HomeStateSuccess) {
          //               return Column(
          //                   children: (controller.state as HomeStateSuccess)
          //                       .events
          //                       .map((e) => EventTileWidget(
          //                             model: e,
          //                             isLoading: false,
          //                           ))
          //                       .toList());
          //             } else if (controller.state is HomeStateFailure) {
          //               return Text(
          //                   (controller.state as HomeStateFailure).message);
          //             } else {
          //               return Container();
          //             }
          //           })
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
