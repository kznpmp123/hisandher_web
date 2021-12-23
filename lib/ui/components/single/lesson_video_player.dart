// import 'package:better_player/better_player.dart';
import 'dart:io';

// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:kzn/data/models/lesson.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:starlight_video_player/starlight_video_player.dart';
import 'package:video_player/video_player.dart';

class LessonVideoPlayer extends StatefulWidget {
  @override
  _LessonVideoPlayerState createState() => _LessonVideoPlayerState();
}

class _LessonVideoPlayerState extends State<LessonVideoPlayer> {
  // BetterPlayerController _betterPlayerController;

  // VideoPlayerController _controller;
  // Future<void> _initializeVideoPlayerFuture;

  // ChewieController chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _betterPlayerController = BetterPlayerController(
    //     BetterPlayerConfiguration(
    //       autoPlay: true,
    //       looping: true,
    //       fullScreenByDefault: false,
    //     )
    // );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _betterPlayerController.dispose();

    // _controller.dispose();
    // chewieController.dispose();
    super.dispose();
  }

  // Widget _newVideoPlayer() {
  //   return FutureBuilder(
  //     future: _initializeVideoPlayerFuture,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         // If the VideoPlayerController has finished initialization, use
  //         // the data it provides to limit the aspect ratio of the video.
  //         chewieController = ChewieController(
  //           videoPlayerController: _controller,
  //           autoPlay: true,
  //           looping: true,
  //         );
  //         return Chewie(
  //           controller: chewieController,
  //         );
  //         /*
  //         return AspectRatio(
  //           aspectRatio: _controller.value.aspectRatio,
  //           // Use the VideoPlayer widget to display the video.
  //           child: VideoPlayer(_controller),
  //         );

  //          */
  //       } else {
  //         // If the VideoPlayerController is still initializing, show a
  //         // loading spinner.
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _videoPlayerFuture(),
    );
  }

  Widget _videoPlayerFuture() {
    return FutureBuilder(
        future: Provider.of<CourseProvider>(context, listen: true).lesson,
        builder: (BuildContext context, AsyncSnapshot<Lesson> snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: Text('no lesson')),
              );
            } else {
              print("video url is ${snapshot.data.videoUrl}");
              // BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
              //     BetterPlayerDataSourceType.network,
              //     snapshot.data.videoUrl
              // );
              // _betterPlayerController.setupDataSource(betterPlayerDataSource);
              // return  _videoPlayer();

              // snapshot.data.videoUrl
              // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
              ///ToDo
              // _controller = VideoPlayerController.network(
              //   snapshot.data.videoUrl,
              // );

              // Initialize the controller and store the Future for later use.

              // _initializeVideoPlayerFuture = _controller.initialize();
              // Use the controller to loop the video.
              //_controller.setLooping(true);
              //_controller.play();
              // return _newVideoPlayer();
              /*
              final videoPlayerController = VideoPlayerController.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
              // await videoPlayerController.initialize();
              //return _newVideoPlayer();
              // return _chewPlayer(chewieController);
               */

              /**
               * From internet
               */
              ///`StarlightVideoPlayer.netowrk`
              ///[StarlightNetworkController]
              return StarlightVideoPlayer.network(
                key: ValueKey(snapshot.data.videoUrl),
                autoPlay: true,
                controller: StarlightNetworkController(
                  url: snapshot.data.videoUrl,
                ),
              );
              /**
               * From file
               */
              ///`StarlightVideoPlayer.file`
              ///[StarlightFileController]
              return StarlightVideoPlayer.file(
                controller: StarlightFileController(
                  file: File("filepath"),
                ),
              );
              /**
               * From assests
               */
              ///`StarlightVideoPlayer.assets`
              ///[StarlightAssetsController]
              return StarlightVideoPlayer.assets(
                controller: StarlightAssetsController(
                  path: 'file path',
                ),
              );
              /**
               * From uri
               */
              ///`StarlightVideoPlayer.uri`
              ///[StarlightUriController]
              return StarlightVideoPlayer.uri(
                controller: StarlightUriController(
                  uri: Uri.parse('file path'),
                ),
              );
            }
          } else if (snapshot.hasError) {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('error ${snapshot.error.toString()}')),
            );
          } else {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('loading lesson...')),
            );
          }
        });
  }

  Widget _videoPlayer() {
    return Container(
        //aspectRatio: 16 / 9,
        //height: MediaQuery.of(context).size.height,
        // child: BetterPlayer(
        //   controller: _betterPlayerController,
        // ),
        );
  }
}


//New Video Player
// class VideoApp extends StatefulWidget {
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//   VideoPlayerController _controller;
//   Duration videoLength;
//   Duration videoPosition;
//   double volume = 0.5;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')
//       ..addListener(() => setState(() {
//         videoPosition = _controller.value.position;
//       }))
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {
//           videoLength = _controller.value.duration;
//         });
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               if (_controller.value.initialized) ...[
//                 AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 ),
//                 VideoProgressIndicator(
//                   _controller,
//                   allowScrubbing: true,
//                   padding: EdgeInsets.all(10),
//                 ),
//                 Row(
//                   children: <Widget>[
//                     IconButton(
//                       icon: Icon(
//                         _controller.value.isPlaying
//                             ? Icons.pause
//                             : Icons.play_arrow,
//                       ),
//                       onPressed: () => setState(
//                             () {
//                           _controller.value.isPlaying
//                               ? _controller.pause()
//                               : _controller.play();
//                         },
//                       ),
//                     ),
//                     Text(
//                         '${convertToMinutesSeconds(videoPosition)} / ${convertToMinutesSeconds(videoLength)}'),
//                     SizedBox(width: 10),
//                     Icon(animatedVolumeIcon(volume)),
//                     Slider(
//                         value: volume,
//                         min: 0,
//                         max: 1,
//                         onChanged: (changedVolume) {
//                           setState(() {
//                             volume = changedVolume;
//                             _controller.setVolume(changedVolume);
//                           });
//                         }),
//                     Spacer(),
//                     IconButton(
//                         icon: Icon(Icons.loop,
//                             color: _controller.value.isLooping
//                                 ? Colors.green
//                                 : Colors.black),
//                         onPressed: () {
//                           _controller.setLooping(!_controller.value.isLooping);
//                         })
//                   ],
//                 )
//               ]
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
//
// String convertToMinutesSeconds(Duration duration) {
//   final parsedMinutes = duration.inMinutes % 60;
//
//   final minutes =
//   parsedMinutes < 10 ? '0$parsedMinutes' : parsedMinutes.toString();
//
//   final parsedSeconds = duration.inSeconds % 60;
//
//   final seconds =
//   parsedSeconds < 10 ? '0$parsedSeconds' : parsedSeconds.toString();
//
//   return '$minutes:$seconds';
// }
//
// IconData animatedVolumeIcon(double volume) {
//   if (volume == 0)
//     return Icons.volume_mute;
//   else if (volume < 0.5)
//     return Icons.volume_down;
//   else
//     return Icons.volume_up;
// }
