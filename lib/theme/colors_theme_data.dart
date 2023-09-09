import 'package:flutter/material.dart';

class ColorsThemeData {
  final Color buttonBorderColor;
  final Color numberColor;
  const ColorsThemeData._({
    required this.buttonBorderColor,
    required this.numberColor,
  });

  factory ColorsThemeData.light() {
    return const ColorsThemeData._(
      buttonBorderColor: Color(0xFFFFFFFF),
      numberColor: Color(0xFFFFFFFF),
    );
  }

  factory ColorsThemeData.dark() {
    return const ColorsThemeData._(
      buttonBorderColor: Color(0xFFFFFFFF),
      numberColor: Color(0xFFFFFFFF),
    );
  }
}
