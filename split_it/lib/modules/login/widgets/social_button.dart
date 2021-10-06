import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SocialButtonWidget extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  const SocialButtonWidget({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(
                BorderSide(color: AppTheme.colors.border))),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border:
                    Border(right: BorderSide(color: AppTheme.colors.border)),
              ),
              height: 56,
              width: 56,
              child: isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircularProgressIndicator(),
                    )
                  : Image.asset(imagePath),
            ),
            Expanded(child: Container()),
            Text(
              label,
              style: AppTheme.textStyles.button,
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
