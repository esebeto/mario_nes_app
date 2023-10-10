import 'package:flutter/material.dart';
import 'package:mario_nes_app/screen/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mario Bros',
      home: HomePage(),
    );
  }
}
