import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:split_it/theme/app_theme.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        child: Lottie.asset('assets/images/success.json', height: 90),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sucesso",
            style: AppTheme.textStyles.appBarEventDetails,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Evento Excluído!",
            style: AppTheme.textStyles.eventTileSubTitle,
          ),
          Divider(),
          Container(
            height: 35,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              child: Text("Obrigado :)",
                  style: AppTheme.textStyles.eventDetailTitle
                      .copyWith(color: Colors.white)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      buttonPadding: EdgeInsets.zero,
    );
  }
}
