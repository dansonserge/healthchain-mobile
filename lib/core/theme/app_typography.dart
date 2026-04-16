import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // We use Outfit for everything to match the web's layout.tsx implementation
  static final displayLarge = GoogleFonts.outfit(
    fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: -0.5,
  );
  static final titleLarge = GoogleFonts.outfit(
    fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: -0.2,
  );
  static final bodyLarge = GoogleFonts.outfit(
    fontSize: 16, fontWeight: FontWeight.w400, height: 1.5,
  );
  static final bodyMedium = GoogleFonts.outfit(
    fontSize: 14, fontWeight: FontWeight.w400, height: 1.5,
  );
  static final labelSmall = GoogleFonts.outfit(
    fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.8,
  );
  
  static final monoMedium = GoogleFonts.outfit( // Using Outfit here since JetbrainsMono wasn't in pubspec
    fontSize: 13, fontWeight: FontWeight.w500, 
  );
}
