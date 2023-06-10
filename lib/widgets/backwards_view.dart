import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef OnBackPressed = Future<bool> Function(BuildContext context);

class BackwardsView extends StatelessWidget {
  final OnBackPressed onBackPressed;
  final Widget child;

  const BackwardsView(
      {super.key, required this.onBackPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return kIsWeb || (!Platform.isAndroid && !Platform.isIOS)
        ? child
        : (Platform.isAndroid
            ? _AndroidBackButton(onBackPressed: onBackPressed, child: child)
            : GestureDetector(
                onHorizontalDragUpdate: (details) async {
                  //set the sensitivity for your ios gesture anywhere between 10-50 is good

                  int sensitivity = 25; // Integers().iosSwipeSensitivity;

                  if (details.delta.dx > sensitivity) {
                    // SWIPE FROM RIGHT DETECTION
                    await onBackPressed.call(context);
                  }
                },
                child: child));
  }
}

class _AndroidBackButton extends StatefulWidget {
  final OnBackPressed onBackPressed;
  final Widget child;

  const _AndroidBackButton({required this.onBackPressed, required this.child});

  @override
  State<_AndroidBackButton> createState() => _AndroidBackButtonState();
}

class _AndroidBackButtonState extends State<_AndroidBackButton> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(interceptBackButton, context: context);
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    BackButtonInterceptor.remove(interceptBackButton);
    super.dispose();
  }

  // zbog nekog razloga obrnuta je logika od WillPopScope
  Future<bool> interceptBackButton(
          bool stopDefaultButtonEvent, RouteInfo routeInfo) async =>
      routeInfo.ifRouteChanged(context)
          ? true
          : await widget.onBackPressed(context);
}
