import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundSecondary;
  Color get backgroundPrimary;
  Color get title;
  Color get button;
  Color get border;
  Color get titleappBar;
  Color get iconBackGroundAppBar;
  Color get iconAppBar;
  Color get infoCard;
  Color get iconBackGroundG;
  Color get iconBackGroundR;
  Color get infoCardMoneyG;
  Color get infoCardMoneyR;
  Color get eventTileTitle;
  Color get eventTileSubTitle;
  Color get eventTileMoney;
  Color get eventTilePeople;
  Color get divider;
  Color get stepperIndicatorPrimary;
  Color get stepperIndicatorSecondary;
  Color get backButton;
  Color get stepperNextButton;
  Color get stepperNextButtonDisabled;
  Color get stepperTitle;
  Color get stepperSubTitle;
  Color get hintTextField;
  Color get textField;
}

class AppColorDefault implements AppColors {
  @override
  Color get backgroundSecondary => Color(0xFF40B38C);

  @override
  Color get title => Color(0xFF40B28C);

  @override
  Color get button => Color(0xFF666666);

  @override
  Color get backgroundPrimary => Color(0xFFFFFFFF);

  @override
  Color get border => Color(0xFFC2C2C2);

  @override
  Color get titleappBar => Color(0xFFFFFFFF);

  @override
  Color get iconBackGroundAppBar => Color(0xFFE9F8F2);

  @override
  Color get iconAppBar => Color(0xFF45CC93);

  @override
  Color get infoCard => Color(0xFF666666);

  @override
  Color get iconBackGroundG => Color(0xFFE9F8F2);

  @override
  Color get iconBackGroundR => Color(0xFFFDECEF);

  @override
  Color get infoCardMoneyG => Color(0xFF40B28C);

  @override
  Color get infoCardMoneyR => Color(0xFFE83F5B);

  @override
  Color get eventTileTitle => Color(0xFF455250);

  @override
  Color get eventTileSubTitle => Color(0xFF666666);

  @override
  Color get eventTileMoney => Color(0xFF666666);

  @override
  Color get eventTilePeople => Color(0xFFA4B2AE);

  @override
  Color get divider => Color(0xFF666666);

  @override
  Color get stepperIndicatorPrimary => Color(0xFF3CAB82);

  @override
  Color get stepperIndicatorSecondary => Color(0xFF666666);

  @override
  Color get backButton => Color(0xFF666666);

  @override
  Color get stepperNextButton => Color(0xFF455250);

  @override
  Color get stepperSubTitle => Color(0xFF455250);

  @override
  Color get stepperTitle => Color(0xFF455250);

  @override
  Color get hintTextField => Color(0xFF666666);

  @override
  Color get textField => Color(0xFF455250);

  @override
  Color get stepperNextButtonDisabled => Color(0xFF666666);
}
