import 'package:flutter/material.dart';
//import 'package:video_example/widget/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class AsserPlayerWidget extends StatefulWidget {
  @override
  _AssetPlayerWidgetState createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AsserPlayerWidget> {
  final asset = 'assets/Tug_of_war_with_a_Monster.mp4';

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _controller != null && _controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : const SizedBox(
            height: 250,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => VideoPlayer(_controller);
}
