import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerTest extends StatefulWidget {
  const VideoPlayerTest({super.key});

  @override
  State<VideoPlayerTest> createState() => _VideoPlayerTestState();
}

class _VideoPlayerTestState extends State<VideoPlayerTest> {



     VideoPlayerController? videoPlayerController;
   ChewieController? chewieController;
  @override
  initState()  {
initializePlayer('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    super.initState();
  }

   initializePlayer(url) async {
    videoPlayerController =
        VideoPlayerController.network(url);

    await Future.wait([
      videoPlayerController!.initialize(),
      // _videoPlayerController2.initialize()
    ]);
 chewieController = ChewieController(
  videoPlayerController: videoPlayerController!,
  autoPlay: true,
  looping: true,
);

final playerWidget = Chewie(
  controller: chewieController!,
);
    setState(() {});
  }


  @override
void dispose() {
  videoPlayerController!.dispose();
  chewieController!.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Stack(
        alignment: Alignment.center,
        children: [
 chewieController!=null&&chewieController!.videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: videoPlayerController!.value.aspectRatio,
                  child: Chewie(controller: chewieController!)):Center(child: Text("Video found"),),
                  
        ],
      )
   
              
    );
  }
}