import 'package:flutter/material.dart';

class AppColors {
  // Web Primary: #FF7EB3 (Used for buttons, rings, active states)
  static const primary = Color(0xFFFF7EB3);
  static const primaryForeground = Color(0xFFFFFFFF);
  
  // Web Secondary: #E2D5F8 (Used for soft backgrounds, accents)
  static const secondary = Color(0xFFE2D5F8);
  static const secondaryForeground = Color(0xFF1A1A1A);

  // Web Background: #FFFFFF (Light) / #1A1A1A (Foreground)
  static const background = Color(0xFFFFFFFF);
  static const foreground = Color(0xFF1A1A1A);

  // Structural & Surfaces
  static const card = Color(0xFFFFFFFF);
  static const popover = Color(0xFFFFFFFF);
  static const border = Color(0xFFEEE0E4);
  static const input = Color(0xFFEEE0E4);
  
  // Text & Muted states
  static const muted = Color(0xFFF9FAFB); // From action/accent
  static const mutedForeground = Color(0xFF666666);
  
  // Web Destructive
  static const destructive = Color(0xFFE53E3E); 
  static const destructiveForeground = Color(0xFFFFFFFF); 
  
  // Healthcare Specific Semantics (Mobile extensions that fit the soft palette)
  static const safeGreen = Color(0xFF38A169);   // Verified
  static const warningAmber = Color(0xFFF6AD55); // Low stock
}
