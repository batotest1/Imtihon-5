import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: s()));
}

class s extends StatefulWidget {
  const s({super.key});

  @override
  State<s> createState() => _sState();
}

class _sState extends State<s> {
  final audioplayer = AudioPlayer();
  bool isPlaying = false; // To track if audio is playing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            
            IconButton(
              onPressed: () async {
                if (isPlaying) {
                  await audioplayer.pause();
                } else {
                  await audioplayer.play(AssetSource("lib/assets/y.mp3"));
                }
                setState(() {
                  isPlaying = !isPlaying; // Toggle play/pause state
                });
              },
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow), // Toggle icon
            ),
            IconButton(
              onPressed: () async {
                await audioplayer.stop();
                setState(() {
                  isPlaying = false; // Reset play state after stopping
                });
              },
              icon: Icon(Icons.stop),
            ),
          ],
        ),
      ),
    );
  }
}
