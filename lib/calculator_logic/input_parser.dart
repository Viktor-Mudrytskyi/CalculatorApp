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
    final unorderedOperations = RegExp(r'[*/%]');
    final orderedOperations = RegExp(r'[+\-]');

    if (input.isNotEmpty) {
      if (input[0] == '*' || input[0] == '/') {
        throw CalculatorException(text: 'Line cannot start with * or /');
      }
    }

    List<String> splitInput = [];
    String tempNumber = '';
    for (int i = 0; i < input.length; ++i) {
      final char = input[i];
      if (orderedOperations.hasMatch(char)) {
        if (i != 0 && tempNumber.isNotEmpty) {
          splitInput.add(tempNumber);
        }
        if (char == '-') {
          tempNumber = '-';
        } else {
          tempNumber = '';
        }
      } else if (unorderedOperations.hasMatch(char)) {
        splitInput.add(tempNumber);
        splitInput.add(char);
        tempNumber = '';
      } else {
        tempNumber = '$tempNumber$char';
      }
    }
    if (tempNumber.isNotEmpty) {
      splitInput.add(tempNumber);
    }

    final List<ExpressionDto> expressionList = [];
    for (int i = 0; i < splitInput.length; ++i) {
      final String current = splitInput[i];
      if (unorderedOperations.hasMatch(current)) {
        if (i + 1 < splitInput.length) {
          expressionList.add(
            ExpressionDto(
              left: double.tryParse(splitInput[i - 1]) ?? .0,
              right: double.tryParse(splitInput[i + 1]) ?? .0,
              operation: parseOperation(current)!,
            ),
          );
        }
      }
    }
    

    return splitInput;
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
