import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TimeOfDay time = const TimeOfDay(hour: 12, minute: 12);
  DateTime date = DateTime(2024, 1, 1);

  // Soat tanlash oynasini ochish
  void showTimePickerDialog() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (newTime != null) {
      setState(() {
        time = newTime;
      });
    }
  }

  // Refresh funksiyasi (1-yanvar-2024 ga qaytarish)
  void resetDateAndTime() {
    setState(() {
      time = const TimeOfDay(hour: 12, minute: 12);
      date = DateTime(2024, 1, 1);
    });
  }

  // Sana tanlash oynasini ochish
  void showDatePickerDialog() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1700),
      lastDate: DateTime(8000),
    );
    if (newDate != null) {
      setState(() {
        date = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            Text(
              "Tanlangan vaqt: ${time.hour}:${time.minute.toString().padLeft(2, '0')}\n"
              "Tanlangan sana: ${date.day}/${date.month}/${date.year}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
             Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.access_time), // Soat ikonkasi
              onPressed: showTimePickerDialog,
            ),
            IconButton(
              icon: const Icon(Icons.refresh), // Refresh ikonkasi
              onPressed: resetDateAndTime,
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today), // Kalendar ikonkasi
              onPressed: showDatePickerDialog,
            ),
          ],
        ),
          ],
        ),
      ),
     
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyWidget()));
}
