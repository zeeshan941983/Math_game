import 'package:flutter/material.dart';
import 'package:mathgame/pages/addition/for_Addition.dart';
import 'package:mathgame/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: multi(),
    );
  }
}
