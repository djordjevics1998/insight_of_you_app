import 'dart:html';

import 'package:flutter/material.dart';
import 'package:insight_of_you_app/gen/assets.gen.dart';
import 'package:insight_of_you_app/generated/app_localizations.dart';
import 'package:video_player/video_player.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  late final List<VideoPlayerController> _controllers;
  late final List<AssetGenImage> displayIcons, displayFocusIcons;
  late int displayInd;

  @override
  void initState() {
    super.initState();
    final displayPaths = [
      InsightOfYouAssets.images.mm1,
      InsightOfYouAssets.images.mm2,
      InsightOfYouAssets.images.mm3,
      InsightOfYouAssets.images.mm4,
      InsightOfYouAssets.images.mm5,
      InsightOfYouAssets.images.mm6,
      InsightOfYouAssets.images.mm7,
      InsightOfYouAssets.images.mm8,
      InsightOfYouAssets.images.mm9,
      InsightOfYouAssets.images.mm10,
      InsightOfYouAssets.images.mm11,
      InsightOfYouAssets.images.mm12,
      InsightOfYouAssets.images.mm13,
    ].reversed.toList(growable: false);
    displayIcons = [
      InsightOfYouAssets.images.ch1Mm1,
      InsightOfYouAssets.images.ch2Mm1,
      InsightOfYouAssets.images.ch3Mm1,
      InsightOfYouAssets.images.ch4Mm1,
      InsightOfYouAssets.images.ch5Mm1,
      InsightOfYouAssets.images.ch6Mm1,
      InsightOfYouAssets.images.ch7Mm1,
      InsightOfYouAssets.images.ch8Mm1,
      InsightOfYouAssets.images.ch9Mm1,
      InsightOfYouAssets.images.ch10Mm1,
      InsightOfYouAssets.images.ch11Mm1,
      InsightOfYouAssets.images.ch12Mm1,
      InsightOfYouAssets.images.ch13Mm1,
    ];
    displayFocusIcons = [
      InsightOfYouAssets.images.ch1Mm2,
      InsightOfYouAssets.images.ch2Mm2,
      InsightOfYouAssets.images.ch3Mm2,
      InsightOfYouAssets.images.ch4Mm2,
      InsightOfYouAssets.images.ch5Mm2,
      InsightOfYouAssets.images.ch6Mm2,
      InsightOfYouAssets.images.ch7Mm2,
      InsightOfYouAssets.images.ch8Mm2,
      InsightOfYouAssets.images.ch9Mm2,
      InsightOfYouAssets.images.ch10Mm2,
      InsightOfYouAssets.images.ch11Mm2,
      InsightOfYouAssets.images.ch12Mm2,
      InsightOfYouAssets.images.ch13Mm2,
    ];
    displayInd = 0;
    _controllers = List<VideoPlayerController>.empty(growable: true);
    int l = 0;
    for (var displayPath in displayPaths) {
      final ind = l;
      _controllers.add(VideoPlayerController.asset(
        displayPath,
      ));
      if (ind == displayInd) {
        _controllers[displayInd].initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          //_controller.setVolume(0);
          if (displayInd == ind) {
            _controllers[displayInd].setLooping(true);
            _controllers[displayInd].play();
            setState(() {});
          }
        });
      }
      l++;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controllers[displayInd];
    return Center(
        child: AspectRatio(
      aspectRatio:
          !controller.value.isInitialized || controller.value.aspectRatio <= 1.0
              ? 16.0 / 9.0
              : controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(controller),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Container(
                  color: const Color(0x80000000),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 250),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          bottom: 10,
                                          right: 10),
                                      child: Align(alignment: Alignment.centerLeft, child: Text(
                                        InsightOfYouAppLocalizations.of(
                                            context)!
                                            .start,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(color: Colors.white),
                                      ))),),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          bottom: 10,
                                          right: 10),
                                      child: Align(alignment: Alignment.centerLeft, child: Text(
                                        InsightOfYouAppLocalizations.of(
                                                context)!
                                            .load,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(color: Colors.white),
                                      ))),),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                onPressed: () {
                                  document.fullscreenElement != null
                                      ? document.exitFullscreen()
                                      : document.documentElement!
                                      .requestFullscreen();
                                },
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                        bottom: 10,
                                        right: 10),
                                    child: Align(alignment: Alignment.centerLeft, child: Text(
                                      InsightOfYouAppLocalizations.of(
                                          context)!
                                          .fullscreen,
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(color: Colors.white),
                                    ))),),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InsightOfYouAssets.images.insight1.image(),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Align(alignment: Alignment.bottomLeft, child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: SingleChildScrollView(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              runSpacing: 10,
                              verticalDirection: VerticalDirection.up,
                              children: displayIcons
                                  .map<Material>((e) => Material(
                                      child: InkWell(
                                          onTap: () {
                                            final ind = displayIcons.length -
                                                1 -
                                                displayIcons.indexWhere(
                                                    (element) => element == e);
                                            if (displayInd == ind) return;
                                            setState(() {
                                              if (_controllers[displayInd]
                                                  .value
                                                  .isInitialized)
                                                _controllers[displayInd]
                                                    .pause();
                                              displayInd = ind;
                                              if (_controllers[displayInd]
                                                  .value
                                                  .isInitialized) {
                                                _controllers[displayInd]
                                                    .setLooping(true);
                                                _controllers[displayInd].play();
                                              } else {
                                                _controllers[displayInd]
                                                    .initialize()
                                                    .then((_) {
                                                  // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                                                  //_controller.setVolume(0);
                                                  if (displayInd == ind) {
                                                    _controllers[displayInd]
                                                        .setLooping(true);
                                                    _controllers[displayInd]
                                                        .play();
                                                    setState(() {});
                                                  }
                                                });
                                              }
                                            });
                                          },
                                          child: e.image())))
                                  .toList(growable: false),
                            ),),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ])),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
