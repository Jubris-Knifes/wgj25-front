import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioInitial());

  final AudioPlayer _backgroundPlayer = AudioPlayer();

  void playBackgroundMusic() {
    _backgroundPlayer
      ..setReleaseMode(ReleaseMode.loop)
      ..play(AssetSource('audio/background_music.wav'));
  }
}
