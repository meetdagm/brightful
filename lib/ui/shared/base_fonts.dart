


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseFonts {

  // static TextStyle Function() style = GoogleFonts.lato;

  static TextStyle extraLargeTitle({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.w800, fontSize: 55);
  }

  static TextStyle largeTitle({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.bold, fontSize: 34);
  }

  static TextStyle title1({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.bold, fontSize: 28);
  }

  static TextStyle title2({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.bold, fontSize: 22);
  }

  static TextStyle title3({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.w600, fontSize: 20, );
  }

  static TextStyle headline({Color color = Colors.black, double fontSize: 18}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.w600, fontSize: fontSize);
  }

  static TextStyle headline2({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.w500, fontSize: 17);
  }

  static TextStyle headline3({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.w500, fontSize: 16);
  }

  static TextStyle body({Color color = Colors.black, double fontSize: 16}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.normal, fontSize: fontSize);
  }

  static TextStyle subHead({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.normal, fontSize: 14);
  }

  static TextStyle footNote({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.w500, fontSize: 13);
  }

  static TextStyle caption({Color color = Colors.black}) {
    return GoogleFonts.dmSans(color: color, fontWeight: FontWeight.w500, fontSize: 11);
  }

}