import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final String? text;

  const LoadingView({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Opacity(
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.only(left: 5, right: 5), child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5,),
              const CircularProgressIndicator(),
              if(text != null) ...[
                const SizedBox(height: 5,),
                Text(text!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white),),
              ],
              const SizedBox(height: 5,),
            ],
          ),
        ),),),
      ],
    );
  }
}
