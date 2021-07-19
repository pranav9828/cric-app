import 'package:cric_app/features/media/cricket_player.dart';
import 'package:cric_app/features/media/media_model.dart';
import 'package:cric_app/features/media/media_service.dart';
import 'package:cric_app/utils.dart';
import 'package:cric_app/widgets/show_loader.dart';
import 'package:flutter/material.dart';

class MediaFragment extends StatefulWidget {
  @override
  _MediaFragmentState createState() => _MediaFragmentState();
}

class _MediaFragmentState extends State<MediaFragment> {
  MediaService mediaService = MediaService();
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    mediaService.getVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: StreamBuilder<List<MediaModel>>(
        stream: mediaService.list,
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return showLoader();
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: text(
                'No Videos found. Come back Later',
                Colors.white,
                FontWeight.bold,
                16,
              ),
            );
          } else {
            return PageView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return CricketPlayer();
              },
            );
          }
        },
      ),
    );
  }
}
