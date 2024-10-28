import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TasbeehCounter()));
}


class TasbeehCounter extends StatefulWidget {
  @override
  _TasbeehCounterState createState() => _TasbeehCounterState();
}

class _TasbeehCounterState extends State<TasbeehCounter> {
  TextEditingController qale = TextEditingController();
  int raqam = 1;
String matn = "";
  void nonf() {
    raqam = int.tryParse(qale.text) ?? 0;
    setState(() {
  if (raqam == 1) {
    matn = "Mumkin emas";
  }
   else  if (raqam == 2){
      matn = "Mumkin emas";
    }
    else if (raqam == 3){
      matn = "Mumkin emas";
    }
    else if (raqam == 4){
      matn = "Mumkin emas";
    }
    else if (raqam == 5){
      matn = "Mumkin emas";
    }
    else if (raqam == 6){
      matn = "Mumkin emas";
    }
    else if (raqam == 7){
      matn = "Mumkin emas";
    }
    else if (raqam == 8){
      matn = "Mumkin emas";
    }
else if (raqam == 9){
      matn = "Mumkin emas";
    }
    else if (raqam == 10){
      matn = "Mumkin emas";
    }
    else if (raqam == 11){
      matn = "Mumkin emas";
    }
    else if (raqam == 12){
      matn = "Mumkin emas";
    }
    else if (raqam == 13){
      matn = "Mumkin emas";
    }
    else if (raqam == 14){
      matn = "Mumkin emas";
    }
    else if (raqam == 15){
      matn = "Mumkin emas";
    }
    else if (raqam == 16){
      matn = "Mumkin emas";
    }
    else if (raqam == 17){
      matn = "Mumkin emas";
    }
    else {
      matn = "Mumkin";
    }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
              nonf();
        },),
      body: 
      Column(
        children: [
           TextField(
controller: qale,

          decoration: InputDecoration(
            border: OutlineInputBorder(),
                      ),
        ),
 Text(matn,style: TextStyle(fontSize: 30,),),

       
        ],
      ) ,
    );
  }
}
