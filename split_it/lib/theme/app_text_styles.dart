import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppTheme.colors.button);

  @override
  TextStyle get title => GoogleFonts.montserrat(
      fontSize: 40, color: AppTheme.colors.title, fontWeight: FontWeight.w700);
}
