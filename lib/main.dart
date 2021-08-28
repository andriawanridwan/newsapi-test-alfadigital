import 'package:flutter/material.dart';
import 'package:test_berita/screens/dashboard/dashboard_screen.dart';
import 'package:test_berita/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News API',
      theme: themes,
      home: DashboardScreen(),
    );
  }
}
