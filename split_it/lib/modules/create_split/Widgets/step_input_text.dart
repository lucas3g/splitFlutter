import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputText extends StatelessWidget {
  final void Function(String value) onChange;
  final String hintext;
  final TextAlign align;
  final String? initialValue;
  final EdgeInsets? padding;
  final TextInputType type;
  final TextEditingController? controller;
  const StepInputText(
      {Key? key,
      required this.onChange,
      required this.hintext,
      this.align = TextAlign.center,
      this.padding,
      this.type = TextInputType.text,
      this.controller,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 64),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        keyboardType: type,
        onChanged: onChange,
        cursorColor: AppTheme.colors.backgroundSecondary,
        textAlign: align,
        style: AppTheme.textStyles.textField,
        decoration: InputDecoration(
          hintText: hintext,
          hintStyle: AppTheme.textStyles.hintTextField,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.colors.backgroundSecondary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.colors.backgroundSecondary),
          ),
        ),
      ),
    );
  }
}
