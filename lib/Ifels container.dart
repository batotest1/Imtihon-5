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
  void nonf() {
    setState(() {
  if (raqam == 1) {
    matn = "Dushanba";
  }
   else  if (raqam == 2){
      matn = "Seshanba";
    }
    else if (raqam == 3){
      matn = "Chorshanba";
    }
    else if (raqam == 4){
      matn = "Payshanba";
    }
    else if (raqam == 5){
      matn = "Juma";
    }
    else if (raqam == 6){
      matn = "Shanba";
    }
    else if (raqam == 7){
      matn = "Yakshanba";
    }
    else {
      matn = "Bunaqa kun mavjud emas";
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(matn),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 200,
              color: Colors.amber,
              child: TextButton(onPressed: (){
                raqam = 1;
                nonf();
              }, child: Text("1"),)
            ),
            SizedBox(height: 15,),
             Container(
              height: 100,
              width: 200,
              color: Colors.amber,
              child: TextButton(onPressed: (){
                raqam = 2;
                                nonf();

              }, child: Text("2"),)
            ),
            SizedBox(height: 15,),
              Container(
              height: 100,
              width: 200,
              color: Colors.amber,
              child: TextButton(onPressed: (){
                raqam = 3;
                                nonf();

              }, child: Text("3"),)
            ),
            SizedBox(height: 15,),
              Container(
              height: 100,
              width: 200,
              color: Colors.amber,
              child: TextButton(onPressed: (){
                raqam = 4;
                                nonf();

              }, child: Text("4"),)
            ),
            SizedBox(height: 15,),
              Container(
              height: 100,
              width: 200,
              color: Colors.amber,
              child: TextButton(onPressed: (){
                raqam = 5;
                                nonf();

              }, child: Text("5"),)
            ),
            SizedBox(height: 15,),
              Container(
              height: 90,
              width: 200,
              color: Colors.amber,
              child: TextButton(onPressed: (){
                raqam = 6;
                                nonf();

              }, child: Text("6"),)
            ),
            SizedBox(height: 15,),
              Container(
              height: 90,
              width: 200,
              color: Colors.amber,
              child: TextButton(onPressed: (){
                raqam = 7;
                                nonf();

              }, child: Text("7"),)
            ),
            SizedBox(height: 15,),
              Container(
              height: 90,
              width: 200,
              color: Colors.amber,
              child: TextButton(onPressed: (){
                raqam = 8;
                                nonf();

              }, child: Text("8"),)
            ),
            SizedBox(height: 15,),
          ],
        ),
      ) ,
    );
  }
}
