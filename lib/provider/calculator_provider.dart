import 'package:calculator_app/calculator_logic/expression_dto.dart';
import 'package:calculator_app/calculator_logic/expression_handler.dart';
import 'package:calculator_app/calculator_logic/input_parser.dart';
import 'package:calculator_app/core/extensions.dart';
import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String _calculationLine = '';
  String _result = '';
  final InputParser _inputParser = InputParser();
  final ExpressionHandler _expressionHandler = ExpressionHandler();

  set calculationLine(String newline) {
    _calculationLine = newline;
    notifyListeners();
  }

  String get result => _result;

  set result(String newResult) {
    _result = newResult;
    notifyListeners();
  }

  String get calculationLine => _calculationLine;

  void onCalculatorItemTap(String character) {
    calculationLine = '$calculationLine$character';
    _calculate();
  }

  void onClearTap() {
    if (calculationLine.isNotEmpty) {
      calculationLine = calculationLine.substring(0, calculationLine.lastIndex);
      if (calculationLine.isEmpty) {
        result = '';
      }
      _calculate();
    }
  }

  void onClearLongTap() {
    calculationLine = '';
    result = '';
  }

  void _calculate() {
    try {
      final ExpressionDto dto = _inputParser.parseLine(calculationLine);
      final double finalValue = _expressionHandler.calculateExpression(dto);
      result = finalValue.toString();
    } catch (_) {
      result = '';
    }
  }
}
