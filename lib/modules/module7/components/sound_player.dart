import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:working_on_technics/modules/module7/components/sound_recorder.dart';

//final pathToReadAudio = "audio_example.aac";

class SoundPlayer {
  FlutterSoundPlayer? _audioPlayer;

  bool get isPlaying => _audioPlayer!.isPlaying;

  Future init() async {
    _audioPlayer = FlutterSoundPlayer();

    await _audioPlayer!.openAudioSession();
  }

  void dispose() {
    _audioPlayer!.closeAudioSession();
    _audioPlayer = null;
  }

  Future _play(VoidCallback whenFinished) async {
    await _audioPlayer!.startPlayer(
      fromURI: await FilePath.pathToSaveAudio,
      // fromURI: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      //  codec: Codec.mp3,
      whenFinished: whenFinished,
    );
  }

  getAudioPath() async {
    return _audioPlayer!.getResourcePath();
  }

  Future _stop() async {
    await _audioPlayer!.stopPlayer();
  }

  Future togglePlaying({required VoidCallback whenFinished}) async {
    if (_audioPlayer!.isStopped) {
      await _play(whenFinished);
    } else {
      await _stop();
    }
  }
}
