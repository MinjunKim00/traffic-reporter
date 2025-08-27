import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'NotoSansKR',
    scaffoldBackgroundColor: const Color(0xFFF3F4F6),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1E3A8A),
      secondary: Color(0xFF10B981),
      background: Color(0xFFF3F4F6),
      error: Color(0xFFDC2626),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E3A8A),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size.fromHeight(48),
        backgroundColor: Color(0xFF10B981),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF1E3A8A),
      contentTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
