import 'package:flutter/material.dart';
import 'package:test_berita/screens/dashboard/widgets/body.dart';
import 'package:test_berita/utils/values/my_values.dart';
import 'package:test_berita/utils/widgets/custom_appbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.general(
        context: context,
        title: MyValues.news_api,
        backButton: false,
      ),
      body: Body(),
    );
  }
}
