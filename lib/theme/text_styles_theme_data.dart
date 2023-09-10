import 'package:flutter/material.dart';

class TextStylesThemeData {
  final TextStyle number;
  final TextStyle calculation;
  final TextStyle result;
  const TextStylesThemeData._({
    required this.number,
    required this.calculation,
    required this.result,
  });
  static const _family = 'Poppins';

  factory TextStylesThemeData.light() {
    return const TextStylesThemeData._(
      number: TextStyle(
        fontFamily: _family,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      calculation: TextStyle(
        fontFamily: _family,
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      result: TextStyle(
        fontFamily: _family,
        fontSize: 48,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  factory TextStylesThemeData.dark() {
    return const TextStylesThemeData._(
      number: TextStyle(
        fontFamily: _family,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      calculation: TextStyle(
        fontFamily: _family,
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      result: TextStyle(
        fontFamily: _family,
        fontSize: 48,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
