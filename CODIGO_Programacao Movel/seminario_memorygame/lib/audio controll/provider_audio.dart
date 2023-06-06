import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class ProviderAudioData extends ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  final String origemAudio = "audio.mp3";
  bool estaReproduzindo = false;

  providerAudioData() {
    audioPlayer = AudioPlayer();
  }

  void reproduzir() {
    if (estaReproduzindo) {
      audioPlayer.resume();
    } else {
      audioPlayer.play(AssetSource(origemAudio));
    }
    estaReproduzindo = true;
    notifyListeners();
  }

  void pausar() {
    audioPlayer.pause();
    estaReproduzindo = false;
    notifyListeners();
  }
}
