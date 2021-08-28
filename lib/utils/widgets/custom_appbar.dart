import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar general({
    required BuildContext context,
    required String title,
    bool backButton = true,
    List<Widget>? actions,
  }) {
    return AppBar(
      leading: backButton
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back),
            )
          : SizedBox(),
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.white,
            ),
      ),
      actions: actions,
    );
  }
}
