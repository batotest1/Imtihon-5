import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    Oddiy(name: "Krasovka", imagePath: 'assets/krasovka.png'),
    Oddiy(name: "Tufli", imagePath: 'assets/tufli.png'),
    Oddiy(name: "Futbolka", imagePath: 'Images/futbolka.png'),
    Oddiy(name: "Ko'ylak", imagePath: ''),
    Oddiy(name: "Shim", imagePath: 'Images/shim.png'),
    Oddiy(name: "Ishton", imagePath: 'Images/ishton.png'),
    Oddiy(name: "Paypoq", imagePath: 'Images/paypoq.png'),
    Oddiy(name: "Kepka", imagePath: 'Images/kepka.png'),
    Oddiy(name: "Tasma", imagePath: 'Images/tasma.png'),
    Oddiy(name: "Sumka", imagePath: 'Images/sumka.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent.shade400,
      appBar: AppBar(
        title: Text("Style", style: GoogleFonts.amaranth(color: Colors.black, fontSize: 30)),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3 / 2, // Adjusts item height and width ratio
          ),
          itemCount: meva.length,
          itemBuilder: (context, index) {
            return dizayn(meva[index]);
          },
        ),
      ),
    );
  }

  Widget dizayn(Oddiy item) {
    return Card(
      color: Colors.indigo.shade900,
      child: Stack(
        children: [
          // Positioned image at the top left
          Positioned(
            top: 8,
            left: 8,
            child: Image.asset(
              item.imagePath!,
              width: 50,
              height: 50,
            ),
          ),
          // Centered text
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30), // Adjust padding to avoid overlap
              child: Text(
                item.name!,
                style: GoogleFonts.yujiMai(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Oddiy {
  String? name;
  String? imagePath;

  Oddiy({this.name, this.imagePath});
}
