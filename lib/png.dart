import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: (HomePage())));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.favorite_outline_rounded,
          size: 30,
        ),
        actions: [
          Icon(Icons.flip_camera_android_outlined),
        ],
      ),
      body: Column(
        children: [
          Text(
            "Hi Teresa G!",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
          ),
          Text(
            "Explore Your Favourite Mobile Here",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          Row(
            children: [
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your phone number',
                    prefixIcon:
                        Icon(Icons.search), // Chap tomonda ikon qo'shish
                    border: OutlineInputBorder(),
                  ),
                ),
                width: 400,
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.amber,
                child: Icon(Icons.add_road_outlined),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Container(
            height: 170,
            width: 450,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Explore Latest",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "Mobily with Nice",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Container(
                      height:40,
                      width: 100,
                      decoration:
                          BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(70)),
                            child: Center( child: Text("Explore",style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: Image(image: AssetImage("Images/2XN9DphZmDsODrGTFcNNPPFfpqX-mobile.jpg"),fit: BoxFit.cover,))
              ],
            ),
          )
        ],
      ),
    );
  }
}
