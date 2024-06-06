import 'package:flutter/material.dart';

class ExtraLightText extends StatelessWidget {
  const ExtraLightText(
      {Key? key,
      required this.text,
      required this.size,
      required this.color,
      this.overflow,
      this.maxLines,
      this.align,
      this.style})
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
      maxLines: maxLines,
      textAlign: align,
      style: style ??
          Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: size, color: color, overflow: overflow),
    );
  }
}
