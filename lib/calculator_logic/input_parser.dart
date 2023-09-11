import 'package:calculator_app/core/base_operation.dart';
import 'package:calculator_app/core/calculator_exception.dart';
import 'package:calculator_app/calculator_logic/expression_dto.dart';
import 'package:calculator_app/calculator_logic/operations/operations.dart';

class InputParser {
  BaseOperation parseOperation(String operation) {
    final BaseOperation parsedValue = switch (operation) {
      '+' => AddOperation(),
      '-' => SubOperation(),
      '*' => MulOperation(),
      '/' => DivOperation(),
      '%' => ModOperation(),
      _ => throw CalculatorException(text: 'No such operation'),
    };

    return parsedValue;
  }

  ExpressionDto parseLine(String input) {
    final unorderedOperations = RegExp(r'[*/%]');
    final orderedOperations = RegExp(r'[+\-]');
    final allOperations = RegExp(r'[+\-*/%]');

    // Check if can parse
    if (input.isNotEmpty) {
      if (unorderedOperations.hasMatch(input[0])) {
        throw CalculatorException(text: 'Line cannot start with *, /, +, -, %');
      } else if (allOperations.hasMatch(input[input.length - 1])) {
        throw CalculatorException(text: 'Line cannot end with *, /, +, -, %');
      }
    } else {
      throw CalculatorException(text: 'Line is empty');
    }

    String tamperedInput = input;
    final List<double> splitNumbers = [];
    final List<BaseOperation> splitOperations = [];
    String tempNumber = '';
    if (input[0] == '-') {
      splitNumbers.add(-1);
      splitOperations.add(MulOperation());
      tamperedInput = tamperedInput.substring(1);
    }

    for (int i = 0; i < tamperedInput.length; ++i) {
      final char = tamperedInput[i];
      if (allOperations.hasMatch(char)) {
        if (tempNumber.isNotEmpty) {
          splitNumbers.add(double.parse(tempNumber));
          tempNumber = '';
        }
        splitOperations.add(parseOperation(char));
      } else {
        tempNumber = '$tempNumber$char';
      }
    }

    if (tempNumber.isNotEmpty) {
      splitNumbers.add(double.parse(tempNumber));
    }

    return ExpressionDto(
      values: splitNumbers,
      operations: splitOperations,
    );
  }
}
