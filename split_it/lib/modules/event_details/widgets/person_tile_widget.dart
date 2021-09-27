import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/event_details/widgets/check_rounded_button/check_rounded_controller.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/shared/utils/formatters.dart';

class PersonTileWidget extends StatefulWidget {
  final EventModel event;
  final FriendModel friend;
  final double value;
  final String userName;
  final Function(EventModel newEvent) onChanged;
  const PersonTileWidget(
      {Key? key,
      required this.friend,
      required this.value,
      required this.event,
      required this.onChanged,
      required this.userName})
      : super(key: key);

  @override
  State<PersonTileWidget> createState() => _PersonTileWidgetState();
}

class _PersonTileWidgetState extends State<PersonTileWidget> {
  late CheckRoundedController controller;

  @override
  void initState() {
    controller = CheckRoundedController(
        repository: FirebaseRepository(), event: widget.event);
    if (widget.friend.isPaid) {
      controller.status = (CheckRoundedStatus.success);
    }
    autorun((_) {
      if (controller.status == CheckRoundedStatus.success ||
          controller.status == CheckRoundedStatus.empty) {
        widget.onChanged(controller.event);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: widget.friend.photoURL.isNotEmpty
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(widget.friend.photoURL),
                      fit: BoxFit.cover)
                  : null),
          child: widget.friend.photoURL.isEmpty
              ? Text(widget.friend.name[0])
              : Container(),
        ),
        title: Text(
          widget.userName == widget.friend.name ? 'Você' : widget.friend.name,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF666666),
          ),
        ),
        subtitle: Text(
          widget.value.reais(),
          style: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: controller.status == CheckRoundedStatus.success
                ? Color(0xFF40B28C)
                : Color(0xFFE83F5B),
          ),
        ),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5,
            ),
            color: controller.status == CheckRoundedStatus.success
                ? Color(0xFF40B28C).withOpacity(0.16)
                : Color(0xFF455250).withOpacity(0.16),
          ),
          child: Checkbox(
            value: controller.status == CheckRoundedStatus.success,
            onChanged: (_) {
              controller.update(widget.friend);
              final newPaid = widget.event.paid +
                  (widget.friend.isPaid
                      ? -widget.event.valueSplit
                      : widget.event.valueSplit);
              controller.event.copyWith(paid: newPaid);
              setState(() {});
            },
            activeColor: controller.status == CheckRoundedStatus.success
                ? Color(0xFF40B28C)
                : Color(0xFF455250).withOpacity(0.16),
          ),
        ),
      );
    });
  }
}
