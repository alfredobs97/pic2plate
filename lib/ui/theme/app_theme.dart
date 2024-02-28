import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getLight() => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          primary:  Color(0xFFD1ECBC), // Soft sage green
          secondary:  Color(0xFFFCE7C1), // Light peach
          background: Colors.white,
          surface: Colors.white,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onBackground: Colors.black,
          onSurface: Colors.black,
          error:  Color(0xFFF44336),
          onError: Colors.black,
          inversePrimary: Colors.black,
          inverseSurface: Colors.black,
          outline: Colors.black,
          shadow: Colors.black,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.pacifico(
            fontSize: 34.0,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF333333),
          ),
          headlineMedium: GoogleFonts.poppins(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
          ),
          bodyLarge: GoogleFonts.nunito(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF333333),
          ),
          bodyMedium: GoogleFonts.nunito(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF333333),
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 12.0,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF333333),
          ),
        ),
      );

  static ThemeData getDark() => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
  brightness: Brightness.dark,
  primary: const Color(0xFFA9C6B9), // Muted turquoise
  secondary: const Color(0xFFFDD8C7), // Light peach
  background: const Color(0xFF333333), // Dark gray
  surface: const Color(0xFF424242), // Slightly lighter than background
  onPrimary: Colors.white, // White text on primary
  onSecondary: Colors.black, // Black text on secondary
  onBackground: Colors.white, // White text on background
  onSurface: Colors.white, // White text on surface
  error: const Color(0xFFEFDAB2), // Warm beige (for warnings or positive actions)
  onError: Colors.black, // Black text on error
  inversePrimary: Colors.black, // Inverse primary (unused?)
  inverseSurface: Colors.black, // Inverse surface (unused?)
  outline: Colors.white, // Outline: white
  shadow: Colors.black, // Shadow: black
)

,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.pacifico(
            fontSize: 34.0,
            fontWeight: FontWeight.w300,
            color: const Color(0xFFFFFFFF),
          ),
          headlineMedium: GoogleFonts.poppins(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFFFFFFF),
          ),
          bodyLarge: GoogleFonts.nunito(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFFFFFFF),
          ),
          bodyMedium: GoogleFonts.nunito(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFFFFFFF),
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 12.0,
            fontWeight: FontWeight.w300,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      );
}
