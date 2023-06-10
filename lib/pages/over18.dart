import 'package:flutter/material.dart';
import 'package:insight_of_you_app/gen/assets.gen.dart';
import 'package:insight_of_you_app/generated/app_localizations.dart';
import 'package:video_player/video_player.dart';

typedef OnBoolPressed = Function(bool val);

const _shadowsArr = [
  Shadow( // bottomLeft
      offset: Offset(-1.5, -1.5),
      color: Colors.black
  ),
  Shadow( // bottomRight
      offset: Offset(1.5, -1.5),
      color: Colors.black
  ),
  Shadow( // topRight
      offset: Offset(1.5, 1.5),
      color: Colors.black
  ),
  Shadow( // topLeft
      offset: Offset(-1.5, 1.5),
      color: Colors.black
  ),
];

class Over18Page extends StatefulWidget {
  final OnBoolPressed onBoolPressed;

  const Over18Page({super.key, required this.onBoolPressed});

  @override
  State<Over18Page> createState() => _Over18PageState();
}

class _Over18PageState extends State<Over18Page> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        InsightOfYouAssets.images.prefix18Scene21,
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.setVolume(0);
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black, child: _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(children: [
        VideoPlayer(_controller),
        Center(child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.only(left: 10, right: 10), child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Text(InsightOfYouAppLocalizations.of(context)!.over18_warning, style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.red,
                  shadows: _shadowsArr,
              )),
              const SizedBox(height: 10,),
              Text(InsightOfYouAppLocalizations.of(context)!.over18_question, style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.green,
                shadows: _shadowsArr,
              )),
              const SizedBox(height: 20,),
          ConstrainedBox(constraints: const BoxConstraints(maxWidth: 500), child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20), backgroundColor: const Color(0x50000000), foregroundColor: Theme.of(context).colorScheme.inversePrimary,),
              onPressed: () => widget.onBoolPressed(true), child: Text(
                InsightOfYouAppLocalizations.of(context)!.over18_yes, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
              )),
              const SizedBox(height: 10,),
              ElevatedButton(style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20), backgroundColor: const Color(0x50000000), foregroundColor: Theme.of(context).colorScheme.inversePrimary,),
                  onPressed: () => widget.onBoolPressed(false), child: Text(
                    InsightOfYouAppLocalizations.of(context)!.over18_no, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                  )),
            ],
          )),
              const SizedBox(height: 10,),
            ],
          ),),),),
      ],),
    )
        : Container());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}