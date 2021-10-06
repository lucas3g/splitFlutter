import 'package:flutter/material.dart';
import 'package:split_it/modules/event_details/event_details_controller.dart';
import 'package:split_it/modules/event_details/widgets/dialogs/confirm_delete_widget.dart';
import 'package:split_it/modules/event_details/widgets/item_tile_widget.dart';
import 'package:split_it/modules/event_details/widgets/person_tile_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/shared/utils/formatters.dart';
import 'package:split_it/theme/app_theme.dart';

// class ScreenArguments {
//   final EventModel event;
//   final String userName;

//   ScreenArguments({required this.event, required this.userName});
// }

class EventDetailsPage extends StatefulWidget {
  final EventModel event;
  final String userName;

  EventDetailsPage({Key? key, required this.event, required this.userName})
      : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final controller = EventDetailsController(repository: FirebaseRepository());

  late EventModel event;

  @override
  void initState() {
    event = widget.event;
    super.initState();
  }

  void _showDialog({required String id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDeleteWidget(
          id: id,
          event: event,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    //event = args.event;
    //userName = args.userName;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          event.name,
          style: AppTheme.textStyles.appBarEventDetails,
        ),
        leading: BackButton(
          color: Color(0xFF666666),
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(10),
            hoverColor: Colors.red,
            onTap: () {
              _showDialog(id: event.id);
            },
            child: Image.asset('assets/images/trash.png'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF455250).withOpacity(0.08),
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'INTEGRANTES',
                        style: AppTheme.textStyles.eventDetailTitle,
                      ),
                      ...event.friends
                          .map(
                            (friend) => PersonTileWidget(
                              key: UniqueKey(),
                              userName: widget.userName,
                              event: event,
                              friend: friend,
                              value: event.valueSplit,
                              onChanged: (newEvent) {
                                event = newEvent;
                                setState(() {});
                              },
                            ),
                          )
                          .toList(),
                    ]),
              ),
            ),
            Container(
              color: Color(0xFF455250).withOpacity(0.08),
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ÍTENS',
                        style: AppTheme.textStyles.eventDetailTitle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppTheme.colors.divider,
                        indent: 0,
                        height: 1,
                      ),
                      ...event.items
                          .map(
                            (e) => ItemTileWidget(
                              name: e.name,
                              value: e.value,
                            ),
                          )
                          .toList(),
                    ]),
              ),
            ),
            Container(
              color: Color(0xFF455250).withOpacity(0.08),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ItemTileWidget(
                  name: 'Total',
                  value: event.value,
                  hasDivider: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (event.remainingValue != 0.0)
                    Text(
                      'Faltam ${event.remainingValue.reais()}',
                      style: AppTheme.textStyles.eventTileTitle
                          .copyWith(color: Color(0xFFE83F5B)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
