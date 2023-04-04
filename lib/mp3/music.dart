import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class MusicSlider extends StatelessWidget {
  final Stream<Duration> musicStream;
  final Stream<Playing?> audioDuration;
  const MusicSlider(
      {required this.musicStream, required this.audioDuration, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
            stream: audioDuration,
            initialData: null,
            builder: (context, audioDuration) => StreamBuilder<Duration>(
              initialData: Duration.zero,
              stream: musicStream,
              builder: (context, snapshot) => LinearProgressIndicator(
                value: (snapshot.data?.inSeconds.toDouble() ?? 0) /
                    (audioDuration.data?.audio.duration.inSeconds ?? 1),
              ),
            ),
          ),
    ),
  );
}
