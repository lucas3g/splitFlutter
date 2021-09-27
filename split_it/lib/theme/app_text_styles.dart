import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get appBar;
  TextStyle get infoCard;
  TextStyle get infoCardMoneyG;
  TextStyle get infoCardMoneyR;
  TextStyle get eventTileTitle;
  TextStyle get eventTileSubTitle;
  TextStyle get eventTileMoney;
  TextStyle get eventTilePeople;
  TextStyle get stepperIndicatorPrimary;
  TextStyle get stepperIndicatorSecondary;
  TextStyle get stepperNextButton;
  TextStyle get stepperNextButtonRegular;
  TextStyle get stepperNextButtonDisabled;
  TextStyle get stepperTitle;
  TextStyle get stepperSubTitle;
  TextStyle get hintTextField;
  TextStyle get textField;
  TextStyle get personTileTitle;
  TextStyle get personTileTitleSelected;
  TextStyle get appBarEventDetails;
  TextStyle get eventDetailTitle;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppTheme.colors.button);

  @override
  TextStyle get title => GoogleFonts.montserrat(
      fontSize: 40, color: AppTheme.colors.title, fontWeight: FontWeight.w700);

  @override
  TextStyle get appBar => GoogleFonts.montserrat(
      fontSize: 24,
      color: AppTheme.colors.titleappBar,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get infoCard => GoogleFonts.inter(
      fontSize: 14,
      color: AppTheme.colors.infoCard,
      fontWeight: FontWeight.w600);

  @override
  TextStyle get infoCardMoneyG => GoogleFonts.inter(
      fontSize: 20,
      color: AppTheme.colors.infoCardMoneyG,
      fontWeight: FontWeight.w600);

  @override
  TextStyle get infoCardMoneyR => GoogleFonts.inter(
      fontSize: 20,
      color: AppTheme.colors.infoCardMoneyR,
      fontWeight: FontWeight.w600);

  @override
  TextStyle get eventTileMoney => GoogleFonts.inter(
      fontSize: 14,
      color: AppTheme.colors.eventTileMoney,
      fontWeight: FontWeight.w400);

  @override
  TextStyle get eventTilePeople => GoogleFonts.inter(
      fontSize: 12,
      color: AppTheme.colors.eventTilePeople,
      fontWeight: FontWeight.w400);

  @override
  TextStyle get eventTileSubTitle => GoogleFonts.inter(
      fontSize: 12,
      color: AppTheme.colors.eventTileSubTitle,
      fontWeight: FontWeight.w400);

  @override
  TextStyle get eventTileTitle => GoogleFonts.inter(
      fontSize: 16,
      color: AppTheme.colors.eventTileTitle,
      fontWeight: FontWeight.w600);

  @override
  TextStyle get stepperIndicatorPrimary => GoogleFonts.roboto(
      fontSize: 14,
      color: AppTheme.colors.stepperIndicatorPrimary,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get stepperIndicatorSecondary => GoogleFonts.roboto(
      fontSize: 14,
      color: AppTheme.colors.stepperIndicatorSecondary,
      fontWeight: FontWeight.w400);

  @override
  TextStyle get stepperNextButton => GoogleFonts.inter(
      fontSize: 14,
      color: AppTheme.colors.stepperNextButton,
      fontWeight: FontWeight.w500);

  @override
  TextStyle get stepperSubTitle => GoogleFonts.inter(
      fontSize: 24,
      color: AppTheme.colors.stepperSubTitle,
      fontWeight: FontWeight.w400);

  @override
  TextStyle get stepperTitle => GoogleFonts.inter(
      fontSize: 24,
      color: AppTheme.colors.stepperTitle,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get hintTextField => GoogleFonts.inter(
      fontSize: 16,
      color: AppTheme.colors.hintTextField,
      fontWeight: FontWeight.w400);

  @override
  TextStyle get textField => GoogleFonts.inter(
      fontSize: 16,
      color: AppTheme.colors.textField,
      fontWeight: FontWeight.w500);

  @override
  TextStyle get stepperNextButtonDisabled => GoogleFonts.inter(
      fontSize: 14,
      color: AppTheme.colors.stepperNextButtonDisabled,
      fontWeight: FontWeight.w500);

  @override
  TextStyle get personTileTitle => GoogleFonts.inter(
      fontSize: 16,
      color: AppTheme.colors.stepperNextButton,
      fontWeight: FontWeight.w400);

  @override
  TextStyle get personTileTitleSelected => GoogleFonts.inter(
      fontSize: 16,
      color: AppTheme.colors.personTileTitleSelected,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get stepperNextButtonRegular => GoogleFonts.inter(
      fontSize: 16,
      color: AppTheme.colors.stepperNextButtonRegular,
      fontWeight: FontWeight.w500);

  @override
  TextStyle get appBarEventDetails => GoogleFonts.montserrat(
      fontSize: 22,
      color: AppTheme.colors.eventTileTitle,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get eventDetailTitle => GoogleFonts.roboto(
        fontSize: 14,
        color: AppTheme.colors.eventTileTitle,
        fontWeight: FontWeight.w700,
      );
}
