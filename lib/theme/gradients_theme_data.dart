import 'package:flutter/material.dart';

class GradientsThemeData {
  final LinearGradient backgroundGradient;
  final LinearGradient numberButtonBackground;
  const GradientsThemeData._({
    required this.backgroundGradient,
    required this.numberButtonBackground,
  });

  factory GradientsThemeData.light() {
    return const GradientsThemeData._(
      backgroundGradient: LinearGradient(
        colors: [
          Color(0xFF92DFF3),
          Color(0xFFB7E9F7),
          Color(0xFFF5FCFF),
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ),
      numberButtonBackground: LinearGradient(
        colors: [
          Color(0x66FFFFFF),
          Color(0x33FFFFFF),
        ],
        end: Alignment.bottomRight,
        begin: Alignment.topLeft,
      ),
    );
  }

  factory GradientsThemeData.dark() {
    return const GradientsThemeData._(
      backgroundGradient: LinearGradient(
        colors: [
          Color(0xFF92DFF3),
          Color(0xFFB7E9F7),
          Color(0xFFF5FCFF),
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ),
      numberButtonBackground: LinearGradient(
        colors: [
          Color(0x99FFFFFF),
          Color(0x66FFFFFF),
        ],
        end: Alignment.bottomRight,
        begin: Alignment.topLeft,
      ),
    );
  }
}
