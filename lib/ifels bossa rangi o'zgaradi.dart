import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TasbeehCounter()));
}

class TasbeehCounter extends StatefulWidget {
  @override
  _TasbeehCounterState createState() => _TasbeehCounterState();
}

class _TasbeehCounterState extends State<TasbeehCounter> {
  int raqam = 0;
  String matn = "Dushanba";
  Color selectedColor = Colors.black; 

  void nonf() {
    setState(() {
      if (raqam == 1) {
        matn = "Dushanba";
        selectedColor = Colors.yellow; 
      } else if (raqam == 2) {
        matn = "Seshanba";
        selectedColor = Colors.red; 
      } else if (raqam == 3) {
        matn = "Chorshanba";
        selectedColor = Colors.blue; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 200,
              color: Colors.yellow,
              child: TextButton(
                onPressed: () {
                  raqam = 1;
                  nonf();
                },
                child: Text("1"),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 100,
              width: 200,
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  raqam = 2;
                  nonf();
                },
                child: Text("2"),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 100,
              width: 200,
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  raqam = 3;
                  nonf();
                },
                child: Text("3"),
              ),
            ),
            SizedBox(height: 100),
            Container(
              width: 400,
              height: 200,
              color: selectedColor, 
            ),
          ],
        ),
      ),
    );
  }
}
