import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'components/sound_player.dart';
import 'components/sound_recorder.dart';

class Module7Screen extends StatefulWidget {
  const Module7Screen({Key? key}) : super(key: key);

  @override
  _Module7ScreenState createState() => _Module7ScreenState();
}

class _Module7ScreenState extends State<Module7Screen> {
  final soundRecorder = SoundRecorder();
  final soundPlayer = SoundPlayer();
  late Timer _timer;
  String _timerText = '00:00';
  String fileSize = '0';

  @override
  void initState() {
    super.initState();

    soundRecorder.init();
    soundPlayer.init();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
    _timer.cancel();
  }

  timerToggle() {
    if (!_timer.isActive)
      _startTimer();
    else
      _endTimer();
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timerText =
            '${(_timer.tick ~/ 60).toString().padLeft(2, '0')}:${(_timer.tick % 60).toString().padLeft(2, '0')}';
      });
    });
  }

  _endTimer() {
    _timer.cancel();
    // _timerText = '00:00';
  }

  @override
  void dispose() {
    soundRecorder.dispose();
    soundPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('Module 7 - Audio Recorder'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildUpCounter(),
            const SizedBox(height: 20),
            buildRecordButton(),
            const SizedBox(height: 20),
            buildPlayButton(),
            const SizedBox(height: 20),
            showFileSize(),
          ],
        ),
      ),
    );
  }

  Widget showFileSize() {
    return Text("File size: $fileSize");
  }

  Widget buildUpCounter() {
    final isRecording = soundRecorder.isRecording;
    final icon = isRecording ? Icons.stop : Icons.mic;
    final text = _timerText;
    final subText = isRecording ? 'Press Stop' : 'Press Start';
    return CircleAvatar(
        radius: 100,
        backgroundColor: Colors.white,
        child: CircleAvatar(
            radius: 90,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Colors.white),
                const SizedBox(height: 10),
                Text(text,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(subText,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ))));
  }

  ElevatedButton buildRecordButton() {
    final isRecording = soundRecorder.isRecording;
    final icon = isRecording ? Icons.stop : Icons.mic;
    final text = isRecording ? 'STOP' : 'START';
    final primary = isRecording ? Colors.red : Colors.white;
    final onPrimary = isRecording ? Colors.white : Colors.black;
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(175, 50),
          primary: primary,
          onPrimary: onPrimary,
        ),
        onPressed: soundPlayer.isPlaying
            ? null
            : () async {
                await soundRecorder.toggleRecording();
                File file = File(await FilePath.pathToSaveAudio);
                if (file.existsSync()) {
                  double ff = file.lengthSync() / 1024;
                  fileSize = ff.toStringAsFixed(2) + " MB";
                  log('File size: $fileSize');
                }
                setState(() {});
                timerToggle();
              },
        icon: Icon(icon),
        label: Text(text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
  }

  ElevatedButton buildPlayButton() {
    final isPlaying = soundPlayer.isPlaying;
    final icon = isPlaying ? Icons.stop : Icons.play_arrow;
    final text = isPlaying ? 'STOP PLAYING' : 'START PLAYING';
    final primary = isPlaying ? Colors.red : Colors.white;
    final onPrimary = isPlaying ? Colors.white : Colors.black;
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(175, 50),
          primary: primary,
          onPrimary: onPrimary,
        ),
        onPressed: soundRecorder.isRecording
            ? null
            : () async {
                // final isRecording = soundRecorder.toggleRecording();
                await soundPlayer.togglePlaying(whenFinished: () {
                  setState(() {});
                });
                File file = File(await FilePath.pathToSaveAudio);
                if (file.existsSync())
                  log("File pathing: " + file.path);
                else
                  log("File not found");
                setState(() {});
              },
        icon: Icon(icon),
        label: Text(text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
  }
}
