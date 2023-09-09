import 'package:flutter/material.dart';

class ColorsThemeData {
  final Color buttonBorderColor;
  final Color operationButtonBorderColor;
  final Color numberColor;
  final Color operationColor;
  const ColorsThemeData._({
    required this.buttonBorderColor,
    required this.numberColor,
    required this.operationButtonBorderColor,
    required this.operationColor,
  });

  factory ColorsThemeData.light() {
    return const ColorsThemeData._(
      buttonBorderColor: Color(0xFFFFFFFF),
      numberColor: Color(0xFFFFFFFF),
      operationButtonBorderColor: Color(0xB3FFFFFF),
      operationColor: Color.fromRGBO(0, 50, 84, 0.3),
    );
  }

  factory ColorsThemeData.dark() {
    return const ColorsThemeData._(
      buttonBorderColor: Color(0xFFFFFFFF),
      numberColor: Color(0xFFFFFFFF),
      operationButtonBorderColor: Color(0x63FFFFFF),
      operationColor: Color.fromRGBO(0, 50, 84, 0.3),
    );
  }
}
