import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  const MediumText(
      {Key? key,
      required this.text,
      required this.size,
      required this.color,
      this.overflow,
      this.style,
      this.align,
      this.maxLines})
      : super(key: key);
  final String text;
  final double size;
  final Color color;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? align;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      style: style ??
          Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: size,
                color: color,
                overflow: overflow,
              ),
    );
  }
}
