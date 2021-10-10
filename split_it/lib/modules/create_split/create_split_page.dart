import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/create_split/Widgets/bottom_stepper_bar.dart';
import 'package:split_it/modules/create_split/Widgets/create_split_appbar.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/create_split_status.dart';
import 'package:split_it/modules/create_split/steps/one/step_one_page.dart';
import 'package:split_it/modules/create_split/steps/three/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_page.dart';
import 'package:split_it/modules/create_split_success/create_spli_success_page.dart';

import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController(repository: FirebaseRepository());

  late List<Widget> pages;

  late ReactionDisposer _disposer;

  @override
  void initState() {
    pages = [
      StepOnePage(controller: controller),
      StepTwoPage(
        controller: controller,
      ),
      StepThreePage(
        controller: controller,
      ),
    ];
    _disposer = autorun((_) {
      if (controller.status == CreateSplitStatus.success) {
        BotToast.closeAllLoading();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CreateSplitSuccessPage(controller: controller),
          ),
        );
      } else if (controller.status == CreateSplitStatus.error) {
        BotToast.closeAllLoading();
        BotToast.showText(text: 'Não Foi Possivel Criar esse Evento!');
      } else if (controller.status == CreateSplitStatus.loading) {
        BotToast.showLoading(
          allowClick: false,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  bool backNavigate() {
    if (controller.currentPage == 0) {
      return true;
    } else {
      controller.backPage();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => backNavigate(),
      child: Scaffold(
        backgroundColor: AppTheme.colors.backgroundPrimary,
        appBar: CreateSplitAppBarWidget(
          onTapBack: () {
            if (backNavigate()) Navigator.pop(context);
          },
          controller: controller,
          sizePages: pages.length,
        ),
        body: Observer(
          builder: (_) {
            final index = controller.currentPage;
            return pages[index];
          },
        ),
        bottomSheet: Observer(builder: (_) {
          return BottomStepperBarWidget(
            controller: controller,
          );
        }),
      ),
    );
  }
}
