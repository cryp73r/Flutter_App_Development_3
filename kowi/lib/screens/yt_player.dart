import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTPlayer extends StatefulWidget {
  const YTPlayer({Key? key}) : super(key: key);

  @override
  _YTPlayerState createState() => _YTPlayerState();
}

class _YTPlayerState extends State<YTPlayer> {
  late YoutubePlayerController _ytController;
  bool muted = true;

  @override
  void initState() {
    _ytController = YoutubePlayerController(
      initialVideoId: "CTcoCHKnkT8",
      flags: const YoutubePlayerFlags(
        hideControls: false,
        controlsVisibleAtStart: true,
        autoPlay: true,
        mute: true,
        loop: true,
        useHybridComposition: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("YouTube Video Player"),),
      body: YoutubePlayer(
        controller: _ytController,
        showVideoProgressIndicator: true,
        bottomActions: [
          if (muted) IconButton(onPressed: () {
            _ytController.unMute();
            muted = false;
            setState(() {});
          }, icon: const Icon(Icons.volume_off))
          else IconButton(
              onPressed: () {
                _ytController.mute();
                muted = true;
                setState(() {});
              },
              icon: const Icon(Icons.volume_up))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }
}
