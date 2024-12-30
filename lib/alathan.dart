import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: PrayerTimesPage(),
  ));
}

class PrayerTimesPage extends StatefulWidget {
  @override
  _PrayerTimesPageState createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  Stream<Map<String, dynamic>> get prayerTimesStream async* {
    while (true) {
      // Fetch prayer times from aladhan API every minute
      yield await fetchPrayerTimes();
      await Future.delayed(Duration(minutes: 1));
    }
  }
Future<Map<String, dynamic>> fetchPrayerTimes() async {
  final url = Uri.parse(
    'http://api.aladhan.com/v1/timingsByCity?city=Tashkent&country=Uzbekistan&method=2',
  );
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final timings = data['data']['timings'];
    final date = data['data']['date']['gregorian'];
    final hijri = data['data']['date']['hijri'];

    return {
      'gregorianDate': date['date'] as String,
      'weekday': date['weekday']['en'] as String,
      'hijriDate': '${hijri['month']['en']} ${hijri['day']}, ${hijri['year']}',
      'prayerTimes': {
        'bomdod': timings['Fajr'].toString(),
        'quyosh': timings['Sunrise'].toString(),
        'peshi': timings['Dhuhr'].toString(),
        'asr': timings['Asr'].toString(),
        'shom': timings['Maghrib'].toString(),
        'hufton': timings['Isha'].toString(),
      },
    };
  } else {
    print('Failed to fetch prayer times');
    return {};
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Map<String, dynamic>>(
        stream: prayerTimesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching prayer times'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          }

          final data = snapshot.data!;
          final gregorianDate = data['gregorianDate'];
          final weekday = data['weekday'];
          final hijriDate = data['hijriDate'];
          final prayerTimes = data['prayerTimes'] as Map<String, String>;

          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT14SY3HbV6iQqtb6N9QD3TzaBQm59fZLnxoQ&s'), // Background image URL
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Asia/Tashkent',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            hijriDate,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            'جُمَادَىٰ ٱلْأُولَىٰ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Arial'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Gregorian Date: $gregorianDate',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      'Weekday: $weekday',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    for (var entry in prayerTimes.entries)
                      prayerTimeRow(entry.key, entry.value),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget prayerTimeRow(String name, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
