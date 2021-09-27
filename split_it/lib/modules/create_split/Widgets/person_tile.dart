import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTileWidget extends StatelessWidget {
  final FriendModel friend;
  final bool isRemoved;
  final VoidCallback onPressed;
  const PersonTileWidget(
      {Key? key,
      required this.friend,
      this.isRemoved = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: CachedNetworkImageProvider(friend.photoURL),
              fit: BoxFit.cover),
        ),
      ),
      title: Text(
        friend.name,
        style: isRemoved
            ? AppTheme.textStyles.personTileTitleSelected
            : AppTheme.textStyles.personTileTitle,
      ),
      trailing: IconButton(
        icon: isRemoved
            ? Icon(
                Icons.remove,
                color: Colors.red,
              )
            : Icon(
                Icons.add,
                color: AppTheme.colors.backgroundSecondary,
              ),
        onPressed: onPressed,
      ),
    );
  }
}
