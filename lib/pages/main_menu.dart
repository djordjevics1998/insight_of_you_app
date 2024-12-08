import 'dart:html';

import 'package:flutter/material.dart';
import 'package:insight_of_you_app/gen/assets.gen.dart';
import 'package:insight_of_you_app/generated/app_localizations.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  late final List<VideoController> _controllers;
  late final List<AssetGenImage> displayIcons, displayFocusIcons;
  late int displayInd;
  double _aspectRatio = 1;
  double get aspectRatio => _aspectRatio;
  set aspectRatio(double val) {
    if(val != _aspectRatio) {
      setState(() {
        _aspectRatio = val;
      });
    }
  }

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
    _controllers = List<VideoController>.empty(growable: true);
    int l = 0;
    for (var displayPath in displayPaths) {
      final ind = l;
      final player = Player();
      player.stream.width.listen((v) {
        if(ind != displayInd) return;
        aspectRatio = (player.state.width ?? 1) / (player.state.height ?? 1);
      });
      player.open(Media('asset://$displayPath',), play: false);
      _controllers.add(VideoController(player, ));
      if (ind == displayInd) {
        //_controllers[displayInd].
        _controllers[displayInd].player.setPlaylistMode(PlaylistMode.loop);
        _controllers[displayInd].player.play();
      }
      l++;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controllers[displayInd];

    return Center(
      child: AspectRatio(aspectRatio: aspectRatio, child: Stack(
        children: [
          Video(controller: controller, controls: NoVideoControls, ),
      Positioned(top: 0,
        left: 0,
        right: 0,
        bottom: 0, child: Row(
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
                                                  .player
                                                  .state.playing)
                                                _controllers[displayInd]
                                                    .player.pause();
                                              displayInd = ind;
                                              setState(() {
                                                _controllers[displayInd]
                                                    .player.setPlaylistMode(PlaylistMode.loop);
                                                _controllers[displayInd].player.play();
                                              });
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
          ),),
        ],
      ),),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.player.dispose();
    }
    super.dispose();
  }
}
