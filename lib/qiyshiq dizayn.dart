import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Qiyshiq Dizayn'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Transform(
            transform: Matrix4.skewY(1.1), // Qiyshiq dizayn beruvchi transformatsiya
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20), // Yuvarlak burchaklar
              ),
              child: Center(
              ),
            ),
          ),
        ),
      ),
    );
  }
}
