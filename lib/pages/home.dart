import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insight_of_you_app/pages/main_menu.dart';
import 'package:insight_of_you_app/pages/over18.dart';
import 'package:insight_of_you_app/generated/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? over18;
  late bool enableAudioVideo;

  @override
  void initState() {
    super.initState();
    enableAudioVideo = !kIsWeb;
  }

  @override
  Widget build(BuildContext context) {
    if (!enableAudioVideo) {
      return Container(
          color: Colors.black,
          child: Center(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                InsightOfYouAppLocalizations.of(context)!
                                    .web_enable_audio_video,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      color: Colors.red,
                                    )),
                            const SizedBox(
                              height: 20,
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 500),
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(20),
                                    foregroundColor: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  onPressed: () => setState(() {
                                        enableAudioVideo = true;
                                      }),
                                  child: Text(
                                    InsightOfYouAppLocalizations.of(context)!
                                        .consent,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.white),
                                  )),
                            )
                          ])))));
    }
    if (over18 == null) {
      return Over18Page(
          onBoolPressed: (val) => setState(() {
                over18 = val;
              }));
    }
    if (!over18!) {
      return Container(
          color: Colors.black,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(InsightOfYouAppLocalizations.of(context)!.not_over_18,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.red,
                    )),
          )));
    }
    return const MainMenuPage();
  }
}
