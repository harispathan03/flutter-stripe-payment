import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  const RegularText(
      {Key? key,
      required this.text,
      this.size,
      this.color,
      this.overflow,
      this.maxLines,
      this.align,
      this.style})
      : super(key: key);
  final String text;
  final double? size;
  final Color? color;
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
          Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontSize: size, color: color, overflow: overflow),
    );
  }
}
