import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final themes = ThemeData(
  scaffoldBackgroundColor: Colors.grey[300],
  textTheme: TextTheme(
    headline5: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline6: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 14,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 10,
    ),
  ),
);
