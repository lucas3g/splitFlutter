import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/Widgets/bottom_stepper_bar.dart';
import 'package:split_it/modules/create_split/Widgets/create_split_appbar.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/one/step_one_page.dart';
import 'package:split_it/modules/create_split/steps/three/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_page.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(
        controller: controller,
      ),
      StepTwoPage(),
      StepThreePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.colors.backgroundPrimary,
        appBar: CreateSplitAppBarWidget(
          onTapBack: controller.backPage,
          controller: controller,
          sizePages: pages.length,
        ),
        body: Observer(
          builder: (_) {
            final index = controller.currentPage;
            return pages[index];
          },
        ),
        bottomNavigationBar: Observer(builder: (_) {
          return BottomStepperBarWidget(
            onTapCancel: () {},
            onTapNext: controller.nextPage,
            controller: controller,
          );
        }));
  }
}
