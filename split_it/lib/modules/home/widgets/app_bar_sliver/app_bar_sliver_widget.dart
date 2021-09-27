import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/add_button_widget.dart';
import 'package:split_it/modules/home/widgets/app_bar/bottom_app_bar/bottom_app_bar_widget.dart';

import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarSliverWidget extends StatefulWidget {
  final UserModel user;
  final VoidCallback onTapAddButton;
  AppBarSliverWidget({
    Key? key,
    required this.user,
    required this.onTapAddButton,
  }) : super(key: key);

  @override
  _AppBarSliverWidgetState createState() => _AppBarSliverWidgetState();
}

class _AppBarSliverWidgetState extends State<AppBarSliverWidget> {
  late UserModel usuario = widget.user;
  late VoidCallback onTaps = widget.onTapAddButton;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 10,
      pinned: true,
      leadingWidth: 72,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: CachedNetworkImageProvider(usuario.photoURL!),
              ),
            ),
          ),
        ],
      ),
      title: Text(
        usuario.name!,
        style: AppTheme.textStyles.appBar,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              AddButtonWidget(
                onTap: onTaps,
              ),
            ],
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            SizedBox(
              height: 95,
            ),
            BottomAppBarWidget(),
          ],
        ),
      ),
      backgroundColor: AppTheme.colors.backgroundSecondary,
      expandedHeight: 250,
      bottom: PreferredSize(
        child: Container(),
        preferredSize: Size.fromHeight(10),
      ),
    );
  }
}
