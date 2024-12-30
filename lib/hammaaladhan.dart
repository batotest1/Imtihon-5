import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: PrayerTimesPage(),
  ));
}
class PrayerTimesPage extends StatelessWidget {
  final Map<String, String> timings = {
    "Fajr": "05:19",
    "Sunrise": "06:52",
    "Dhuhr": "12:00",
    "Asr": "14:46",
    "Sunset": "17:07",
    "Maghrib": "17:07",
    "Isha": "18:40",
    "Imsak": "05:09",
    "Midnight": "00:00",
    "Firstthird": "21:42",
    "Lastthird": "02:17",
  };

  final Map<String, String> dateInfo = {
    "readable": "06 Nov 2024",
    "hijri": "04-05-1446",
    "weekday": "Al Arba'a",
    "month": "Jumādá al-ūlá",
    "year": "1446",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prayer Times"),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hijri and Gregorian date
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.teal.shade100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date: ${dateInfo['readable']} (Gregorian)",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Hijri Date: ${dateInfo['hijri']} - ${dateInfo['month']} ${dateInfo['year']}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Day: ${dateInfo['weekday']}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: timings.length,
                itemBuilder: (context, index) {
                  String prayer = timings.keys.elementAt(index);
                  String time = timings.values.elementAt(index);
                  return PrayerCard(prayer: prayer, time: time);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrayerCard extends StatelessWidget {
  final String prayer;
  final String time;

  const PrayerCard({Key? key, required this.prayer, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.shade200,
          child: Icon(Icons.access_time, color: Colors.white),
        ),
        title: Text(
          prayer,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade900,
          ),
        ),
        trailing: Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
