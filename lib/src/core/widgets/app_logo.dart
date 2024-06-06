import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      // child: Image.asset(
      //   'assets/images/logo.png',
      //   fit: BoxFit.cover,
      // ),
      child: const FlutterLogo(),
    );
  }
}
