import 'package:flutter/material.dart';

import 'package:split_it/modules/home/widgets/add_button_widget.dart';
import 'package:split_it/modules/home/widgets/app_bar/bottom_app_bar/bottom_app_bar_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onTapAddButton;
  AppBarWidget({
    required this.user,
    required this.onTapAddButton,
  }) : super(
            child: Stack(
              children: [
                Container(
                  height: 240,
                  color: AppTheme.colors.backgroundSecondary,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 62),
                      child: ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(user.photoUrl!)),
                        title: Text(
                          user.name!,
                          style: AppTheme.textStyles.appBar,
                        ),
                        trailing: AddButtonWidget(
                          onTap: onTapAddButton,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    BottomAppBarWidget(),
                  ],
                ),
              ],
            ),
            preferredSize: Size.fromHeight(298));
}
