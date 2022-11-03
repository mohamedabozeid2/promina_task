import 'package:flutter/material.dart';

import '../utils/helper.dart';

class AddActionsButton extends StatelessWidget {
  void Function() fun;
  IconData icon;
  double iconSize;
  String title;

  AddActionsButton({required this.fun, this.title = '', required this.icon, this.iconSize = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Helper.getScreenWidth(context: context)*0.015),
      child: Row(
        children: [
          GestureDetector(
            onTap: fun,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: iconSize),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
