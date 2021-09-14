import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

enum IconDollarType { send, receive }

class IconDollarWidget extends StatelessWidget {
  final IconDollarType type;
  const IconDollarWidget({Key? key, required this.type}) : super(key: key);

  String get pathImage =>
      'assets/images/dollar-${type == IconDollarType.receive ? 'receive' : 'send'}.png';
  Color get backgroundColor => type == IconDollarType.receive
      ? AppTheme.colors.iconBackGroundG
      : AppTheme.colors.iconBackGroundR;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 48,
      height: 48,
      child: Center(
        child: Image.asset(
          pathImage,
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}
