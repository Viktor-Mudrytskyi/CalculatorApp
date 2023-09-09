import 'package:flutter/material.dart';

class TextStylesThemeData {
  final TextStyle number;
  const TextStylesThemeData._({required this.number});
  static const _family = 'Poppins';

  factory TextStylesThemeData.light() {
    return const TextStylesThemeData._(
      number: TextStyle(
        fontFamily: _family,
        fontSize: 32,
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
    );
  }
}
