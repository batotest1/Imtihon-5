import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text("FLUTTER",style:GoogleFonts.vollkorn(fontSize: 100))),
                    Center(child: Text("FLUTTER",style:GoogleFonts.vampiroOne(fontSize: 100))),

        ],
      ),
    );
  }
}