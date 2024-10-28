import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Kirish(),
  ));
}

class Kirish extends StatefulWidget {
  const Kirish({super.key});

  @override
  State<Kirish> createState() => _KirishState();
}

class _KirishState extends State<Kirish> {
  List<Oddiy> meva = [
    Oddiy(name: "Paris", ),
    Oddiy(name: "Chicago"),
    Oddiy(name: "Italy", ),
    Oddiy(name: "Tokyo", ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Har hil ma'lumotli Listlar"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
            children: meva.map((item) => dizayn(item)).toList(),
      ),
    );
  }

  Widget dizayn(Oddiy item) {
    return SizedBox(
      height: 200,
      width: 600,
      child: Card(
        color: Colors.teal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_pin, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    item.name!, // Use item instead of ism
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Oddiy {
  String? name;
  String? rasm;

  Oddiy({this.name, this.rasm});
}
