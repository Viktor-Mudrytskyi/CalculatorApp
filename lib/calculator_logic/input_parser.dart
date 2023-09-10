import 'package:calculator_app/core/base_operation.dart';
import 'package:calculator_app/core/calculator_exception.dart';
import 'package:calculator_app/calculator_logic/expression_dto.dart';
import 'package:calculator_app/calculator_logic/operations/operations.dart';

class InputParser {
  ExpressionDto parse(String input) {
    int index = -1;
    BaseOperation? operation;
    for (int i = 0; i < input.length; ++i) {
      final BaseOperation? current = parseOperation(input[i]);
      if (current != null) {
        index = i;
      }
    }

    if (index <= 0) {
      throw CalculatorException(text: "index > 0 && operation !=null");
    }

    final List<String> parts = input.split(operation!.symbol);
    if (parts.length != 2) {
      throw CalculatorException(text: "parts.length != 2");
    }

    final double left = double.tryParse(parts[0]) ?? 0.0;
    final double right = double.tryParse(parts[1]) ?? 0.0;

    return ExpressionDto(
      operation: operation,
      left: left,
      right: right,
    );
  }

  BaseOperation? parseOperation(String operation) {
    final BaseOperation? parsedValue = switch (operation) {
      '+' => AddOperation(),
      '-' => SubOperation(),
      '*' => MulOperation(),
      '/' => DivOperation(),
      '%' => ModOperation(),
      _ => null,
    };

    return parsedValue;
  }

  List<String> parseLine(String input) {
    final operationsRegExp = RegExp(r'[+\-*/%]');
    List<String> finalValues = [];
    String tempNumber = '';

    if (input.isNotEmpty) {
      if (input[0] == '*' || input[0] == '/') {
        throw CalculatorException(text: 'Line cannot start with * or /');
      }
    }

    for (int i = 0; i < input.length; ++i) {
      final char = input[i];
      if (operationsRegExp.hasMatch(char)) {
        finalValues.add(tempNumber);
        tempNumber = '';
        finalValues.add(char);
      } else {
        tempNumber = '$tempNumber$char';
        if (i == input.length - 1) {
          finalValues.add(tempNumber);
        }
      }
    }
    return finalValues;
  }

  bool canParseLine(String line) {
    if (line.isNotEmpty) {
      if (line[0] == '*' || line[0] == '/') {
        return false;
      }

      return true;
    } else {
      return false;
    }
  }
}
