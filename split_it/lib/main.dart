import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:split_it/app_widget.dart';

import 'package:flutter/services.dart';

void main() {
  initializeDateFormatting('pt_br', null).then((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color,
    ));
    runApp(AppWidget());
  });
}
