import 'package:flutter/material.dart';
import 'package:shopping_modern/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnbordingScreen(),
      color: Color(0xff242424),
    );
  }
}
