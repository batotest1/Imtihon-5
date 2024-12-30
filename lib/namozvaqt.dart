import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrayerTimeScreen(),
    );
  }
}

class PrayerTimeScreen extends StatefulWidget {
  @override
  _PrayerTimeScreenState createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  String selectedRegion = "Toshkent";
  Map<String, String> prayerTimes = {
    "tong": "-",
    "quyosh": "-",
    "peshin": "-",
    "asr": "-",
    "shom": "-",
    "hufton": "-"
  };

  final List<String> regions = [
    "Toshkent",
    "Andijon",
    "Farg'ona",
    "Namangan",
    "Samarqand",
    "Buxoro",
    "Navoiy",
    "Qashqadaryo",
    "Surxondaryo",
    "Sirdaryo",
    "Jizzax",
    "Xorazm"
  ];

  @override
  void initState() {
    super.initState();
    fetchPrayerTimes(selectedRegion);
  }

  Future<void> fetchPrayerTimes(String region) async {
    String url = "https://islomapi.uz/api/present/day?region=$region";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          prayerTimes = {
            "tong": data["times"]["tong_saharlik"],
            "quyosh": data["times"]["quyosh"],
            "peshin": data["times"]["peshin"],
            "asr": data["times"]["asr"],
            "shom": data["times"]["shom_iftor"],
            "hufton": data["times"]["hufton"]
          };
        });
      } else {
        setState(() {
          prayerTimes = {
            "tong": "Error",
            "quyosh": "Error",
            "peshin": "Error",
            "asr": "Error",
            "shom": "Error",
            "hufton": "Error"
          };
        });
      }
    } catch (e) {
      setState(() {
        prayerTimes = {
          "tong": "Error",
          "quyosh": "Error",
          "peshin": "Error",
          "asr": "Error",
          "shom": "Error",
          "hufton": "Error"
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$selectedRegion"),
        actions: [
          Icon(Icons.share_sharp),
          Icon(Icons.close),
          Icon(Icons.search),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Hijri Date: 1445-10-23",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                prayerTimeWidget("Tong", prayerTimes["tong"]),
                prayerTimeWidget("Quyosh", prayerTimes["quyosh"]),
                prayerTimeWidget("Peshin", prayerTimes["peshin"]),
                prayerTimeWidget("Asr", prayerTimes["asr"]),
                prayerTimeWidget("Shom", prayerTimes["shom"]),
                prayerTimeWidget("Hufton", prayerTimes["hufton"]),
                DropdownButton<String>(
                  value: selectedRegion,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRegion = newValue!;
                      fetchPrayerTimes(selectedRegion);
                    });
                  },
                  items: regions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Positioned(
                top: 60,
                left: 16,
                child: CircleAvatar(child: Text("1")),
              ),
               Positioned(
            child: CircleAvatar(child: Text("2")),
          ),
          Positioned(
            child: CircleAvatar(child: Text("3")),
          ),
            ],
          ),
         
        ],
      ),
    );
  }

  Widget prayerTimeWidget(String name, String? time) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.access_time),
        title: Text(name),
        trailing: Text(time ?? "-"),
      ),
    );
  }
}
