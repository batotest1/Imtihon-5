import 'package:flutter/material.dart';

class Subhat extends StatefulWidget {
  const Subhat({super.key});

  @override
  State<Subhat> createState() => _SubhatState();
}

class _SubhatState extends State<Subhat> {
  String qiymat = 'one';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blur Image"),
        centerTitle: true,
      ),
      backgroundColor: Colors.teal[900],
      body: Center(
        child: DropdownButton<String>(
          value: qiymat,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.red,
          ),
          underline: Container(
            color: Colors.blue,
            height: 2,
          ),
          items: [
            DropdownMenuItem(value:"one",child: Text("One"),),
             DropdownMenuItem(value:"two",child: Text("Two"),),
              DropdownMenuItem(value:"three",child: Text("Three"),),
               DropdownMenuItem(value:"four",child: Text("Four"),),
                DropdownMenuItem(value:"five",child: Text("Five"),),
          ],
          onChanged: (String? newvalue) {
            setState(() {
              qiymat = newvalue!;
            });
          }
        ),
      ),
    );
  }
}
