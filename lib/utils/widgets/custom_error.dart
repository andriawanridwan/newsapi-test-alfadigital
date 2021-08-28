import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_berita/utils/values/my_values.dart';
import 'package:test_berita/utils/widgets/custom_button.dart';

class CustomError {
  static Widget noPicture(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.3,
      color: Colors.grey,
      child: Center(
        child: Text(
          MyValues.no_picture,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  static Widget tryAgain(BuildContext context, Function() press) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/error.svg',
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          SizedBox(height: 10),
          Text(
            MyValues.error_data,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          CustomButton.primary(
            context: context,
            text: MyValues.try_again,
            onPress: press,
          ),
        ],
      ),
    );
  }

  static Widget empty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/empty.svg',
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          SizedBox(height: 10),
          Text(
            MyValues.empty_data,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
