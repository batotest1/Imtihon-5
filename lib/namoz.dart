import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Times and Cars',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> prayerTimes = {
    "bomdod": "00:00",
    "quyosh": "00:00",
    "peshin": "00:00",
    "asr": "00:00",
    "shom": "00:00",
    "hufton": "00:00",
  };

  List<Map<String, String>> cars = [
    {"name": "Mercedes AMG ", "image": "data:image/jpeg;base64,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"},
    {"name": "Mercedes S Class", "image": "https://imgd.aeplcdn.com/664x374/n/cw/ec/178535/c-class-exterior-right-front-three-quarter.jpeg?isig=0&q=80"},
    {"name": "Mercedes E Class", "image": "https://hips.hearstapps.com/hmg-prod/images/2024-mercedes-benz-e350-101-665e31f3e76cc.jpg?crop=0.833xw:0.704xh;0.0657xw,0.204xh&resize=2048:*"},
    {"name": "Gelik", "image": "https://www.mercedes-benzworld.co.uk/media/zf4jznme/off-road-header.jpg?anchor=center&mode=crop&width=600&quality=80&heightratio=1.35&rnd=133669951513270000"},
    {"name": "Amg", "image": "https://www.mercedes-benzworld.co.uk/media/zf4jznme/off-road-header.jpg?anchor=center&mode=crop&width=600&quality=80&heightratio=1.35&rnd=133669951513270000"},
    {"name": "Mercedes C-Class", "image": "https://www.topgear.com/sites/default/files/2021/11/Mercedes_C300D_0000.jpg"},
    {"name": "Mercedes E-Class", "image": "https://www.stratstone.com/-/media/stratstone/mercedes-benz/new-cars/new-e-class/mercedes-benz-e-class-driving-720x405px.ashx"},
    {"name": "Mercedes G-Class", "image": "https://www.topgear.com/sites/default/files/2024/05/20-Mercedes-G-Class-review.jpg"},
    {"name": "Mercedes S-Class", "image": "https://media.ed.edmunds-media.com/mercedes-benz/s-class/2024/oem/2024_mercedes-benz_s-class_sedan_amg-s-63-e-performance_fq_oem_1_1280.jpg"},
    {"name": "Mercedes A-Class", "image": "https://www.topgear.com/sites/default/files/2023/03/1-Mercedes-A-Class.jpg"},
  ];

  @override
  void initState() {
    super.initState();
    fetchPrayerTimes("Qo'qon");
  }

  Future<void> fetchPrayerTimes(String region) async {
    String url = "https://islomapi.uz/api/present/day?region=$region";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        prayerTimes = {
          "bomdod": data["times"]["bomdod"],
          "quyosh": data["times"]["quyosh"],
          "peshin": data["times"]["peshin"],
          "asr": data["times"]["asr"],
          "shom": data["times"]["shom"],
          "hufton": data["times"]["hufton"],
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.menu),
            SizedBox(width: 8),
            Text('Qo\'qon'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Date and Time
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    Positioned(
                      left: 25,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    Positioned(
                      left: 50,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text('Hijriy'),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.black,
                      child: Center(child: Text('2024-11-05', style: TextStyle(color: Colors.white))),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Container(
                  width: 40,
                  height: 80,
                  transform: Matrix4.rotationZ(-0.3),
                  color: Colors.black,
                  child: Center(child: Text('Seshanba', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ),

          // Prayer Times
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                buildPrayerTimeContainer("Bomdod", prayerTimes["bomdod"]!),
                buildPrayerTimeContainer("Quyosh", prayerTimes["quyosh"]!),
                buildPrayerTimeContainer("Peshin", prayerTimes["peshin"]!),
                buildPrayerTimeContainer("Asr", prayerTimes["asr"]!),
                buildPrayerTimeContainer("Shom", prayerTimes["shom"]!),
                buildPrayerTimeContainer("Hufton", prayerTimes["hufton"]!),
              ],
            ),
          ),

          // Cars List
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(cars[index]["image"]!),
                    title: Text(cars[index]["name"]!),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigate to car detail page if needed
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPrayerTimeContainer(String name, String time) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            time,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
