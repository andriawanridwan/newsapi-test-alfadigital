import 'package:flutter/material.dart';
import 'package:test_berita/utils/values/my_colors.dart';

class CustomButton {
  static Widget primary({
    required BuildContext context,
    required String text,
    required Function() onPress,
  }) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: MyColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
