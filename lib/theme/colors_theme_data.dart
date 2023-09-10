import 'package:flutter/material.dart';

class ColorsThemeData {
  final Color buttonBorder;
  final Color operationButtonBorder;
  final Color number;
  final Color operation;
  final Color calculation;
  final Color calculationOperation;
  final Color result;
  const ColorsThemeData._({
    required this.buttonBorder,
    required this.number,
    required this.operationButtonBorder,
    required this.operation,
    required this.calculation,
    required this.calculationOperation,
    required this.result,
  });

  factory ColorsThemeData.light() {
    return const ColorsThemeData._(
      buttonBorder: Color(0xFFFFFFFF),
      number: Color(0xFFFFFFFF),
      operationButtonBorder: Color(0xB3FFFFFF),
      operation: Color.fromRGBO(0, 50, 84, 0.3),
      calculation: Color(0xFF818181),
      calculationOperation: Color(0xFF109DFF),
      result: Color(0xFF424242),
    );
  }

  factory ColorsThemeData.dark() {
    return const ColorsThemeData._(
      buttonBorder: Color(0xFFFFFFFF),
      number: Color(0xFFFFFFFF),
      operationButtonBorder: Color(0x63FFFFFF),
      operation: Color.fromRGBO(0, 50, 84, 0.3),
      calculation: Color(0xFF818181),
      calculationOperation: Color(0xFF109DFF),
      result: Color(0xFF424242),
    );
  }
}
