import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(home: s()));
}

class s extends StatefulWidget {
  const s({super.key});

  @override
  State<s> createState() => _sState();
}

class _sState extends State<s> {
  VideoPlayerController? vidio;

  void f() {
    if (vidio != null && vidio!.value.isInitialized) {
      setState(() {
        vidio!.value.isPlaying ? vidio!.pause() : vidio!.play();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    vidio = VideoPlayerController.asset("videolar/tuxum.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          f();
        },
      ),
      body: Center(
        child: VideoPlayer(vidio!),
      ),
    );
  }
}
