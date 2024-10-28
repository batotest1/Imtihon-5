import 'package:flutter/material.dart';

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
  bool n = false;
  void f() {
    setState(() {
      n = !n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: n ? Colors.yellow : Colors.red,
      appBar: AppBar(
        backgroundColor: n ? Colors.red : Colors.yellow,
        title: Text(n ? "Flutter" : "Bool"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child:  Image(
                    image: NetworkImage(
                      n ?
                        "data:image/jpeg;base64,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":"https://staticg.sportskeeda.com/editor/2023/08/3626c-16921875120044-1920.jpg?w=640"),fit: BoxFit.cover,)),
             Container(
                height: 400,
                width: 400,
                color: n ? Colors.white : Colors.black,
                alignment: n ? Alignment.topLeft:Alignment.bottomRight,
                child: Icon( n ? Icons.check:Icons.close,color: n ? Colors.amber:Colors.brown,size: 100,)
              ),
              SizedBox(height: 20,),
            Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              height: 190,
              child: Container(
                height: 70,
                width: 70,
                color: n ? Colors.green : Colors.red,
                child: ElevatedButton(
                  onPressed: () {
                    f();
                  },
                  child: Icon(
                    n ? Icons.check : Icons.close,
                    color: n ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
