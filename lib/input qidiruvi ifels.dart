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
      floatingActionButton: FloatingActionButton(onPressed: (){
              nonf();
        },),
      appBar: AppBar(
        title: Text(matn),
      ),
      body: 
      Column(
        children: [
           TextField(
controller: qale,

          decoration: InputDecoration(
            border: OutlineInputBorder(),
                      ),
        ),
 

       
        ],
      ) ,
    );
  }
}
