import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(home: SS()));
}

class SS extends StatefulWidget {
  const SS({super.key});

  @override
  State<SS> createState() => _SSState();
}

class _SSState extends State<SS> {
  String year = '';
  String month = '';
  String day = '';
  String hour = '';
  String minute = '';
  String seconds = '';
  String milliseconds = '';
  String dateTime = '';
  String date = '';
  String time = '';
  String timeZone = '';
  String dayOfWeek = '';
  String dstActive = '';
  bool loading = true;
  Timer? timer;

  void api() async {
    String apiLink = "https://www.timeapi.io/api/Time/current/zone?timeZone=asia/tashkent";
    Response response = await get(Uri.parse(apiLink));
    Map<String, dynamic> data = jsonDecode(response.body);

    setState(() {
      year = data["year"].toString();
      month = data["month"].toString();
      day = data["day"].toString();
      hour = data["hour"].toString();
      minute = data["minute"].toString();
      seconds = data["seconds"].toString();
      milliseconds = data["milliSeconds"].toString();
      dateTime = data["dateTime"];
      date = data["date"];
      time = data["time"];
      timeZone = data["timeZone"];
      dayOfWeek = data["dayOfWeek"];
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    api();
        timer = Timer.periodic(Duration(seconds: 1), (Timer t) => api());
}
  @override
  void dispose() {
    timer?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:                   Text("$timeZone"),),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Year: $year"),
                  Text("Month: $month"),
                  Text("Day: $day"),
                  Text("Hour: $hour"),
                  Text("Minute: $minute"),
                  Text("Seconds: $seconds"),
                  Text("Milliseconds: $milliseconds"),
                  Text("DateTime: $dateTime"),
                  Text("Date: $date"),
                  Text("Time: $time"),
                  Text("Day of Week: $dayOfWeek"),
                  Text("DST Active: $dstActive"),
                ],
              ),
            ),
    );
  }
}
