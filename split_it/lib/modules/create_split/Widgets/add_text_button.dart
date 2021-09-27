import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class AddTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AddTextButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.add,
        color: AppTheme.colors.stepperNextButtonRegular,
      ),
      label: Text(
        label,
        style: AppTheme.textStyles.stepperNextButtonRegular,
      ),
    );
  }
}
