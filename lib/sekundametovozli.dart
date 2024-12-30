import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TimerApp(),
  ));
}

class TimerApp extends StatefulWidget {
  const TimerApp({super.key});

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;

  Duration _remainingTime = const Duration();
  bool _isRunning = false;
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _startTimer() {
    if (_hours == 0 && _minutes == 0 && _seconds == 0) return;

    setState(() {
      _isRunning = true;
      _remainingTime = Duration(
        hours: _hours,
        minutes: _minutes,
        seconds: _seconds,
      );
    });

    Future.doWhile(() async {
      if (_remainingTime.inSeconds == 0) {
        await _audioPlayer.play(AssetSource("y.mp3"));
        setState(() {
          _isRunning = false;
        });
        return false;
      }

      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _remainingTime = Duration(seconds: _remainingTime.inSeconds - 1);
      });
      return true;
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
      _audioPlayer.stop(); // Stop the audio if playing
    });
  }

  void _resetFields() {
    setState(() {
      _hours = 0;
      _minutes = 0;
      _seconds = 0;
      _isRunning = false;
      _remainingTime = const Duration();
      _audioPlayer.stop(); // Stop the audio on reset
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Timer App", style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_remainingTime.inHours.toString().padLeft(2, '0')}:"
              "${(_remainingTime.inMinutes % 60).toString().padLeft(2, '0')}:"
              "${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _timeSetter("Hours", _hours, (value) {
                  setState(() {
                    _hours = value;
                  });
                }),
                const SizedBox(width: 20),
                _timeSetter("Minutes", _minutes, (value) {
                  setState(() {
                    _minutes = value;
                  });
                }),
                const SizedBox(width: 20),
                _timeSetter("Seconds", _seconds, (value) {
                  setState(() {
                    _seconds = value;
                  });
                }),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton("Start", _isRunning ? null : _startTimer, Colors.green),
                _actionButton("Stop", _isRunning ? _stopTimer : null, Colors.red),
                _actionButton("Reset", _resetFields, Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _timeSetter(String label, int value, Function(int) onChange) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Row(
          children: [
            IconButton(
              onPressed: value > 0
                  ? () {
                      onChange(value - 1);
                    }
                  : null,
              icon: const Icon(Icons.remove_circle, color: Colors.white),
            ),
            Text(
              value.toString().padLeft(2, '0'),
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                onChange(value + 1);
              },
              icon: const Icon(Icons.add_circle, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionButton(String label, VoidCallback? onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(label),
    );
  }
}
