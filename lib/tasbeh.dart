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
   int a = 0;
void b (){
  setState(() {
    a++;
  });
}
 int d = 0;
void e (){
  setState(() {
    a--;
  });
}
 int f = 0;
void h (){
  setState(() {
    a;
  });
}
void j (){
  setState(() {
    a = 0;
  });
}
int k = 0;
void l (){
  setState(() {
    a+=5;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          child: Text("$a",style: TextStyle(fontSize: 50),),
        ),        
            Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 170),
                    child: Center(child: ElevatedButton(onPressed: (){b();}, child:Text("+",style: TextStyle(fontSize: 70),),)),
                  ),
                                        Center(child: ElevatedButton(onPressed: (){e();}, child: Text("-",style: TextStyle(fontSize: 70),))),
              
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 165),
                  child: ElevatedButton(onPressed: (){j();}, child: Icon(Icons.restore,size: 70,)),
                ),
                                ElevatedButton(onPressed: (){l();}, child: Text("5",style: TextStyle(fontSize: 70),),),

              ],
            ),
        
          ],
        ),
      ),
    );
  }
}
   