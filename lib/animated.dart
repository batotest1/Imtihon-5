import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void a() {
    setState(() {
      Future.delayed(Duration(seconds: 4)).then((r) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Keyingi()));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: SpinKitChasingDots(
            color: Colors.amber,
          )),
        ],
      ),
    );
  }
}

class Keyingi extends StatefulWidget {
  const Keyingi({super.key});

  @override
  State<Keyingi> createState() => _KeyingiState();
}

class _KeyingiState extends State<Keyingi> {
  bool a1 = true;
  void a2() {
    setState(() {
      a1 = !a1;
    });
  }
  bool b1 = true;
  void b2() {
    setState(() {
      b1 = !b1;
    });
  }
bool d1 = true;
void d2() {
  setState(() {
    d1 = !d1;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedAlign(
            duration: Duration(seconds: 3),
            
            alignment:a1? Alignment.topLeft:Alignment.bottomLeft,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70))),
            ),
          ),
        AnimatedAlign(
            duration: Duration(seconds: 3),        
            alignment:a1? Alignment.bottomLeft:Alignment.bottomRight,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
            ),
          ),
          Center(
            child: InkWell(
onTap: () {
  a2();
},
onDoubleTap: () {
  b2();
},
onLongPress: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context) => Qale(), ));

},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 200,
                    color: Colors.black,
                    child: Center(
                        child: Text(
                      "Ok",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    )),
                  ),
                  Text(b1?"":"Ikki martta bosildi"),
                ],
              ),
            ),
          ),
          AnimatedAlign(
              duration: Duration(seconds: 3),
            alignment:a1? Alignment.bottomRight:Alignment.topRight,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(70))),
            ),
          ),
          AnimatedAlign(
  duration: Duration(seconds: 3),
            alignment:a1? Alignment.topRight:Alignment.topLeft,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(70))),
            ),
          ),
        ],
      ),
    );
  }
}
class Qale extends StatefulWidget {
  const Qale({super.key});

  @override
  State<Qale> createState() => _QaleState();
}

class _QaleState extends State<Qale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Kirish",style: TextStyle(fontSize: 100),),
    );
  }
}