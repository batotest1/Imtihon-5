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
  bool w = true;
  void e() {
    setState(() {
      w = !w;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: w ? Alignment.topCenter : Alignment.bottomRight,
              curve: Curves.bounceOut,
              duration: Duration(seconds: 4),
              child: CircleAvatar(
                radius: 120,
                backgroundColor: Colors.amber,
              ),
            ),
              AnimatedAlign(
              alignment: w ? Alignment.center:Alignment.topLeft,
                            curve: Curves.bounceOut,
              duration: Duration(seconds: 4),
              child: CircleAvatar(
                radius: 120,
                backgroundColor: Colors.amber,
              ),
            ),
            Padding(
              
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                height: 200,
                width: 120,
                color: w? Colors.red:Colors.blue,
              ),
            ),
               AnimatedAlign(
              alignment: w ? Alignment.center:Alignment.bottomLeft,
                            curve: Curves.bounceOut,
              duration: Duration(seconds: 4),
              child: CircleAvatar(
                radius: 120,
                backgroundColor: Colors.amber,
              ),
            ),
            
  ElevatedButton(
    onPressed: (){e();}, child:  
 Container(height: 100,width: 200,color: Colors.black,alignment: Alignment.bottomRight,),)
     
    ],
        ),
      ),
    );
  }
}
