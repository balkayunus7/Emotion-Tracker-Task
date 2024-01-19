import 'package:emotion_tracker/feauture/main_page/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
