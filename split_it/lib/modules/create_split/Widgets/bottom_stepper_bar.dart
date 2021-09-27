import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/Widgets/stepper_next_button.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final CreateSplitController controller;

  const BottomStepperBarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  void onTapNext() {
    if (controller.currentPage == 2) {
      controller.saveEvent();
    } else {
      controller.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 61,
        child: Observer(builder: (_) {
          return Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 1,
                color: controller.enableNavigateButton
                    ? AppTheme.colors.divider
                    : AppTheme.colors.dividerDisabled,
              ),
              Row(
                children: [
                  StepperNextButtonWidget(
                    label: 'Cancelar',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    enabled: controller.enableNavigateButton,
                  ),
                  Container(
                    width: 1,
                    height: 60,
                    color: controller.enableNavigateButton
                        ? AppTheme.colors.divider
                        : AppTheme.colors.dividerDisabled,
                  ),
                  StepperNextButtonWidget(
                    label:
                        controller.currentPage == 2 ? 'Finalizar' : 'Continuar',
                    onTap: onTapNext,
                    colored: controller.currentPage == 2,
                    enabled: controller.enableNavigateButton,
                  ),
                ],
              ),
            ],
          );
        }));
  }
}
