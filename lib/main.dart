import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:insight_of_you_app/gen/fonts.gen.dart';
import 'package:insight_of_you_app/pages/home.dart';
import 'package:media_kit/media_kit.dart';

import 'generated/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Necessary initialization for package:media_kit.
  MediaKit.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => InsightOfYouAppLocalizations.of(context)!.app_title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000000)),
        useMaterial3: true,
        fontFamily: InsightOfYouFontFamily.openDyslexic3,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        InsightOfYouAppLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: InsightOfYouAppLocalizations.supportedLocales,
      scrollBehavior: AppScrollBehavior(),
      home: const MyHomePage(),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}