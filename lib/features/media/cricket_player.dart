import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class CricketPlayer extends StatefulWidget {
  @override
  _CricketPlayerState createState() => _CricketPlayerState();
}

class _CricketPlayerState extends State<CricketPlayer> {
  BetterPlayerController? _betterPlayerController;
  @override
  void initState() {
    super.initState();
    var betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      cacheConfiguration: const BetterPlayerCacheConfiguration(
        useCache: true,
        maxCacheSize: 1000 * 1024 * 1024,
        maxCacheFileSize: 1000 * 1024 * 1024,
      ),
    );
    _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
          controlsConfiguration: BetterPlayerControlsConfiguration(
            enableFullscreen: false,
            enableOverflowMenu: false,
          ),
          autoDetectFullscreenDeviceOrientation: false,
          autoDispose: false,
        ),
        betterPlayerDataSource: betterPlayerDataSource);
    // ignore: cascade_invocations
    _betterPlayerController!.setVolume(1.0);
  }

  @override
  void dispose() {
    _betterPlayerController!.dispose(forceDispose: true);
    super.dispose();
  }

  @override
  // ignore: override_on_non_overriding_member
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(
        controller: _betterPlayerController!,
      ),
    );
  }
}
