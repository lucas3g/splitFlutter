import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTileWidget extends StatelessWidget {
  final String name;
  final bool isRemoved;
  const PersonTileWidget({Key? key, required this.name, this.isRemoved = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        color: Colors.grey.shade300,
      ),
      title: Text(name),
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
        onPressed: () {},
      ),
    );
  }
}
