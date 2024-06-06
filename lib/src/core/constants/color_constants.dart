import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFDD8D4);
const Color white = Colors.white;
const Color black = Colors.black;
const Color red = Color(0xFFF51800);
const Color lightestGrey = Color(0xFFE8E8E8);
// const Color grey2 = Color(0xFFD1D1D1);
const Color lightGrey = Color(0xFFAEAEAE);
// const Color grey2 = Color(0xFF727272);
const Color darkGrey = Color(0xFF4A4A4A);
const Color blueShadeClr = Color(0xFF2F4858);
const Color transparent = Colors.transparent;
const Color lightBlack = Color(0xFF363636);

const Color shimmerColor1 = Color(0xFFEBEBF4);
const Color shimmerColor2 = Color(0xFFF4F4F4);
const Color shimmerColor3 = Color(0xFFEBEBF4);

const Color brightTurquoiseBackgroundColor =
    Color(0xFF0FCEF4); //fromRGBO(15, 206, 244, 1)
const Color brightTurquoiseTextColor =
    Color(0xFF1ED4EB); //fromRGBO(30, 212, 235, 1)

const shimmerGradient = LinearGradient(
  colors: [
    shimmerColor1,
    shimmerColor2,
    shimmerColor3,
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
