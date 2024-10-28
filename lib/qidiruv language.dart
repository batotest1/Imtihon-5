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
  String raqam = "";
String matn = "";
  void nonf() {
raqam = qale.text;
    setState(() {
  if (raqam == "Dushanba") {
    matn = "Monday";
  }
   else  if (raqam == "Seshanba"){
      matn = "Tuesday";
    }
    else if (raqam == "Chorshanba"){
      matn = "Wednesday";
    }
    else if (raqam == "Payshanba"){
      matn = "Thursday";
    }
    else if (raqam == "Juma"){
      matn = "Friday";
    }
    else if (raqam == "Shanba"){
      matn = "Saturday";
    }
    else if (raqam == "Yakshanba"){
      matn = "Sunday";
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
      body: 
      Column(
        children: [
           TextField(textInputAction: TextInputAction.next,
controller: qale,
          decoration: InputDecoration(
            
            suffixIcon: IconButton(onPressed: (){ nonf();}, icon: Icon(Icons.language)),
            border: OutlineInputBorder(),
                      ),
      )
        ]
        ),
    );
  }
}
