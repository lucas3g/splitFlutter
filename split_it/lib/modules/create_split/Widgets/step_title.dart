import 'package:flutter/material.dart';

import 'package:split_it/theme/app_theme.dart';

class StepTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const StepTitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text.rich(
          TextSpan(
            text: title,
            style: AppTheme.textStyles.stepperTitle,
            children: [
              TextSpan(
                  text: subtitle, style: AppTheme.textStyles.stepperSubTitle)
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
