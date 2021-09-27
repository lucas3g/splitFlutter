import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/event_details/event_details_controller.dart';
import 'package:split_it/modules/event_details/event_details_status.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/shared/utils/formatters.dart';
import 'package:split_it/theme/app_theme.dart';

class ConfirmDeleteWidget extends StatefulWidget {
  final String id;
  final EventModel event;
  const ConfirmDeleteWidget({Key? key, required this.id, required this.event})
      : super(key: key);

  @override
  State<ConfirmDeleteWidget> createState() => _ConfirmDeleteWidgetState();
}

class _ConfirmDeleteWidgetState extends State<ConfirmDeleteWidget> {
  final controller = EventDetailsController(repository: FirebaseRepository());
  late ReactionDisposer _disposer;
  late EventModel event;

  @override
  void initState() {
    event = widget.event;
    _disposer = autorun((_) {
      if (controller.status.runtimeType == EventDetailsStatusSuccess) {
        Navigator.pop(context);
        BotToast.closeAllLoading();
        _showSucesss();
      } else if (controller.status.runtimeType == EventDetailsStatusFailure) {
        BotToast.closeAllLoading();
        BotToast.showText(text: 'Não Foi Possivel Excluir esse Evento!');
      } else if (controller.status.runtimeType == EventDetailsStatusLoading) {
        BotToast.showLoading(
          allowClick: false,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  void _showSucesss() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                Text(
                  "Evento Excluído!",
                  style: AppTheme.textStyles.eventTileSubTitle,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.green.shade500,
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      title: Container(
        child: Lottie.asset('assets/images/delete.json', height: 90),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Atenção",
              style: AppTheme.textStyles.stepperTitle,
            ),
          ),
          Center(
            child: Text(
              'Excluir realmente esse Evento?',
              style: AppTheme.textStyles.eventTileSubTitle
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Evento: ',
                      style: AppTheme.textStyles.eventTileSubTitle
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: '${event.name}\n',
                      style: AppTheme.textStyles.eventTileSubTitle
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    TextSpan(text: '   '),
                    TextSpan(
                      text: 'Total: ',
                      style: AppTheme.textStyles.eventTileSubTitle
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: '${event.value.reais()}',
                      style: AppTheme.textStyles.eventTileSubTitle
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Divider(
            color: AppTheme.colors.divider,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.red.shade800,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: Text("Excluir",
                        style: AppTheme.textStyles.eventDetailTitle
                            .copyWith(color: Colors.white)),
                    onPressed: () {
                      controller.delete(widget.id);
                    },
                  ),
                ),
                Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: Text("Não",
                        style: AppTheme.textStyles.eventDetailTitle
                            .copyWith(color: Colors.white)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      buttonPadding: EdgeInsets.zero,
    );
  }
}
