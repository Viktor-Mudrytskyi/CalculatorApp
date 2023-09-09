import 'package:flutter/material.dart';

class GradientsThemeData {
  final Gradient backgroundGradient;
  final Gradient numberButtonBackground;
  final Gradient operationButton;
  const GradientsThemeData._({
    required this.backgroundGradient,
    required this.numberButtonBackground,
    required this.operationButton,
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
      operationButton: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFFADD8FF),
          Color.fromRGBO(173, 216, 255, 0.28),
        ],
        stops: [0.0899, 1.1142],
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
      operationButton: RadialGradient(
        colors: [
          Color(0xE6ADD8FF),
          Color.fromRGBO(173, 216, 255, .28),
        ],
      ),
    );
  }
}
