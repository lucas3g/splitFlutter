import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepperNextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool enabled;
  final bool colored;

  const StepperNextButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.enabled = false,
    this.colored = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: Container(
          height: 60,
          child: Center(
            child: Text(label,
                style: enabled
                    ? colored
                        ? AppTheme.textStyles.stepperNextButton.copyWith(
                            color: AppTheme.colors.backgroundSecondary)
                        : AppTheme.textStyles.stepperNextButton
                    : AppTheme.textStyles.stepperNextButtonDisabled),
          ),
        ),
      ),
    );
  }
}
