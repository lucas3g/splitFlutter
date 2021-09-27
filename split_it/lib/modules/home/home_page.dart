import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:split_it/modules/event_details/event_details_page.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository_firebase.dart';
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
  final controller = HomeController(repository: HomeRepositoryFirebase());

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
          onTapAddButton: () async {
            await Navigator.pushNamed(context, '/create_split');
            controller.getEvents();
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
                        //controller: controller,
                        model: EventModel(),
                        isLoading: true,
                      ),
                    ),
                  ),
                );
              } else if (controller.state is HomeStateSuccess) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: (controller.state as HomeStateSuccess)
                          .events
                          .isNotEmpty
                      ? Column(
                          children: (controller.state as HomeStateSuccess)
                              .events
                              .map(
                                (e) => EventTileWidget(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EventDetailsPage(
                                          event: e,
                                          userName: user.name!,
                                        ),
                                      ),
                                    );
                                    controller.getEvents();
                                  },
                                  model: e,
                                  isLoading: false,
                                ),
                              )
                              .toList())
                      : Column(
                          children: [
                            Lottie.asset('assets/images/cry.json', height: 120),
                            Text('Nenhum Evento Encontrado!',
                                style: AppTheme.textStyles.eventTileTitle),
                          ],
                        ),
                );
              } else if (controller.state is HomeStateFailure) {
                return Text((controller.state as HomeStateFailure).message);
              } else {
                return Container();
              }
            });
          }, childCount: 1),
        ),
      ]),
    );
  }
}
