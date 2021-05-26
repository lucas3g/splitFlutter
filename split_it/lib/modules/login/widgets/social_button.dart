import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SocialButtonWidget extends StatelessWidget {
  final String imagePath;
  final String label;

  const SocialButtonWidget({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.fromBorderSide(BorderSide(color: AppTheme.colors.border))),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(right: BorderSide(color: AppTheme.colors.border)),
            ),
            height: 56,
            width: 56,
            child: Image.asset(imagePath),
          ),
          Expanded(child: Container()),
          Text(
            label,
            style: AppTheme.textStyles.button,
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
