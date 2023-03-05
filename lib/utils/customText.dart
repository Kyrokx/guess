import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customText extends Text {
  customText(String data,
      {color: Colors.black,
      textAlign = TextAlign.center,
      fontSize = 15.0,
      fontStyle = FontStyle.normal})
      : super(
          data = data,
          textAlign: textAlign,
          style: new TextStyle(
              color: color,
              fontStyle: fontStyle,
              fontSize: fontSize,
              fontFamily: GoogleFonts.quicksand().fontFamily),
        );
}
