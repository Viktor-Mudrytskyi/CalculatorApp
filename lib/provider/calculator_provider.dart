import 'package:calculator_app/calculator_logic/expression_dto.dart';
import 'package:calculator_app/calculator_logic/expression_handler.dart';
import 'package:calculator_app/calculator_logic/input_parser.dart';
import 'package:calculator_app/calculator_logic/operations/operations.dart';
import 'package:calculator_app/core/extensions.dart';
import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String _calculationLine = '';
  String _result = '';
  final InputParser _inputParser = InputParser();
  final ExpressionHandler _expressionHandler = ExpressionHandler();

  final List<String> _allOperations = [
    AddOperation().symbol,
    SubOperation().symbol,
    MulOperation().symbol,
    DivOperation().symbol,
    ModOperation().symbol,
  ];

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
    final subSymbol = SubOperation().symbol;

    // Makes sure first symbol, if operation, can only be sub
    if (calculationLine.isEmpty && _allOperations.contains(character)) {
      if (character == subSymbol) {
        calculationLine = '$calculationLine$character';
        return;
      } else {
        return;
      }
    }

    // Checks if last symbol is operation and new symbol is operation
    if (calculationLine.isNotEmpty &&
        _allOperations.contains(calculationLine.last) &&
        _allOperations.contains(character)) {
      // If last is not sub and new is sub then do nothing
      if (!(calculationLine.last != subSymbol && character == subSymbol)) {
        if (calculationLine.length < 2) {
          return;
          //If two last are operation and new is not sub remove two last
        } else if (character != subSymbol &&
            _allOperations.contains(calculationLine.last) &&
            _allOperations.contains(calculationLine.oneBeforeLast)) {
          calculationLine =
              calculationLine.substring(0, calculationLine.lastIndex - 1);
          //If two last are operation and new is sub remove last
        } else {
          calculationLine =
              calculationLine.substring(0, calculationLine.lastIndex);
        }
      }
    }

    // Adds new value to the old
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
