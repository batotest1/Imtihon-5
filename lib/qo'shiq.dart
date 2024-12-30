import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Map<String, String>> _songs = [
    {
      "title": "Qo'shiq 1",
      "artist": "Qo'shiq",
      "path": "assets/9_1QKVcDSAg.mp3",
      "video": "videolar/SaveIG_App_An_XwvsFPs0U4rfxShGr95hU_wIAl3FhogJjLASn4_KklKOddPg1.mp4",
    },
    {
      "title": "Qo'shiq 2",
      "artist": "Ashula",
      "path": "assets/d3E3RAfp6KI.mp3",
      "video": "videolar/SaveVid.Net_5743F87074E6B7EBEA610DC90A3E0A94_video_dashinit.mp4",
    },
    {
      "title": "like",
      "artist": "Top",
      "path": "assets/volute - Topic - GTA 4 Loading.mp3",
      "video": "videolar/SaveVid.Net_7849F2F9FDEE915E5D165202141B9791_video_dashinit.mp4",
    },
  ];
  int _currentIndex = 0;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });
    _audioPlayer.onPlayerComplete.listen((_) {
      _nextTrack();
    });
  }

  void _initializeVideoController() {
    _videoController = VideoPlayerController.asset(
      _songs[_currentIndex]['video']!,
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _videoController.dispose();
    super.dispose();
  }

  void _playPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      _videoController.pause();
    } else {
      await _audioPlayer.play(AssetSource(_songs[_currentIndex]['path']!));
      _videoController.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _nextTrack() {
    if (_currentIndex < _songs.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    _playTrack();
  }

  void _previousTrack() {
    if (_currentIndex > 0) {
      _currentIndex--;
    } else {
      _currentIndex = _songs.length - 1;
    }
    _playTrack();
  }

  void _playTrack() async {
    _videoController.dispose();
    _initializeVideoController();
    await _audioPlayer.play(AssetSource(_songs[_currentIndex]['path']!));
    _videoController.play();
    setState(() {
      _isPlaying = true;
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Music Player'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_videoController.value.isInitialized)
            AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _songs[_currentIndex]['title']!,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _songs[_currentIndex]['artist']!,
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Slider(
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            min: 0,
            max: _totalDuration.inSeconds.toDouble(),
            value: _currentPosition.inSeconds.toDouble(),
            onChanged: (value) {
              _audioPlayer.seek(Duration(seconds: value.toInt()));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_currentPosition),
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  _formatDuration(_totalDuration),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _previousTrack,
                icon: Icon(Icons.skip_previous, color: Colors.white),
                iconSize: 36,
              ),
              IconButton(
                onPressed: _playPause,
                icon: Icon(
                  _isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  color: Colors.white,
                ),
                iconSize: 64,
              ),
              IconButton(
                onPressed: _nextTrack,
                icon: Icon(Icons.skip_next, color: Colors.white),
                iconSize: 36,
              ),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
