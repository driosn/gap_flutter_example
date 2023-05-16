import 'package:flutter/material.dart';
import 'package:flutter_gap_talk/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GAP Example',
      home: HomePage(),
    );
  }
}
