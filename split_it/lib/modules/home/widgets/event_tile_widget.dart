import 'package:flutter/material.dart';

import 'package:split_it/modules/home/widgets/icon_dollar_widget.dart';
import 'package:split_it/modules/home/widgets/loading_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/utils/formatters.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel model;
  final VoidCallback? onTap;
  final bool isLoading;

  const EventTileWidget({
    Key? key,
    required this.model,
    this.isLoading = false,
    this.onTap,
  }) : super(key: key);

  IconDollarType get type =>
      model.value >= 0 ? IconDollarType.receive : IconDollarType.send;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        children: [
          LoadingWidget(size: Size(48, 48)),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: LoadingWidget(size: Size(81, 19)),
                  subtitle: LoadingWidget(size: Size(52, 18)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      LoadingWidget(size: Size(61, 17)),
                      SizedBox(
                        height: 7,
                      ),
                      LoadingWidget(size: Size(61, 17)),
                    ],
                  ),
                ),
                if (isLoading) ...[
                  LoadingWidget(size: Size(double.infinity, 2)),
                ] else ...[
                  Divider(
                    color: AppTheme.colors.divider,
                  )
                ]
              ],
            ),
          ))
        ],
      );
    }
    return InkWell(
      onTap: onTap,
      child: IgnorePointer(
        child: Row(
          children: [
            IconDollarWidget(type: type),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      model.name,
                      style: AppTheme.textStyles.eventTileTitle,
                    ),
                    subtitle: Text(model.created!.diaMes(),
                        style: AppTheme.textStyles.eventTileSubTitle),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${model.value.reais()}',
                            style: AppTheme.textStyles.eventTileMoney),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${model.people} pessoa${model.people == 1 ? '' : 's'}',
                            style: AppTheme.textStyles.eventTilePeople)
                      ],
                    ),
                  ),
                  Divider(
                    color: AppTheme.colors.divider,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
