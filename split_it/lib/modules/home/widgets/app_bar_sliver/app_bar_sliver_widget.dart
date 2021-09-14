import 'dart:ffi';

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
        floating: true,
        leadingWidth: 75,
        leading: Row(
          children: [
            SizedBox(
              width: 17,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(usuario.photoUrl!),
            ),
          ],
        ),
        title: Text(
          usuario.name!,
          style: AppTheme.textStyles.appBar,
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              BottomAppBarWidget(),
            ],
          ),
        ),
        backgroundColor: AppTheme.colors.backgroundSecondary,
        expandedHeight: 250,
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
        ]);
  }
}
