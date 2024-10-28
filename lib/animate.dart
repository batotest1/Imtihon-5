import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            Container(
              height: 300,
              color: Colors.amber,
              width: 300,
              child: Lottie.asset('lib/lottie/Animation - 1723611783525 (1).json',fit: BoxFit.cover)),
          ],
        ),
      ),
    );
  }
}