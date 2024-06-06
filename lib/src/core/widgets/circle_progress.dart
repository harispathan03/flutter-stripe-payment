import 'package:flutter/material.dart';

class CircleProgress extends StatelessWidget {
  const CircleProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.center, child: CircularProgressIndicator()),
    );
  }
}
